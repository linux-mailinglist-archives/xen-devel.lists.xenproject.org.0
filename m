Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C004761398C
	for <lists+xen-devel@lfdr.de>; Mon, 31 Oct 2022 16:00:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.433018.685820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opWGu-0006ay-3L; Mon, 31 Oct 2022 15:00:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 433018.685820; Mon, 31 Oct 2022 15:00:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opWGu-0006Xh-0O; Mon, 31 Oct 2022 15:00:16 +0000
Received: by outflank-mailman (input) for mailman id 433018;
 Mon, 31 Oct 2022 15:00:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X+oh=3A=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1opWGs-0006Xb-Si
 for xen-devel@lists.xenproject.org; Mon, 31 Oct 2022 15:00:14 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2070.outbound.protection.outlook.com [40.107.20.70])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8eb521a-592c-11ed-91b5-6bf2151ebd3b;
 Mon, 31 Oct 2022 16:00:13 +0100 (CET)
Received: from DB7PR02CA0012.eurprd02.prod.outlook.com (2603:10a6:10:52::25)
 by GV2PR08MB8049.eurprd08.prod.outlook.com (2603:10a6:150:ae::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Mon, 31 Oct
 2022 15:00:11 +0000
Received: from DBAEUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:52:cafe::90) by DB7PR02CA0012.outlook.office365.com
 (2603:10a6:10:52::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15 via Frontend
 Transport; Mon, 31 Oct 2022 15:00:11 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT058.mail.protection.outlook.com (100.127.142.120) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5769.14 via Frontend Transport; Mon, 31 Oct 2022 15:00:10 +0000
Received: ("Tessian outbound f394866f3f2b:v130");
 Mon, 31 Oct 2022 15:00:10 +0000
Received: from a7f2a70ab37b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8A98A25D-EA2F-4532-A313-78C6243AFD71.1; 
 Mon, 31 Oct 2022 15:00:04 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a7f2a70ab37b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 31 Oct 2022 15:00:04 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DU2PR08MB10261.eurprd08.prod.outlook.com (2603:10a6:10:46e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16; Mon, 31 Oct
 2022 15:00:02 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad%7]) with mapi id 15.20.5769.014; Mon, 31 Oct 2022
 15:00:01 +0000
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
X-Inumbo-ID: b8eb521a-592c-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=kba6PY6IzRvlptX5K/yv0iHY4ETQMry/mR0QInrR2jDK3oSncfiAhOXMRxrtjMIsC5vOTuRF9HKQHB23V2n4QTRgb42pqe8wKuiS0pr2ewJuNQp+QQBsAtQCwXw44RVa5liLDuipHxwxRgIMabsY9Fps39MGIDt/cIeQ4kETFNxmYT5c+gjk5SNs53p/82SKNW+9VOeJQPVmpgRr+ZqXQoKhF/4CPfOTPusqD5h2AITKHcJp9i/0hAIQ0VIdC5PzBDYYtnPTlBazhgQfECg0WERLcteYTxl9h4NoDj3A7wV5p7NZiqjCNwW84sVfi1VvAgpQm/5o+jWQBppt4AwoDw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PcIwLfFsTcCfDGttnp6HWQYe3p86ho45mqY8hci0/2k=;
 b=DXURZA3+h0n4DDYwzI//Ea/a8aWIjMer36cbY2JF4szV8wYCz4Tp2Ppx/CtEhxTbaHu7FIF6xxCU7mAHCyXwNBLXgAELF3+y4UW9MSxf2nlm9mubUV3zNxEMBUIBscB+V0+YS3XuWNM20mrf3XSgcCrenX7AcNgG3m9BZ9Ga69QHWj3teqoZ9gDekZnTDk2fddFwgNWMMVrBjrRg61EfxYodXRYEdIrMVgn4EI3aTY/2zEYYPgZKote1UD0i8/xgDbtnhXUG860Nhj45i1iXndX1j2NmLTgARI0GLIzmJvjixHL0fTM7Tl6ltZKGh9pZXajCaUy+OlGLJSg6IddUZA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PcIwLfFsTcCfDGttnp6HWQYe3p86ho45mqY8hci0/2k=;
 b=5TWi7jMTHh2gHeaUxMIpCo5Renn6qAePm95ccsEPPxEdV3ScBlVfL1zMbzu3VIrNtdDnGpLGEnu+PUpdNs9KxOsotEySMsu/gUTsHs/vr+zkjEIgMQdF8I+w2xgGuwL3H8MgFGsDS3SO0bfjKhYdLm6ulh5CZGTb+KZS+CeYDX8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: eb4fe5b6cc203de5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NLVE5KownaD7hnUFvqM9v1TrhInkLhSgHq8U6U5sXpr0qnPT4DywJMlRnvG/SIAlg+DcIHDKKAfOlBm6K+1/XFFwr9hqkBOGWIl7N0kd+2T2KNI/MEhzSIxdzvZdWkmNMlIpGSU7koYwo450gsgO3hAETHxLtH9NviLuXZtBFfn1CuJ1MwnKVSWKYKzi82skskDj7Lb6TAUuFAfqAS4v6W80eZXYIOTsUjIdvowxbRsH/I94A0uaqSqGqBJr4sk84St8iA++Ii5PKH+IWlWwdBYD5oRVMqvHR3uMq7js66saLDTXZ3Ds/dXg0JRgn9nHpk2J+cxQWngPsSIgEJwiHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PcIwLfFsTcCfDGttnp6HWQYe3p86ho45mqY8hci0/2k=;
 b=JO3xdXO3a/8owKK8VevqE/z3hoXo9dxaeF4YsSS2317XSLkNojnRy4BtH2r3DBk/x4tEcLU724Ch/2SMFqC9fsWIfEESX8l1JKHloTbYm+7xkKS/F/yfG34F78aYhHdTBO2jKh5rEj/cCtF9YcgfK14JkVuWtLalStWoudhpE3s+4Oj3bGEoYhH7LzO+JUFAwobSASga+Dba60/+vi3MGq2m6/RQ8fVCxGKpj0EN2+SeCck3/5fvTwb4FbVXIg/YdUsZ0CuySLu5U9WNm96y/7XX11rGcACeN3zvfFRJRJ26HwUKZ43ELYK+pJ9nM3JKD5C0FG8Q8AmL2AZce/FGng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PcIwLfFsTcCfDGttnp6HWQYe3p86ho45mqY8hci0/2k=;
 b=5TWi7jMTHh2gHeaUxMIpCo5Renn6qAePm95ccsEPPxEdV3ScBlVfL1zMbzu3VIrNtdDnGpLGEnu+PUpdNs9KxOsotEySMsu/gUTsHs/vr+zkjEIgMQdF8I+w2xgGuwL3H8MgFGsDS3SO0bfjKhYdLm6ulh5CZGTb+KZS+CeYDX8=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Doug
 Goldstein <cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3 0/4] Yocto Gitlab CI
