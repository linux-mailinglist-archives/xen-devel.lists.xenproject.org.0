Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F291553E3F6
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jun 2022 11:40:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.342412.567486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ny9D2-00064W-GB; Mon, 06 Jun 2022 09:39:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 342412.567486; Mon, 06 Jun 2022 09:39:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ny9D2-000627-BV; Mon, 06 Jun 2022 09:39:40 +0000
Received: by outflank-mailman (input) for mailman id 342412;
 Mon, 06 Jun 2022 09:39:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W7SY=WN=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1ny9D1-000621-3C
 for xen-devel@lists.xenproject.org; Mon, 06 Jun 2022 09:39:39 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20605.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 938ae22c-e57c-11ec-bd2c-47488cf2e6aa;
 Mon, 06 Jun 2022 11:39:37 +0200 (CEST)
Received: from AS8PR04CA0153.eurprd04.prod.outlook.com (2603:10a6:20b:331::8)
 by AM0PR08MB3780.eurprd08.prod.outlook.com (2603:10a6:208:10a::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.16; Mon, 6 Jun
 2022 09:39:33 +0000
Received: from AM5EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:331:cafe::c4) by AS8PR04CA0153.outlook.office365.com
 (2603:10a6:20b:331::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.19 via Frontend
 Transport; Mon, 6 Jun 2022 09:39:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT010.mail.protection.outlook.com (10.152.16.134) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5314.12 via Frontend Transport; Mon, 6 Jun 2022 09:39:33 +0000
Received: ("Tessian outbound 1766a3bff204:v120");
 Mon, 06 Jun 2022 09:39:32 +0000
Received: from d8e439f21f68.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 652818D8-A3A8-4819-A851-6D34197265A2.1; 
 Mon, 06 Jun 2022 09:39:26 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d8e439f21f68.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 06 Jun 2022 09:39:26 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM9PR08MB6307.eurprd08.prod.outlook.com (2603:10a6:20b:2dc::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Mon, 6 Jun
 2022 09:39:24 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5314.019; Mon, 6 Jun 2022
 09:39:23 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 938ae22c-e57c-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=RytXc5vdmD8zrca6CG4UpLAV93kCNwvvM9dFm8vZUQsX+Vq3NBybo9bnJhS6Ia+DClDcb0Sl8HGm5Xn/74sqdBukrmM05PKTzZcVjYBp7VtJsGL3RsE0PpygTXSHY0XiihkrftnHPl0ZiEZDyDZr+e/l7GcNYUmaRF5sf+8AeYydnpUFeHJKEVVdye274hEMzqgtkl3dn9kQJFhjU66K+CJZL5GTq5xfydqIEl63m7TmQTt2uR9QXOqLLbvX+rONWWKfcIxNs0RYzYk1tzIetPBSQZC4UImUM1c+cc2+7iZT0kO0b28pjN4D2FmPTKvFFySOakKvILcIgYM4mLwQWA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ONp9U4zHjzYZ57SmjD3yLd0d6EF2VRvkTdag3n8mqy8=;
 b=U+KnIabnAT7zdRjL07lRCywsiso5GUW38qdAbVaccb+xfRpKz9kYOysCY3nV9RNdSWP8u8cCokwSY3/CfLKY+y6SbFdHsiVLtw0wAFNlPEKnUQ69JMe3X8/9IAeE4pLPPOM/2z3XSdQHJHvS9mNRY7RLvlfpl6JN801f5wtiGQijON8rIICn8evtOqSMQxrrHbcPhRlQn84oeY9b/0Qv3zjeIjrAW5cpSN6OqiSX8TsuKhN/eAsIvH65QHE7hD3ccFcCvHETSTRPN6ZhQYc+a2sxbZZziNVVnT86UMMCBek3745o15G8Kp7rvUq9EL9bhHbshqEfAKpPW+NQHeJTdA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ONp9U4zHjzYZ57SmjD3yLd0d6EF2VRvkTdag3n8mqy8=;
 b=jFP1Nqa050Hv4qVNUIP6H1oQlkglr7o9mNUzpaMj7OQT1/uXJkfAvAxn1lAWXHUeFFyvET2UlVolvGptSV+aW4/DrTH2Oo05GD5vSuInLwL26NI/BNEifsl4wM/RMUzwZ31IGwQ8FRRY9zKA7duqoTKfEZAhIvGGun6EoHiJfPE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: b24ed6c71288ab81
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MA7rftDGnvm+i5/jTW0NSj/d4a3T6jNCx8iRQLono35Q5UowO8MOubUJhe855mPwcLKeOzardC+7rxPaDY8GA3vlusmzG542vHS5erl5BFWtXnuk6xyczU9RG9Vyz2xgaocg8Dh4Sqn/BjQl3/o8pgKtjH26k2mBoFwgEE8Ss1tCq3JitjCr1oxov7auEu5w16J5LhOOQZp0Z3Ro3L5DWwXWYzYaP+x4bpcQRkZiTbw7XzfOI03YeY9EVPkT+VVS1xe4UOkOr69CPpuNZN4+zfaRWnFllIdQggByQGMIzBxpDrHgssbajnGeLtNO+nFbJtj95aMw2tG+Bc1vS/zONA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ONp9U4zHjzYZ57SmjD3yLd0d6EF2VRvkTdag3n8mqy8=;
 b=FBYzU3Zu9slvhQNoHW9LH9eYfa8uRE/tD1iuezPt+oJCUxJHCr0gqSzKJhNI0gehHAvjTk7eEKr2e2amsj+dksuC4hhNBC8Y0ZnIjxlV7gqX7NxBEfiGgutzb+dMTML9gfImp/6RxpM2F0Eoq0fkZzporY+ZosVDyeGt3an4X+tADgSbo8t5hRorz9mqtCr0h6hVJnU2rTmxRJ/RLfcdmRe5rZ0mX0hgn8hKQ0t/EjW/X6A2rns+KzKTMceLY8w9ciuvGG22aWsdH7M0pTrBTyiqUhnqnUkik7D4/gv7t2UkXn+9Tza0UpZlLFGlSq8G7rtoTBUj2+6gD9YXItaTdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ONp9U4zHjzYZ57SmjD3yLd0d6EF2VRvkTdag3n8mqy8=;
 b=jFP1Nqa050Hv4qVNUIP6H1oQlkglr7o9mNUzpaMj7OQT1/uXJkfAvAxn1lAWXHUeFFyvET2UlVolvGptSV+aW4/DrTH2Oo05GD5vSuInLwL26NI/BNEifsl4wM/RMUzwZ31IGwQ8FRRY9zKA7duqoTKfEZAhIvGGun6EoHiJfPE=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 3/4] arm: add ISAR2, MMFR0 and MMFR1 fields in
 cpufeature
Thread-Topic: [PATCH v2 3/4] arm: add ISAR2, MMFR0 and MMFR1 fields in
 cpufeature
Thread-Index: AQHYdNtPuqCIYoKAP0q4q0ryuoAsQK083KqAgAVMOoA=
Date: Mon, 6 Jun 2022 09:39:23 +0000
Message-ID: <FE1F683F-FD96-4D55-8863-B9DB373CE790@arm.com>
References: <cover.1653993431.git.bertrand.marquis@arm.com>
 <4a0aef106ac7b6c16048ff3554eda1d8b3eab61a.1653993431.git.bertrand.marquis@arm.com>
 <alpine.DEB.2.22.394.2206021738430.2783803@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2206021738430.2783803@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: dfaa5456-001a-49f5-b387-08da47a07658
x-ms-traffictypediagnostic:
	AM9PR08MB6307:EE_|AM5EUR03FT010:EE_|AM0PR08MB3780:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB3780752C24734E4F159D56D99DA29@AM0PR08MB3780.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 EePgj77rxAJYOW7cHkPCRfxMgDpL6CkU7qiN3xmREyCTFnGbM5YBneUC0zDw3pTUdcSPoI1eGtN4ZvaEugxtQ8v4vcHNv5yNYdl0ECftX2/0PTPaXou8fROts+tvYiiRJiqMaW1sKy7I+XvTLs4D5/6cLEyA4CN6FvvhM3Vs4aJKLLP3/CWvEU6eT00lPorDJR34QDYAeATSXdiJVEQwmDSBEK8Ucf44mMzOumVs+JAyscY9H1mU2ede0ki2l69yYig85kY9NzNyRsFMEy4ZMJ5lz/H9kXxGio7MDHxjlhi/1WTg2fwvAvxIyZSoC9s07LA4YLAJm3gBqA/bpSFZMbyvgRcTbPHXwz76ves99xnnQDyd89SHiwOnsRWNRWCWNiVGQ3/FJOHMVnHjsBzDxg0mtVALy/fIIv8nGBxkJ3s2RKx2avzuprhVa0UWrFdT/G7AeGRt7gHF2pDooR/SRoOY1aPMZftFs40F9c9CNsBkISz2ZvKXE4T/p8Pdl8jL538P2duzwCBt/3UeUYSbek2GYprzmDCctjprXd4tAbAV3BmLeCBAgxm8cGJrNYak994x/7hl5h35+MRUDKyWkjcxUAReMczH7h4AxMSLMbvrwvq/d2oRv7BDNkI7r5QqL9BjhIcZEHpuMFl+o3YzON+06ncqtd12r/t50Nsh1xU/Qu8hM+5k2XFkHepoMo9LX3Ss3PNvw+PXIrOsNgFsvxXuXot1qcAFijFyP8fK/1ue5ZI1j5iqdqVQ0RgswiMy
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8936002)(8676002)(4326008)(5660300002)(36756003)(122000001)(38070700005)(91956017)(76116006)(66476007)(64756008)(66556008)(66446008)(66946007)(2906002)(38100700002)(33656002)(316002)(83380400001)(86362001)(6486002)(508600001)(26005)(54906003)(6916009)(53546011)(71200400001)(6512007)(6506007)(186003)(2616005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3479F4905B5C90439208BDDF26A27A70@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6307
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f5ab8134-6bd3-4afa-c13f-08da47a07094
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	elldzaoNHGwx/JWfLwe88At3Ds4T2zKTY4WGJmc1gtJtcGuwwM2LGsxwXmGlrfgLJ+7Ll62MDkJwNIZPImG7Fg1JN/5ofjxNQATtNyPjBcBNyWmpPjuQYGNalwIClCfJ5FzdhIiEoecLdf7SeCF6d4tFJdNGPEzGypEoUmq/+9EQiL5iSohCXbLGzb/EdfmN1+Kb8rF66woB51ywoPp3W0eureO4p0OApoAlBsbK9MbDxyVYsRj7Ip5KPQy4xQHIzV5jVhPQqx/NQ3sRUjmJaSgivnDjCYMDuvQhjZYBh3zdqFaLNSHGsB5oqGV4rxCZZ2nHiYSAu/l8QcqZlMsPVkJtKQWUKkjMY+TfnR5ZiWCTlQO25Wf+8VQ8VS+BzqZzV6pBDVmQG1g79ywujBXJVbmv6JcngF2vWDk3TxFYkeoXn40bIGdrJwK3XQOTkD6/SwGZMlsfoJRDnA5AgdL11tWW5x6n86vlV5WafaaTUeHOFRH7nGFzeCzSCpU6FLjbwrwNVreq4BCxzV7AEOK8LsXvIX7jECYuC2eCBmE/kXqUzH4QV9fBMAUt8pVfzjxjcdix9qWuQyUuLaUY6JLMntaIJ27vEINFH32pY8J8cJvKF4OLN4JoS3kuQgXyvWaBzD8WiWASvjh4YjQV9HgcXR2f93hSdp5Sw9yax9rtk6CT+YtG8PPBdoWymv1dEblg
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(36756003)(356005)(81166007)(336012)(54906003)(6862004)(70586007)(70206006)(2616005)(26005)(316002)(8936002)(6512007)(86362001)(5660300002)(4326008)(8676002)(53546011)(6506007)(82310400005)(186003)(107886003)(36860700001)(33656002)(47076005)(508600001)(83380400001)(6486002)(40460700003)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2022 09:39:33.1741
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dfaa5456-001a-49f5-b387-08da47a07658
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3780

Hi Stefano,

> On 3 Jun 2022, at 02:45, Stefano Stabellini <sstabellini@kernel.org> wrot=
e:
>=20
> On Tue, 31 May 2022, Bertrand Marquis wrote:
>> Complete AA64ISAR2 and AA64MMFR[0-1] with more fields.
>> While there add a comment for MMFR bitfields as for other registers in
>> the cpuinfo structure definition.
>>=20
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> ---
>> Changes in v2:
>> - patch introduced to isolate changes in cpufeature.h
>> - complete MMFR0 and ISAR2 to sync with sysregs.h status
>> ---
>> xen/arch/arm/include/asm/cpufeature.h | 28 ++++++++++++++++++++++-----
>> 1 file changed, 23 insertions(+), 5 deletions(-)
>>=20
>> diff --git a/xen/arch/arm/include/asm/cpufeature.h b/xen/arch/arm/includ=
e/asm/cpufeature.h
>> index 9649a7afee..57eb6773d3 100644
>> --- a/xen/arch/arm/include/asm/cpufeature.h
>> +++ b/xen/arch/arm/include/asm/cpufeature.h
>> @@ -234,6 +234,7 @@ struct cpuinfo_arm {
>> union {
>> register_t bits[3];
>> struct {
>> + /* MMFR0 */
>> unsigned long pa_range:4;
>> unsigned long asid_bits:4;
>> unsigned long bigend:4;
>> @@ -242,18 +243,31 @@ struct cpuinfo_arm {
>> unsigned long tgranule_16K:4;
>> unsigned long tgranule_64K:4;
>> unsigned long tgranule_4K:4;
>> - unsigned long __res0:32;
>> -
>> + unsigned long tgranule_16k_2:4;
>> + unsigned long tgranule_64k_2:4;
>> + unsigned long tgranule_4k:4;
>=20
> Should be tgranule_4k_2:4

Right I will fix that.

>=20
>=20
>> + unsigned long exs:4;
>> + unsigned long __res0:8;
>> + unsigned long fgt:4;
>> + unsigned long ecv:4;
>> +
>> + /* MMFR1 */
>> unsigned long hafdbs:4;
>> unsigned long vmid_bits:4;
>> unsigned long vh:4;
>> unsigned long hpds:4;
>> unsigned long lo:4;
>> unsigned long pan:4;
>> - unsigned long __res1:8;
>> - unsigned long __res2:28;
>> + unsigned long specsei:4;
>> + unsigned long xnx:4;
>> + unsigned long twed:4;
>> + unsigned long ets:4;
>> + unsigned long __res1:4;
>=20
> hcx?
>=20
>=20
>> + unsigned long afp:4;
>> + unsigned long __res2:12;
>=20
> ntlbpa
> tidcp1
> cmow
>=20
>> unsigned long ecbhb:4;
>=20
> Strangely enough I am looking at DDI0487H and ecbhb is not there
> (D13.2.65). Am I looking at the wrong location?

Right now I declared here only the values which have a corresponding
declaration in sysregs.h
If I add more fields here we will not be in sync with it anymore.

And on ecbhb it will be in the next revision of the manual yes.


>=20
>=20
>> + /* MMFR2 */
>> unsigned long __res3:64;
>> };
>> } mm64;
>> @@ -297,7 +311,11 @@ struct cpuinfo_arm {
>> unsigned long __res2:8;
>>=20
>> /* ISAR2 */
>> - unsigned long __res3:28;
>> + unsigned long wfxt:4;
>> + unsigned long rpres:4;
>> + unsigned long gpa3:4;
>> + unsigned long apa3:4;
>> + unsigned long __res3:12;
>=20
> mops
> bc
> pac_frac
>=20
>=20
>> unsigned long clearbhb:4;
>=20
> And again this is not described at D13.2.63. Probably the bhb stuff
> didn't make it into the ARM ARM yet.

As said before, are you ok with only adding stuff declared in sysregs
to make it simpler to sync with Linux ?

Cheers
Bertrand

>=20
>=20
>>=20
>> unsigned long __res4:32;
>> --=20
>> 2.25.1


