Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7399E5F0B1E
	for <lists+xen-devel@lfdr.de>; Fri, 30 Sep 2022 13:55:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414180.658336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeEcN-0003fe-Ch; Fri, 30 Sep 2022 11:55:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414180.658336; Fri, 30 Sep 2022 11:55:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeEcN-0003cx-9K; Fri, 30 Sep 2022 11:55:47 +0000
Received: by outflank-mailman (input) for mailman id 414180;
 Fri, 30 Sep 2022 11:55:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZrHG=2B=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oeEcM-0003aL-4T
 for xen-devel@lists.xenproject.org; Fri, 30 Sep 2022 11:55:46 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80054.outbound.protection.outlook.com [40.107.8.54])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d060205d-40b6-11ed-9374-c1cf23e5d27e;
 Fri, 30 Sep 2022 13:55:44 +0200 (CEST)
Received: from AS8P189CA0020.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:31f::8)
 by AS1PR08MB7499.eurprd08.prod.outlook.com (2603:10a6:20b:4dc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.19; Fri, 30 Sep
 2022 11:55:42 +0000
Received: from AM7EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:31f:cafe::26) by AS8P189CA0020.outlook.office365.com
 (2603:10a6:20b:31f::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23 via Frontend
 Transport; Fri, 30 Sep 2022 11:55:42 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT012.mail.protection.outlook.com (100.127.141.26) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.17 via Frontend Transport; Fri, 30 Sep 2022 11:55:41 +0000
Received: ("Tessian outbound 937eed45f6ed:v128");
 Fri, 30 Sep 2022 11:55:41 +0000
Received: from 8a43963fe985.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7E318703-57C2-4351-BDAC-5FC3B3C059AD.1; 
 Fri, 30 Sep 2022 11:55:29 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8a43963fe985.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 30 Sep 2022 11:55:29 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PAWPR08MB9471.eurprd08.prod.outlook.com (2603:10a6:102:2e5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 11:55:26 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::29d8:8cbc:8a55:811a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::29d8:8cbc:8a55:811a%4]) with mapi id 15.20.5676.023; Fri, 30 Sep 2022
 11:55:26 +0000
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
X-Inumbo-ID: d060205d-40b6-11ed-9374-c1cf23e5d27e
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=jArTLkhlcgQ0vfjfgK5vX0KRdL0q3b27LUMKInBe/EZ+wCTc7njQR2RMkcQG4AoNRRJEmmR6iRaXVjksqiP3MpD3y/mfFIUZc+AKoQNa3LhZhkTj8A7oWZynea0jhYPlnCGPMBAYRL1aObHaiyzPS98+QNOJ/WQJ2547X9LzmTSvvSlYAqsRgG9tGZdMi9QHwOis7shqGZgtjACHIe2q/lJd/m4u+j8VSZiDFKLaKkgeh/YJZxCfq5KA8+3k7GIyWabEBCWkbLtgnivJ45Hgy18a/UdPwaisMg5K7VuJh0hqIqzFTem2flk11+xc2QvnxqrIoJL1pGNiDLSW7IpEBQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=anL1P0itDgHK7+ScI98pOYbc099ObRlXgl+VxysqEc8=;
 b=SMqBIKUFrZuz1lgaDCZN5ROKeRmZ8minm/3mNtQ/qOq5mr0XmrBHkDxnQoBLUt71Opuodhkm89lqdFDLBJ0qqLS2EwnUecOwm/UQk9HjjM6LNqU7M59Eo5nxjncX5SrFKLl438q9X9m9L8OpLfc//ji8O5thNdEfktGJEjXR+FAv2nmVBsgK0x19j0TKch8xlZAu4llxVIxS3bFSjpPbtoV68HSe+s4YUgUxViOpotMs7vPx2dsi5215EHfUF6+SAL2BikQRcixco63tCZjO815lKo5/MoEYVuytpjtBwKqMnhksK+PkA1a3blUThkkcRZTdJT8Q0nILSaKIVVYKng==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=anL1P0itDgHK7+ScI98pOYbc099ObRlXgl+VxysqEc8=;
 b=7VaZNaAlRqB095bkEhtrFY9WqIiML1IWCBEqAbUzYsBQ8L9pjvm2q0pkSni/T8aBBom9DH66CtsmmMo4gkVvkj0pUALM7yf7EjL6Ocz20Jh3oqHc4h0+vqX+uQeSU1L50fZIxFBVt28VIkBiqEXEebnCgVSdTJ7uswrREJ0cods=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4b63e313d73a78da
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SSwcUQVZq7bfKZJAasAusjHcnJwuyzuq3HW9Uh+P+w9Gf6kweEE7z5n2WE1l1bgqkJVYAvVBGSbvcAmtIgUcytsdHZM53DaCKUJFI9Irx8vlRTVMnh+K9JZzjXxB8ltSAQ7s0939Og3/Z2VtD2H5kGuen4q6iC7+UjMAi8rpCVn9WO2uKbUPuWHynJ6ir8Uc/KWWo0owA0QZeumwPK2piAN9ZUWS6xaKGmX1NcMN3ChGKj0HMGqmXf1L5z/FhbDLPAezM6ztUGsFYDUl+RvDBkD44ZaqEya2jdzNHxB6k/jcK6naRLEHcIv6W76Y4ijwWTJiPU45/Q/v4PURJQGQ1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=anL1P0itDgHK7+ScI98pOYbc099ObRlXgl+VxysqEc8=;
 b=bmEfo0JAosO+AV2pn9GVVE/nsymANbARsh9weCJ37hw53wy8avS7nb5ptEgQkr2hvhd9/oyqSdHgeBpBI2BDeMECwBMMf2vDkft0MC39QPvwdCSIt2C25ZHW4y8WC3tIbno9+Lr5+JM1jjbfz32If/KSUnyWGq5A1148cDzfifrL4nJQiisf91/xe2q8knbRJX/lHKw0y1YUHQhqAeWdXP6e83zoEd83kUlVsyfxadw2E3OiObcr/JYyc7SZ45HLq0m1JiWhgRk7VTVOD9LyI/FZpZ+UN7cP1gY+ChIqWCcLvkGaVH3qQXyTzck44qKGeNYdoI3q3+ojbxSMVJ1qWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=anL1P0itDgHK7+ScI98pOYbc099ObRlXgl+VxysqEc8=;
 b=7VaZNaAlRqB095bkEhtrFY9WqIiML1IWCBEqAbUzYsBQ8L9pjvm2q0pkSni/T8aBBom9DH66CtsmmMo4gkVvkj0pUALM7yf7EjL6Ocz20Jh3oqHc4h0+vqX+uQeSU1L50fZIxFBVt28VIkBiqEXEebnCgVSdTJ7uswrREJ0cods=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <volodymyr_babchuk@epam.com>, Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH][4.17] EFI: don't convert memory marked for runtime use to
 ordinary RAM