Thread-Topic: [PATCH v3 0/4] Yocto Gitlab CI
Thread-Index: AQHY7TFh2hDh7VPqHUGkPo4tUdJZza4okuGAgAAFoQA=
Date: Mon, 31 Oct 2022 15:00:01 +0000
Message-ID: <D1248F50-542B-474D-B016-A3BF09A21CE8@arm.com>
References: <cover.1667224593.git.bertrand.marquis@arm.com>
 <1220596a-4fe7-5c08-5437-fa98eb14254c@amd.com>
In-Reply-To: <1220596a-4fe7-5c08-5437-fa98eb14254c@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DU2PR08MB10261:EE_|DBAEUR03FT058:EE_|GV2PR08MB8049:EE_
X-MS-Office365-Filtering-Correlation-Id: b596ccfb-bbf8-43d8-1212-08dabb509b8b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 OZA69K8hTUAg67/1eWo+NGE/GtDfWQKZYpQAvhIld7u1dyWRb8ielBVCBJ+kKAcqmNR6bicmRIjd5ON2DJxnREHfsGax3a5O7kmaJVgwLqd2OWiqa/OzGqZO2mOYjp1j4Cj6bsjzEP84HdiMMTs1Cw8vjyWobC5vtBE8IaQASpEyWmQa3ESaGHL2FniBTF3P5AnOaPY/i8SDQ29mXtGsLYhUzv5HWW61ALi2TyC75c6SUKkaM18qnDQ/j39AauqDslow/3UNeNeBZLyNDW3tpHcD+7/YsTpAQHNiaLiF/Ntzmb8pEp9HmSlCPEMHmBWaTfFrrS9PlEfiPZ0WVNbg92hhKhZZajdVKn8hvSjOTfi8HewZ98QYDbzoHCl5hy/WANzA7sQyAi7wwD9TO2VmRTQLsMbADc9JmnkKBJJIsuXZtj03241Vw8RnKDAhZRl87IK2jPTyS/5e828TyehdtxwdV7pD2qwcFDImGKqN8+k6k1aP8oOkGPq+WK26w5H90in7nVpDsLdhfJcG1thXsB+oqZbSBn19KY8VklozGpCy2DQ8NgWTRLyyUgxfY5XGzO+AXt57+AadkZycsUWCfRFEyfYjH3FyUYFxiAkpq23I6L1XX4rhAbt3utkfDpEsfPo2zMxycaRmkmdC8iM41fHbqXyQh4T5T6P4UUjM7AeZa+2XkCvPDI69loaCy5Qw+AhCAEXUl55VnrpxctStwiK1M8vkjoBMD/Co6yi8Dafi34NqtFbpvDSwujxlNTTAV+rZKj4Tz03AeKdOVoGXZzyMIRnmpuDJONm9lFUkSik=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(136003)(346002)(376002)(39860400002)(451199015)(66556008)(66946007)(2906002)(26005)(6512007)(8936002)(64756008)(53546011)(6506007)(41300700001)(66446008)(8676002)(54906003)(91956017)(4326008)(66476007)(6916009)(71200400001)(478600001)(316002)(76116006)(6486002)(186003)(5660300002)(2616005)(86362001)(38070700005)(36756003)(33656002)(122000001)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0C6EBB9C7CBC294AA0F06CBB7332864E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10261
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3fdcfb7d-47d3-4e13-a380-08dabb5095e4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	viAhhYRTgpcchq7JoK55pEtTJgvgGyjWa7WP5IWLqLLHpM7rJGE6Cek7h/IM2v2WWlROllzO05nWk506pZzBefZKnUaBJl1fJHB4kwJ2m6oWIKKxqMJ5US71Bmb7BNiEgyGzbTMA8T7lUl1NBaHs24in/JEXYi7eNCADNBQC3l0a1ukE6x9CZD1uW3mkKEXVZeViGytbhQpFA2/qO1e0HSi+5A4Bg0nQwa4xAiIeGKsR1usRO5+dQYiBLwRnK0MBXi5lpMpTHkjpquSmRQHidji68hGlqq+fiKA4PY0B7lY5bshCXGEgupyd6i2zm0rn6bp9qDgAk/u+n3XsLYiHLz/A+5Wv8xG7p+aYa/1mBB5ZXd/iakINZQSrgJrVFcH6FgN22i4NcIA4LBO30mQ9Pqn3qV+qprjm2WYdxqTgTZqP01wm7n3r+RWzPcWNjWQPw3XNIOsAYLoM9wCa6ZclytprQgvVQcpDtM65AJowJNFjZC+AxqpT0zLdpvLJpriUp82OKJ+6QLvbefCCvqNW147QT1vv90EihXTLB81xxDN7yKy3iq9ip9w7sdbVRTIN55QeVrWPCtbn0/jBZH48vjXZF3sP8qiY0UCPtzdwZEXlgEa/l0GauviwV/unUwvrtAXMBQu0IsbNzT7No9oBfsEYBO3Fguj0J0c0xMbFjdJvYapYhmjP3u9gNT2XzLf7PkL4nvscrStCdB5exik3Wu62aGqXFW8NM8YBaxpQOEJ0090Bu11OJGh6ix7BqbCCPfp6mNb2BPWL1NcTAaJb6g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(136003)(39860400002)(376002)(451199015)(36840700001)(46966006)(40470700004)(36756003)(33656002)(86362001)(82740400003)(81166007)(356005)(26005)(186003)(47076005)(40480700001)(107886003)(40460700003)(53546011)(6512007)(36860700001)(478600001)(6506007)(2616005)(336012)(82310400005)(8936002)(6486002)(2906002)(316002)(4326008)(70586007)(8676002)(41300700001)(70206006)(5660300002)(6862004)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2022 15:00:10.7706
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b596ccfb-bbf8-43d8-1212-08dabb509b8b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8049

