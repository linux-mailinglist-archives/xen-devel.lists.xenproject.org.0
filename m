Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4845D447C31
	for <lists+xen-devel@lfdr.de>; Mon,  8 Nov 2021 09:45:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223120.385666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk0Gs-0004kI-2e; Mon, 08 Nov 2021 08:44:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223120.385666; Mon, 08 Nov 2021 08:44:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk0Gr-0004hM-Vi; Mon, 08 Nov 2021 08:44:53 +0000
Received: by outflank-mailman (input) for mailman id 223120;
 Mon, 08 Nov 2021 08:44:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S1W/=P3=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1mk0Gq-0004hG-8D
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 08:44:52 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061a.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 229a0586-4070-11ec-9787-a32c541c8605;
 Mon, 08 Nov 2021 09:44:50 +0100 (CET)
Received: from DB6PR07CA0203.eurprd07.prod.outlook.com (2603:10a6:6:42::33) by
 DB9PR08MB7220.eurprd08.prod.outlook.com (2603:10a6:10:2bf::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.11; Mon, 8 Nov 2021 08:44:48 +0000
Received: from DB5EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:42:cafe::60) by DB6PR07CA0203.outlook.office365.com
 (2603:10a6:6:42::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.5 via Frontend
 Transport; Mon, 8 Nov 2021 08:44:48 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT062.mail.protection.outlook.com (10.152.20.197) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14 via Frontend Transport; Mon, 8 Nov 2021 08:44:48 +0000
Received: ("Tessian outbound 6ebd41198c5d:v108");
 Mon, 08 Nov 2021 08:44:48 +0000
Received: from 077d0a968d3b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 37BBE0D5-4B8A-409B-BCD2-EF7978E28FA7.1; 
 Mon, 08 Nov 2021 08:44:41 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 077d0a968d3b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 08 Nov 2021 08:44:41 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB6712.eurprd08.prod.outlook.com (2603:10a6:20b:393::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Mon, 8 Nov
 2021 08:44:33 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8%4]) with mapi id 15.20.4669.016; Mon, 8 Nov 2021
 08:44:33 +0000
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
X-Inumbo-ID: 229a0586-4070-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cl5otp6POmHQuRhU6Onl26NutVRtqwiPHyJhTKOaHOk=;
 b=2QKidr/8gkzO9PjXsqOI52veuVKc5LDwOsfru9Pn2y621Pp90sOKUtFYZEXGSXga/rKbgkAdeBBBNfFxesJ8VDTRjqbNg+VtzyWxh8ikO3D/gPpLin1oD8yEUDdZBVlhY3STa+KHm4Whh35am1dFUN9rP08ldZTi5v+KFwUM/yQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3730e121cd75edf4
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MYUhHGfQMnYLg/CmiNo3b4TOvuIlePGBK61ar+Ms0mmOxqj/lQhnmCk5s/utd59RcFITgbG19ytcrlO59/hHgTG8TLb0DNq8BIhu5DEXLJPG4S3WqJJ4D1ym35oWYDiwuVfEqIIvX0ZZofWrjz2xQCoHQBBo17+1f10AhCSu/ORj2pwTudOQ3aWZLyQy4bKdKh5+QICdSjrMvxWduw4gN/ftVPsTxFG8s7UxjmjN++F08aLx4dXcChKXhZzUmVzQjghyM9FkuBj2Qpg+5BdJDcVYiIuZT4xkM2LJrWtpap6972XTfZY2kkBc7J4yFCuEAPKIqbTjBIICgNDk4Dr9TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cl5otp6POmHQuRhU6Onl26NutVRtqwiPHyJhTKOaHOk=;
 b=S2xCcSrvH57WelId2LMfMTgx96fa6s0YuCTh7JVWkObddAWWJZKkMb//6q6hIB5OzFATp5xrC1cHkGqPnmhHAE9P2QpW2/2bNTOqoANSnHJ8ULCsaPk9lgZfcqto3dvaA/fZDCgnBr791nnO3bfY+ldW4Tx6XHRm+OaVwj7Qeo3uRHijl03WuGP0/x+iAyp66saDszKyIz+ufwNuDHzF4JT2kMXfBiTa2DWWpWPGRmGASAAJ1A0RujU0xFEFqKy/7RNEAaamMBYGQA5JnUMJ9Mo44Q+JdoMfDXN5kAOZIbVjmwmktGUGxKF8gbNPAVNU7SDALSuEnoBS6WROwyn3fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cl5otp6POmHQuRhU6Onl26NutVRtqwiPHyJhTKOaHOk=;
 b=2QKidr/8gkzO9PjXsqOI52veuVKc5LDwOsfru9Pn2y621Pp90sOKUtFYZEXGSXga/rKbgkAdeBBBNfFxesJ8VDTRjqbNg+VtzyWxh8ikO3D/gPpLin1oD8yEUDdZBVlhY3STa+KHm4Whh35am1dFUN9rP08ldZTi5v+KFwUM/yQ=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, "julien@xen.org"
	<julien@xen.org>, Vikram Garhwal <fnu.vikram@xilinx.com>