Thread-Topic: [PATCH][4.17] EFI: don't convert memory marked for runtime use
 to ordinary RAM
Thread-Index: AQHY1KFdAull5ChokkeaXft6EPXQra333cqA
Date: Fri, 30 Sep 2022 11:55:26 +0000
Message-ID: <CCE6EED2-97C6-4539-A98A-369A0E8FAF9E@arm.com>
References: <cc0fbcb4-5ea3-178c-e691-9acb7cc9a3a7@suse.com>
In-Reply-To: <cc0fbcb4-5ea3-178c-e691-9acb7cc9a3a7@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|PAWPR08MB9471:EE_|AM7EUR03FT012:EE_|AS1PR08MB7499:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e12f89c-b4b8-4dd5-cb4f-08daa2dab324
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 0hdElaNGETxu9zz811R1vak7rp584UCj/dPMyo7x3oq2voXMYFIf90+gA1Up/wBs391DjbI8RnyHv/4/cKLsOZoL/26JFO3u0DAA3wmaV9iEXW9JZEcKL3uehexb+8Izta2me/UYeuG5XIOb42/t5yblfp9NdXkKTEKJl8gA2RFHylcqW6enVCagTdjSYrYeRk6r4l4k84H0Fz93i29EgZwDbjEaL2wDpbifb6S24G6DwCYM/3XTETGVbspkwwfEFDJ3xiT0uM7zpnBeQTTPg4X13U7DFxNJXDtZ27EsXMy937i+x4h7tUvMsHDP3iwOTze6/bFjMKF51fTtGs5Gvc60sTgtrU5AfG6e48JOAp+JmMWyQ61pqKvv7W63iBC5e3ZBy9BumupAjcxiHzd49HGfhJlsEm2hAqhCJEzgcmHNy0c0raUxHDhl8F4vQCyFUODl0h8Ld3Ni0X6NeXWPMpx7D43WwY+SZLB4DfY5YnjcV/P2ejcOI/bLbmnKfHIJ7vLhg/EH/B3OLDDDFaePRWfZcIq1ZlUaizuqhND2koEsIjPsB4EzC18DfOdB+/dD9Eu7GBdFGGbLqFSkvAMA2laaI3YVXTiy8xHGVK0j4wFB85fEe0mcYEJPS3yGBTXPCgOlio9UhLL3DMr7FUZB3UXq5Gow+KGYm1kNhrJVjBWxcraR0SOYRG//yrbmvDr3lrDzxSpc/XJSsg1vVcIC1x4fXioKRnfcUbP7Z9j8B/v6B/LatwhbYA84BnknXpZ8ShB9fp6N7p00GRgyI5a/XarEOYO0Vtam4wRisSCc/Ig=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(366004)(396003)(136003)(376002)(451199015)(186003)(2616005)(36756003)(53546011)(2906002)(41300700001)(6512007)(5660300002)(86362001)(26005)(6506007)(38100700002)(122000001)(38070700005)(8936002)(83380400001)(33656002)(478600001)(54906003)(6916009)(316002)(6486002)(4326008)(8676002)(64756008)(66446008)(91956017)(66946007)(76116006)(66556008)(71200400001)(66476007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <ABD828AB4E43DD4EAAA0F1D6977F3F28@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9471
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	050c9c11-e09d-4fc2-9304-08daa2daa9c4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QYfT/6d3E+ORiu4hbz83ZOVxwQIcyZNw/7QW5T17Iy5NOJTfLLWL0Donz9qXin+Owhdbylkt3DYzgMk4gqqsvPi0wfm8zwSHa8RLr1Df8I+JjqZHwzfNpG0OXPyfmPAPxhhqudPX6xIkEgqXge1EU/4kbEiZk+Ter5cp2ySVoT0Mwd+nSkN+kfIU7+a810kdKvnMyVWVSiwKRkFz9gfbRAQ494IVtFvKoNSfG36it3jCVoTy8cK4SNuaHVumB7jJk7187EnIpJdyDmhYd+1oZd5UBu4aLSDhA50UnihnDNLSsSVbuv3eRTyH1LK5HZjtbTvMnGj4TcHTJDZ1WnRegFRSJtyHHerDAefxtDOVU848XbV9ec6+wfDKBJe7iXq+QruFMsKI5i7PBsMeX/72OOjlTs0TY5zVAToFZbpWp1bv0jQpYS5ozkycii7fDsg+lbbDixJIcp6OHTG+makI6EBo/iM1QyLaO6nPUzzfc8ufDJ9vMxkiyjtWFae6TMVZ2qcqidhgCTMrgnwzby8hC65QlkhogFgyHAJ7dCCc+u9GFnZIxiJgWeh9zM6MXzvc7BIRFSZAGrT/DCi9DQ87bov+bFJ32s1fpRh/P2NUcL8tv6Yt83bTXAB4V2Q5TPRspESYC/xXgqtSa4VaK8mCogExzTNyJ8nCFu1xYJqfxhla/WglzIPu+1DLrGz7iFw5gxa0Y11Kaqiq1bElPL00PamriNmIufUX1i6ytZRK7idWq0SMrgqG07DvByI/pov7puAdpkjZoOGys9Ut9JEqSw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(346002)(396003)(376002)(451199015)(46966006)(40470700004)(36840700001)(47076005)(36860700001)(336012)(40460700003)(81166007)(478600001)(33656002)(36756003)(8676002)(6506007)(5660300002)(41300700001)(4326008)(356005)(82740400003)(86362001)(83380400001)(40480700001)(2616005)(2906002)(82310400005)(53546011)(26005)(54906003)(6512007)(8936002)(6862004)(316002)(186003)(70206006)(6486002)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 11:55:41.7668
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e12f89c-b4b8-4dd5-cb4f-08daa2dab324
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7499