Hi Michal,

> On 31 Oct 2022, at 14:39, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> Hi Bertrand,
>=20
> On 31/10/2022 15:00, Bertrand Marquis wrote:
>>=20
>>=20
>> This patch series is a first attempt to check if we could use Yocto in
>> gitlab ci to build and run xen on qemu for arm, arm64 and x86.
>>=20
>> The first patch is creating a container with all elements required to
>> build Yocto, a checkout of the yocto layers required and an helper
>> script to build and run xen on qemu with yocto.
>>=20
>> The second patch is creating containers with a first build of yocto done
>> so that susbsequent build with those containers would only rebuild what
>> was changed and take the rest from the cache.
>>=20
>> The third patch is adding a way to easily clean locally created
>> containers.
>>=20
>> This is is mainly for discussion and sharing as there are still some
>> issues/problem to solve:
>> - building the qemu* containers can take several hours depending on the
>>  network bandwith and computing power of the machine where those are
>>  created
> This is not really an issue as the build of the containers occurs on the =
local
> machines before pushing them to registry. Also, building the containers
> will only be required for new Yocto releases.
>=20
>> - produced containers containing the cache have a size between 8 and
>>  12GB depending on the architecture. We might need to store the build
>>  cache somewhere else to reduce the size. If we choose to have one
>>  single image, the needed size is around 20GB and we need up to 40GB
>>  during the build, which is why I splitted them.
>> - during the build and run, we use a bit more then 20GB of disk which is
>>  over the allowed size in gitlab
> As we could see during v2 testing, we do not have any space restrictions
> on the Xen GitLab and I think we already decided to have the Yocto
> integrated into our CI.

Right, I should have modified this chapter to be coherent with your latest =
tests.
Sorry for that.

>=20
> I will do some testing and get back to you with results + review.

Thanks

Cheers
Bertrand

>=20
> ~Michal