Subject: Re: [XEN][PATCH v2 1/1] Update libfdt to v1.6.1
Thread-Topic: [XEN][PATCH v2 1/1] Update libfdt to v1.6.1
Thread-Index: AQHX0UQblDQwk25oXUS4+EmFAqHUdKv1BFoAgARSEICAAAC7AA==
Date: Mon, 8 Nov 2021 08:44:33 +0000
Message-ID: <8B35462F-D250-49F8-B0A9-1AE64117ECF6@arm.com>
References: <1636006796-360115-1-git-send-email-fnu.vikram@xilinx.com>
 <1636006796-360115-2-git-send-email-fnu.vikram@xilinx.com>
 <BCD82839-0BBC-4CD6-956B-E4938D9ACB7D@arm.com>
 <8695a5d1-2699-fb0d-539e-c4d20a507dc2@suse.com>
In-Reply-To: <8695a5d1-2699-fb0d-539e-c4d20a507dc2@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 282e762d-36e0-4c6b-7e63-08d9a29405a1
x-ms-traffictypediagnostic: AS8PR08MB6712:|DB9PR08MB7220:
X-Microsoft-Antispam-PRVS:
	<DB9PR08MB7220DF17BCD9AE95FC6E146A9D919@DB9PR08MB7220.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 kls5QqVUydv+kW4Yio+hfDey8G+kUxvoX4N0O/fiuDrzmXxyekJmZvioAk/RvzYY2Wo5Kj7UCG/kT/j+Hev56tCb5W/cvGPS6y6rZT/B+tUls7RDwN/5r90joF9IH/WUS++1rWlyNT0KGWV1NXKMnRKMi849znggqesHjNDkmEFmTLLCdE7ezjJD/zMLH5q/5PyhP+tJBipVe5h3aEq/5yTmOiIfC4xf7WQs2yoPddjMAbOdyKo9AU8vD0M500u7EC/EBa+v/Yli1JrRaN9pDviqgJNzvwrMDw5VOh7r8P618BI3lEu0Su2lLh1gY+XGVBZYXKnsYKyCe60t5ffxOQLBrkbW3B5MtNHvxaTbtddA0ivEkQ/zihKV+jE3g6QWAcspb1qj5t8P/ssUROSNf3Jo/MSRtt77cBRuDDmChcWPnPAu4VoR/dkE7Lx+4vaxMU//YJ+CzMwPtvrxmlg1YcrQSy3VmX1CC9RckJRXjL/nuOdQthtil+H5SNR/IVJ8BCuMkkQtwlXx2jo6f7Qlkk7mGKsrfJMBp9gp9yugyppGV/HBRbOTEG44LWS/cckBLL0J5U2KoVVgWuqVCALqZgh4Nxnvpn/F1H0foJmhCfcAKdG+GQceYsAs2zgLGiDAKN2gzY3vJxYQ3nbIqm2n3fXiSIlfWRuOvEwSiNNlA9aLQkk2CQk2Jc8E6tGJMkSk5psIkHC38RRIGpS0KoSLBghfOc9bckDG7dmnVumZG8AbOP69DJ8Nd17yOvuVokQC
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(54906003)(36756003)(66556008)(66476007)(122000001)(2616005)(66946007)(6486002)(66446008)(33656002)(91956017)(76116006)(2906002)(5660300002)(26005)(64756008)(186003)(15650500001)(508600001)(6916009)(6506007)(53546011)(6512007)(8936002)(38100700002)(316002)(86362001)(8676002)(38070700005)(4326008)(71200400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9C8BE30840A425419AE42560B08F72DD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6712
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	763d4e5b-fc1f-4381-2c3e-08d9a293fcf3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1S2nA5y3JC0NNnDGIRhFyMyHIgSDSFQfa4YerO+zkclt1OqEJ5d2+aNPtxz9TgE7h1gi1u5+Jp6XrpSKnLBpBr+ZgES6JBYe3zxRlRXNRGxayTKyipEiYV++5klS4FvVj2Na3o603TbqixFfMy0Q8x4IJYB+gLzHGdCe3Ri5DToFNQI0UlcTaNYgrAPSjJOwOWuY9G9tTc5XZ5dGns6t/v0uexy+xUdFTw0t7ZRgbYngXf6D26Ij+O2Sb7YlNbH41uSqGZSeX0znqRHkKszWaGEGzbS4Jkxh69r81jrkKr/jukz3i/o1Lqe57t+JvDIOS9aKhXEpYgLBYGBBmcdE1PImh0l6nc+hfoKajmgLZZc/4X/QutXVHRCFQZJNxN7Klhaiu0r5HW2M+ANEDY3E/T6qMBuAI2eJfTrmnpd8t7q/SSov9NrcpbUkz74TcpEPS+1ggfoBVLQoOhfvVjRZg9V/2mKUeUKEwuG6WoPcbURCvB3iwxvfhwrojPpGVRBEYeahXg2PGP0dblqEtBaEkPq5NubGts5lW09F0yhxzX60DM5wiHx4qEIyNBPVC178FKXncIyYVQSGR/gSmK7FDmozLAtkr1qLgoA6bBW3cQOtTSGk+LgEg1MWMzK0ZBw00BL7A5gaDRAuaoWED860spYB1ut2aNvhKkcSvjZN+2+cZWhGSbhiNSi9rsTuEebZhIL5LNiWntv5cWGu4re/Yw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(2906002)(82310400003)(6512007)(15650500001)(4326008)(186003)(5660300002)(26005)(508600001)(8676002)(336012)(54906003)(81166007)(70206006)(2616005)(6862004)(316002)(356005)(33656002)(6506007)(86362001)(6486002)(70586007)(36756003)(53546011)(36860700001)(107886003)(83380400001)(8936002)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2021 08:44:48.2895
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 282e762d-36e0-4c6b-7e63-08d9a29405a1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7220

Hi Jan,

> On 8 Nov 2021, at 08:41, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 05.11.2021 15:43, Bertrand Marquis wrote:
>>> On 4 Nov 2021, at 06:19, Vikram Garhwal <fnu.vikram@xilinx.com> wrote:
>>>=20
>>> Update libfdt to v1.6.1 of libfdt taken from git://github.com/dgibson/d=
tc.
>>> This update is done to support device tree overlays.
>>>=20
>>> A few minor changes are done to make it compatible with Xen:
>>> fdt_overlay.c: overlay_fixup_phandle()
>>>   Replace  strtoul() simple_strtoul() as strtoul() is not available in =
Xen lib
>>>   and included lib.h.
>>>   Change char *endptr to const char *endptr.
>>>=20
>>> libfdt_env.h:
>>>   Changed path for config.h and stdbool.h. Remaining Xen changes to
>>>   libfdt_env.h carried over from existing libfdt (v1.4.0)
>>=20
>> I can confirm that you updated all sources to version 1.6.1 and the chan=
ges
>> are actually limited to what you said here.
>>=20
>> But you forgot to update the version.lds file to sync it (which was done=
 on the
>> previous update to 1.4.0). Could also update version.lds ?
>>=20
>> I can also confirm this is compiling for arm32, arm64 and x86.
>=20
> Since you mention it explicitly, I'm curious: x86? Do you have a
> custom patch in place to enable device tree (and hence libfdt
> building) there?

No I do not, I should have been more clear in my sentence.

I am testing with the patch that the 3 architecture are compiling with
the default config. So in this case for x86 the modified files have not
been compiled but the patch is not breaking x86 build.

Cheers
Bertrand

>=20
> Jan
>=20