Hi Jan,

We will review and test the arm part (even though it is modifying some unus=
ed
 code at the moment) but I wanted to answer you on some questions you have =
..

> On 30 Sep 2022, at 09:50, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> efi_init_memory() in both relevant places is treating EFI_MEMORY_RUNTIME
> higher priority than the type of the range. To avoid accessing memory at
> runtime which was re-used for other purposes, make
> efi_arch_process_memory_map() follow suit. While on x86 in theory the
> same would apply to EfiACPIReclaimMemory, we don't actually "reclaim"
> E820_ACPI memory there and hence that type's handling can be left alone.
>=20
> Fixes: bf6501a62e80 ("x86-64: EFI boot code")
> Fixes: facac0af87ef ("x86-64: EFI runtime code")
> Fixes: 6d70ea10d49f ("Add ARM EFI boot support")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Partly RFC for Arm, for two reasons:
>=20
> On Arm I question the conversion of EfiACPIReclaimMemory, in two ways:
> For one like on x86 such ranges would likely better be retained, as Dom0
> may (will?) have a need to look at tables placed there. Plus converting
> such ranges to RAM even if EFI_MEMORY_WB is not set looks suspicious to
> me as well. I'd be inclined to make the latter adjustment right here
> (while the other change probably would better be separate, if there
> aren't actually reasons for the present behavior).
>=20
> On Arm efi_init_memory() is compiled out, so adjusting Arm code here is
> perhaps more for consistency (not leaving a trap for someone to later
> fall into) than a strict requirement. I wonder though how Arm has
> managed to get away without at least some parts of efi_init_memory() for
> all the years that ACPI support has been present there. I guess this is
> connected to most of runtime.c also being compiled out, but that
> continuing to be the case is another aspect puzzling me.

On arm we only use the boot services in Xen and we do not provide
any efi services to dom0. The required info is passed through a simple devi=
ce
tree.
There was a discussion on that subject some weeks ago and it is still an op=
en
point to be solved.
Also APCI is officially unsupported on arm.

Cheers
Bertrand

>=20
> --- a/xen/arch/arm/efi/efi-boot.h
> +++ b/xen/arch/arm/efi/efi-boot.h
> @@ -183,13 +183,15 @@ static EFI_STATUS __init efi_process_mem
>=20
>     for ( Index =3D 0; Index < (mmap_size / desc_size); Index++ )
>     {
> -        if ( desc_ptr->Attribute & EFI_MEMORY_WB &&
> -             (desc_ptr->Type =3D=3D EfiConventionalMemory ||
> -              desc_ptr->Type =3D=3D EfiLoaderCode ||
> -              desc_ptr->Type =3D=3D EfiLoaderData ||
> -              (!map_bs &&
> -               (desc_ptr->Type =3D=3D EfiBootServicesCode ||
> -                desc_ptr->Type =3D=3D EfiBootServicesData))) )
> +        if ( desc_ptr->Attribute & EFI_MEMORY_RUNTIME )
> +            /* nothing */;
> +        else if ( (desc_ptr->Attribute & EFI_MEMORY_WB) &&
> +                  (desc_ptr->Type =3D=3D EfiConventionalMemory ||
> +                   desc_ptr->Type =3D=3D EfiLoaderCode ||
> +                   desc_ptr->Type =3D=3D EfiLoaderData ||
> +                   (!map_bs &&
> +                    (desc_ptr->Type =3D=3D EfiBootServicesCode ||
> +                     desc_ptr->Type =3D=3D EfiBootServicesData))) )
>         {
>             if ( !meminfo_add_bank(&bootinfo.mem, desc_ptr) )
>             {
> --- a/xen/arch/x86/efi/efi-boot.h
> +++ b/xen/arch/x86/efi/efi-boot.h
> @@ -185,7 +185,9 @@ static void __init efi_arch_process_memo
>             /* fall through */
>         case EfiLoaderCode:
>         case EfiLoaderData:
> -            if ( desc->Attribute & EFI_MEMORY_WB )
> +            if ( desc->Attribute & EFI_MEMORY_RUNTIME )
> +                type =3D E820_RESERVED;
> +            else if ( desc->Attribute & EFI_MEMORY_WB )
>                 type =3D E820_RAM;
>             else
>         case EfiUnusableMemory:


