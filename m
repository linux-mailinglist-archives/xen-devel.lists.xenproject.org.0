Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 276F3534FC0
	for <lists+xen-devel@lfdr.de>; Thu, 26 May 2022 15:06:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337626.562279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuDAx-0000iY-5N; Thu, 26 May 2022 13:05:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337626.562279; Thu, 26 May 2022 13:05:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuDAx-0000fv-1z; Thu, 26 May 2022 13:05:15 +0000
Received: by outflank-mailman (input) for mailman id 337626;
 Thu, 26 May 2022 13:05:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=paGh=WC=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nuDAv-0000fp-BB
 for xen-devel@lists.xenproject.org; Thu, 26 May 2022 13:05:13 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on061a.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 79aee57e-dcf4-11ec-837f-e5687231ffcc;
 Thu, 26 May 2022 15:05:12 +0200 (CEST)
Received: from DU2PR04CA0054.eurprd04.prod.outlook.com (2603:10a6:10:234::29)
 by VE1PR08MB5869.eurprd08.prod.outlook.com (2603:10a6:800:1b2::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Thu, 26 May
 2022 13:05:08 +0000
Received: from DBAEUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:234:cafe::3b) by DU2PR04CA0054.outlook.office365.com
 (2603:10a6:10:234::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Thu, 26 May 2022 13:05:08 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT038.mail.protection.outlook.com (100.127.143.23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5293.13 via Frontend Transport; Thu, 26 May 2022 13:05:07 +0000
Received: ("Tessian outbound 361d68419a2f:v119");
 Thu, 26 May 2022 13:05:07 +0000
Received: from 93ea2d3eefb9.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7AA5356A-0180-45D4-8C9B-CA5F1955BC7C.1; 
 Thu, 26 May 2022 13:05:01 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 93ea2d3eefb9.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 26 May 2022 13:05:01 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by VI1PR08MB3166.eurprd08.prod.outlook.com (2603:10a6:803:42::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.17; Thu, 26 May
 2022 13:04:59 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5273.023; Thu, 26 May 2022
 13:04:59 +0000
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
X-Inumbo-ID: 79aee57e-dcf4-11ec-837f-e5687231ffcc
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=a+Li1gpV1JX4wx8Rl9pipUBBg9iyBXfA88gktk3+OipbniDDMws0hpkQ3mh/XCnt1xGVSnHP9JXsGxeeFUD5bB/bOZHv6eTA6sZRq+0K/qYGldOEd4b3kgJGd+0/aeafyhg+pUU8zFOwuwTW6vbAksAKOWVOGQ1oqjusMWutv2StG//pDIzIoFsHpiL+u+Ss7gs2vakHBl7AyOgbhYn6f/mcK5dycYKosaaSer3NUUW7YR5wJIP5PuG1f0gWtrZLYqHOzmOBR8sRlnnc4C34/NC18M9Bv+Ca8tcK+nin3o1Wc2LUQ38xQGbkpO24ObuUZID4RDvVxwAMpFAYT+AAJA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7jay3+7lyNDMyBDzDj/eGQXTyToY8fHMYY10srTpnBY=;
 b=JAq/PTFYBx3lJtBGh0NsXe0O3zyRGGq87Sf7a04qw5oxD4V/l6aBLWE5tFXrOJ/QOxtwn8YsICbSu4iXe0lAEMocH+MPKX7iiA2Qg2YO6s97lmDJy+gYHzlic7hX+CVZYc+OqQdYY44fUbVeLo5zrUPEes6c1JmkQfp9/JGB4u87j7DFkdBXdpQJm4KGGvRltEGGLtQoOdv98rKbnEtgX5WGLojBS0U3CQH7YVt68TQfu4mNK/zKQjJRAGAL54RYFIC5slepJ7pOmDjnrupDhQBaOWk7Myo+hCdputfS/MS5kGEnusyRXuNMXUL865XTrhL6aKIZXr1WCl7Ps86Tqw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7jay3+7lyNDMyBDzDj/eGQXTyToY8fHMYY10srTpnBY=;
 b=Ro5WTmTB7nbnc5zoHUrZlNuoTozq1DHCm5H7gNsg4uq/PZvDUgsrlCVRqd3iNN/aNEpzTNElyRtK8+KC2vT5jSzQ45ezqy7o2m/8SGmNHJNwtacsdBXZx3xPgkqDVAqPF294G24gf/Y7tJhx/N8lRedRo0c5FVODVFcEoHntVuY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: a8cb319dfa5a5d28
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XGqQ/SMISuo5BXWNGl3VbmJL8bjcuhywdAnNLCjYOg/m/JUTKWGctxSJlTWkE2yRE9qxwStWqqB5J368NssQUdvgzLypd1Y1vfwHnh9UERVvlB7AYMn4khStYa8J6zkY5WklmcFj9ReBcFRfdGWYgTsE8VkjfaXdG00l6rpn1hv8FNbRSsGLV5jUr9jt1eae6o9GU/QFR5+JTeyGrBCI3s9vuTVKGoFY0yoLRmTbif3aplQOa2dfI/NiR0CSH//62VqhRrBBDDCIY0s+GL78TWXuaAg031AsdcsEhCOLGhFwSNzAyftsGFXredFAuK8/2OY3PlYnyZUAaUXiI3Y0ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7jay3+7lyNDMyBDzDj/eGQXTyToY8fHMYY10srTpnBY=;
 b=RQ73MFKATlijdIGlxOO7MmKY6M/Q1aIfyT2sD7gGSik/JS7WAomZkLuJD9wfBKtwC70wr2yjGnDdUUU7Amo5M2IQQgFKVjzrpJC4HMbtvJ5fyYgCULHpDN97Eyp1sXAeJQxCitt4ep/TX1YJxmtTzLpPWJiZlw0xwOJh/t1TNVLAmkFg/qPD8G/zGy5m4668TpB37n7idDrUSmF61g9RR6ULo1RdmEH0sNEixlCrFuq9xPoQ0OC5rvtCd34nCMQD3EZq2mSJ1NFcqPS9hZMHyBbqXhg65+dz25l9czjU3N042rjSSwrU7sKpx43oTzzvQBT8VGDeRqGNJdhG7OYXeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7jay3+7lyNDMyBDzDj/eGQXTyToY8fHMYY10srTpnBY=;
 b=Ro5WTmTB7nbnc5zoHUrZlNuoTozq1DHCm5H7gNsg4uq/PZvDUgsrlCVRqd3iNN/aNEpzTNElyRtK8+KC2vT5jSzQ45ezqy7o2m/8SGmNHJNwtacsdBXZx3xPgkqDVAqPF294G24gf/Y7tJhx/N8lRedRo0c5FVODVFcEoHntVuY=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"roger.pau@citrix.com" <roger.pau@citrix.com>, "George.Dunlap@citrix.com"
	<George.Dunlap@citrix.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH 1/2] docs/misra: introduce rules.rst
Thread-Topic: [PATCH 1/2] docs/misra: introduce rules.rst
Thread-Index:
 AQHYb89Ql1y5oYxB8EW1dQIiqL2u/a0vNXYAgAEjhQCAAJGbAIAAAxAAgAAFpwCAAC97AA==
Date: Thu, 26 May 2022 13:04:58 +0000
Message-ID: <765738F2-97E9-40EF-A50E-2912C7D2A286@arm.com>
References:
 <alpine.DEB.2.22.394.2205241650160.1905099@ubuntu-linux-20-04-desktop>
 <20220525003505.304617-1-sstabellini@kernel.org>
 <a19d22ca-33ef-b348-ac88-490010464bad@xen.org>
 <alpine.DEB.2.22.394.2205251740280.1905099@ubuntu-linux-20-04-desktop>
 <0cf7383d-896e-76f0-b1cc-2f20bd7f368e@suse.com>
 <D9A44AC3-A959-442F-A94C-C9EFB359BEF1@arm.com>
 <da68ca4d-3498-ec6a-7a5d-040f23dd41a6@suse.com>
In-Reply-To: <da68ca4d-3498-ec6a-7a5d-040f23dd41a6@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 08fcf54b-e2ee-4323-bc2f-08da3f185ba7
x-ms-traffictypediagnostic:
	VI1PR08MB3166:EE_|DBAEUR03FT038:EE_|VE1PR08MB5869:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB58697800A5A0F8D7DECFB2A29DD99@VE1PR08MB5869.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 SiNqW169BjW3+h05qGKLyKoz7ZuDdmU7raaVASauII1mdSQ6KAoOrvZqikeUGyFxksH/rTkixhuemfxiiuhe/k9779eTwbhtjPHWh4qokkaa6gEM3mRzTNc4yrzZNifP9QdcZ1UVXoiGnpnEUjhoNFGoIUVR7RUfy9A4TUvcAVI6ieeTmKIe7tInvB4C6yL/3+xyL3s0zPv4CCLzeya9svT0af9eO6MdVIyK9JzTnM5EWLItYE5XxyUQLzmO3VyDUKtneD1jznmrnKjB8m5suy+XzTIud/SFu0MOwQQIR8rLbFrwO6ttdtSsMNYEZMfEToMT6TmLgk1h0jykz4sOaydeOToT8nO9sQ53STR4CjW0U5ZbNG4rXc5dUESUENIzw1wfSJKC2s9U4xGAptXVbV8p8mxLTF/auTqmtNYE5RyoJO9aAXYYCFPN++AfwFEcnhebmSXdFpBSCuRYYFpz0rsRcVi7hGKpB+xkfQjCGjUOH0q7u1hhUb/GcWzem3hvOcHo4UT2jZp3+7lAXhVdy+c3Tb+K8hzfw9zEPQB+1MKIm6AwIfDDCdqut4lamtXzVpjDyYJk7KVusKq1t92G5SubBsR7uw8LLP/eoCr6PTl9N9bvfOXouLWOLWw4CWelIeXe1qlCsk/kUFBI3CHVoH5229ba6vJNfHeAdLmHiQbUanBGXPZEbPLyRxJX8zuJ7y0+XvE1d+sj0tVUSgr50HrJbAbUJvf3Xz+XIUi/F7kWVIVNYOETmDRBSD3AYaH79UoYzRrRDQa2jlPw3K1YnrZZ2K/EkIEdFglMByFTUOIrrL9PyudGUYasrgY53IXo
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6512007)(53546011)(6506007)(186003)(86362001)(2616005)(2906002)(6916009)(54906003)(316002)(33656002)(66446008)(91956017)(76116006)(66556008)(4326008)(66946007)(64756008)(66476007)(8676002)(8936002)(5660300002)(122000001)(83380400001)(38070700005)(38100700002)(26005)(508600001)(6486002)(966005)(36756003)(71200400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <4AB0B17C1B79A5469ACB56C4E1EBCAB6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3166
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e03dff5d-b94a-4c37-ea6d-08da3f185689
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HOTDr+q0MEfdiBOIqwXjFYbbUyJC1WPvGXZATPcYLsbrAaeSOY9gPnDNFi40dJLsnl7ZuoRG4dNsf2Fc0yKsoLKBoUVtowpvEqK2b0PDg6eqKJvKAQLFobR/jUXRcw4zMWJ5mthjdCMbzz6Ktji0JQybrTawDn1sMfEURPTWTtZUTaLV1TWlgXqqbKmx+d73nCjX1Z48dWJ3kLApUsNntdw5w7DcEnBZXH5f2ihgswm1JJE97qAW3qDFJU4XeYqXI9bZTPMyp/WPCfiICBoyjtPXBmP0ei3lr8or5NYKwatbNeunC5kyRmyRVcx7zVDpImIlMKcVh+UGb45YUPGdWe2gWKJQP43qKjhuPjARc2MXqxNgNEK7AgjRTSjqsCB+0hUp2FjJr0PJ/QNlpJFOJdG1MDvr37g2GiqNM52nn53RKzHPr0jCArQkkyajNeXolKL9KsoT9cYciJy/TWylfmy7x+CnipUDcIxKeT0xb75WM64EZecdIprtaPQDzOmm2ymTDs7cjYS38CUWVIxXxU/zm/e3WpXNltMSRGCBXmmAc04Vikd3c0kXVUrbVWIrp2BQIs2VgZQ9pqpYc9NWal7HkiySIIkW8rYTE7IgjRWWje7evhpYh9WtpE3NnWD2BXGASlS+wKQoa18IobQ4PQdGbcP14MLrSLHUGcEEx5cQFZ0fwIIbATrnVK80pNyn4yx3bky1qvqOWfmiifQhDsj/RQbr/tpFpnEkb4FLneRh8whwxZtTw/yP4ulUF1uUUvztgqgRf9KxxlMtUFAS2Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(6862004)(8676002)(47076005)(40460700003)(70206006)(5660300002)(70586007)(4326008)(6512007)(8936002)(356005)(36860700001)(508600001)(83380400001)(33656002)(6486002)(81166007)(966005)(6506007)(316002)(53546011)(186003)(86362001)(54906003)(36756003)(82310400005)(2906002)(26005)(2616005)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2022 13:05:07.5830
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08fcf54b-e2ee-4323-bc2f-08da3f185ba7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5869

SGkgSmFuLA0KDQo+IE9uIDI2IE1heSAyMDIyLCBhdCAxMToxNSwgSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPiB3cm90ZToNCj4gDQo+IE9uIDI2LjA1LjIwMjIgMTE6NTQsIEJlcnRyYW5k
IE1hcnF1aXMgd3JvdGU6DQo+PiBIaSBKYW4sDQo+PiANCj4+PiBPbiAyNiBNYXkgMjAyMiwgYXQg
MTA6NDMsIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6DQo+Pj4gDQo+Pj4g
T24gMjYuMDUuMjAyMiAwMzowMiwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0KPj4+PiBPbiBX
ZWQsIDI1IE1heSAyMDIyLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+Pj4+PiBPbiAyNS8wNS8yMDIy
IDAxOjM1LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+Pj4+Pj4gKy0gUnVsZTogRGlyIDQu
Nw0KPj4+Pj4+ICsgLSBTZXZlcml0eTogUmVxdWlyZWQNCj4+Pj4+PiArIC0gU3VtbWFyeTogSWYg
YSBmdW5jdGlvbiByZXR1cm5zIGVycm9yIGluZm9ybWF0aW9uIHRoZW4gdGhhdCBlcnJvcg0KPj4+
Pj4+IGluZm9ybWF0aW9uIHNoYWxsIGJlIHRlc3RlZA0KPj4+Pj4+ICsgLSBMaW5rOg0KPj4+Pj4+
IGh0dHBzOi8vZ2l0bGFiLmNvbS9NSVNSQS9NSVNSQS1DL01JU1JBLUMtMjAxMi9FeGFtcGxlLVN1
aXRlLy0vYmxvYi9tYXN0ZXIvRF8wNF8wNy5jDQo+Pj4+PiANCj4+Pj4+IA0KPj4+Pj4gLi4uIHRo
aXMgb25lLiBXZSBhcmUgdXNpbmcgKHZvaWQpICsgYSBjb21tZW50IHdoZW4gdGhlIHJldHVybiBp
cyBpZ25vcmVkIG9uDQo+Pj4+PiBwdXJwb3NlLiBUaGlzIGlzIHRlY2huaWNhbGx5IG5vdC1jb21w
bGlhbnQgd2l0aCBNSVNSQSBidXQgdGhlIGJlc3Qgd2UgY2FuIGRvDQo+Pj4+PiBpbiBzb21lIHNp
dHVhdGlvbi4NCj4+Pj4+IA0KPj4+Pj4gV2l0aCB5b3VyIHByb3Bvc2VkIHdvcmRpbmcsIHdlIHdv
dWxkIHRlY2huaWNhbGx5IGhhdmUgdG8gcmVtb3ZlIHRoZW0gKG9yIG5vdA0KPj4+Pj4gaW50cm9k
dWNlIG5ldyBvbmUpLiBTbyBJIHRoaW5rIHdlIG5lZWQgdG8gZG9jdW1lbnQgdGhhdCB3ZSBhcmUg
YWxsb3dpbmcNCj4+Pj4+IGRldmlhdGlvbnMgc28gbG9uZyB0aGV5IGFyZSBjb21tZW50ZWQuDQo+
Pj4+IA0KPj4+PiBBYnNvbHV0ZWx5IHllcy4gQWxsIG9mIHRoZXNlIHJ1bGVzIGNhbiBoYXZlIGRl
dmlhdGlvbnMgYXMgbG9uZyBhcyB0aGV5DQo+Pj4+IG1ha2Ugc2Vuc2UgYW5kIHRoZXkgYXJlIGNv
bW1lbnRlZC4gTm90ZSB0aGF0IHdlIHN0aWxsIGhhdmUgdG8gd29yayBvdXQNCj4+Pj4gYSBnb29k
IHRhZ2dpbmcgc3lzdGVtIHNvIHRoYXQgRUNMQUlSIGFuZCBjcHBjaGVjayBjYW4gcmVjb2duaXpl
IHRoZQ0KPj4+PiBkZXZpYXRpb25zIGF1dG9tYXRpY2FsbHkgYnV0IGZvciBub3cgc2F5aW5nIHRo
YXQgdGhleSBuZWVkIHRvIGJlDQo+Pj4+IGNvbW1lbnRlZCBpcyBzdWZmaWNpZW50IEkgdGhpbmsu
DQo+Pj4+IA0KPj4+PiBTbyBJJ2xsIGFkZCB0aGUgZm9sbG93aW5nIG9uIHRvcCBvZiB0aGUgZmls
ZToNCj4+Pj4gDQo+Pj4+ICIiIg0KPj4+PiBJdCBpcyBwb3NzaWJsZSB0aGF0IGluIHNwZWNpZmlj
IGNpcmN1bXN0YW5jZXMgaXQgaXMgYmVzdCBub3QgdG8gZm9sbG93IGENCj4+Pj4gcnVsZSBiZWNh
dXNlIGl0IGlzIG5vdCBwb3NzaWJsZSBvciBiZWNhdXNlIHRoZSBhbHRlcm5hdGl2ZSBsZWFkcyB0
bw0KPj4+PiBiZXR0ZXIgY29kZSBxdWFsaXR5LiBUaG9zZSBjYXNlcyBhcmUgY2FsbGVkICJkZXZp
YXRpb25zIi4gVGhleSBhcmUNCj4+Pj4gcGVybWlzc2libGUgYXMgbG9uZyBhcyB0aGV5IGFyZSBk
b2N1bWVudGVkIHdpdGggYW4gaW4tY29kZSBjb21tZW50Lg0KPj4+PiAiIiINCj4+PiANCj4+PiBI
bW0sIHNvIHlvdSByZWFsbHkgbWVhbiBpbi1jb2RlIGNvbW1lbnRzLiBJIGRvbid0IHRoaW5rIHRo
aXMgd2lsbCBzY2FsZQ0KPj4+IHdlbGwgKHNlZSBlLmcuIHRoZSBEQ0UgcmVsYXRlZCBpbnRlbmRl
ZCBkZXZpYXRpb24pLCBhbmQgaXQgYWxzbyBnb2VzDQo+Pj4gYWdhaW5zdCB0aGUgIm5vIHNwZWNp
YWwgY2FzaW5nIGZvciBldmVyeSBzdGF0aWMgYW5hbHlzaXMgdG9vbCIgY29uY2Vybg0KPj4+IEkg
ZGlkIHZvaWNlIG9uIHRoZSBjYWxsLg0KPj4gDQo+PiBPbiB0aGlzIHN1YmplY3QgdGhlIGlkZWEg
d2FzIG1vcmUgdG8gZGVmaW5lIGEg4oCceGVu4oCdIHdheSB0byBkb2N1bWVudA0KPj4gZGV2aWF0
aW9ucyBpbiB0aGUgY29kZSBhbmQgZG8gaXQgaW4gYSB3YXkgc28gdGhhdCB3ZSBjb3VsZCBlYXNp
bHkgc3Vic3RpdHV0ZQ0KPj4gdGhlIOKAnGZsYWfigJ0gdG8gYWRhcHQgaXQgZm9yIGVhY2ggYW5h
bHlzZXIgdXNpbmcgdG9vbHMgb3IgY29tbWFuZCBsaW5lIG9wdGlvbnMuDQo+IA0KPiBJIHRoaW5r
IHRoZSBiYXNpYyBzY2hlbWUgb2Ygc29tZXRoaW5nIGxpa2UgdGhpcyB3b3VsZCB3YW50IGxheWlu
ZyBvdXQNCj4gYmVmb3JlIGRvYyBjaGFuZ2VzIGxpa2UgdGhlIG9uZSBoZXJlIGFjdHVhbGx5IGdv
IGluLCBzbyB0aGF0IGl0J3MgY2xlYXINCj4gd2hhdCB0aGUgYWN0aW9uIGlzIGlmIGEgbmV3IGRl
dmlhdGlvbiBuZWVkcyBhZGRpbmcgZm9yIHdoYXRldmVyIHJlYXNvbg0KPiAoYW5kIGFsc28gYWxs
b3dpbmcgaW50ZXJlc3RlZCBwZW9wbGUgdG8gc3RhcnQgY29udHJpYnV0aW5nIHBhdGNoZXMgdG8N
Cj4gYWRkIHJlc3BlY3RpdmUgYW5ub3RhdGlvbnMpLg0KDQpXZSB3aWxsIHdvcmsgb24gdGhhdCBi
dXQgaWYgd2Ugd2FpdCBmb3IgZXZlcnl0aGluZyB0byBiZSBzb2x2ZWQgd2Ugd2lsbA0KbmV2ZXIg
cHJvZ3Jlc3MuDQpJIGhhdmUgYSB0YXNrIG9uIG15IHNpZGUgKGllIGF0IGFybSkgdG8gd29yayBv
biB0aGF0IGFuZCBMdWNhIEZhbmNlbGx1DQp3aWxsIHN0YXJ0IHdvcmtpbmcgb24gaXQgbmV4dCBt
b250aC4NCk5vdyBJIGRvIG5vdCB0aGluayB0aGF0IHRoaXMgc2hvdWxkIGJsb2NrIHRoaXMgcGF0
Y2gsIGFncmVlaW5nIG9uIHJ1bGVzIGRvZXMNCm5vdCBtZWFuIHdpbGwgcmVzcGVjdCBhbGwgb2Yg
dGhlbSBpbiB0aGUgc2hvcnQgdGVybSBzbyB3ZSBjYW4gd2FpdCBhIGJpdCBhcyBJDQpkZWZpbml0
ZWx5IHRoaW5rIHRoYXQgaG93IHRvIGRvY3VtZW50IHZpb2xhdGlvbnMgaW4gdGhlIGNvZGUgYW5k
IGluIGdlbmVyYWwNCndpbGwgYmUgYSB3b3JrIHBhY2thZ2Ugb24gaXRzIG93biBhbmQgd2lsbCBy
ZXF1aXJlIHNvbWUgZGlzY3Vzc2lvbi4NCg0KQmVydHJhbmQNCg0KPiANCj4gSmFuDQoNCg==

