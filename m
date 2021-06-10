Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB0B3A306A
	for <lists+xen-devel@lfdr.de>; Thu, 10 Jun 2021 18:20:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.139985.258725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrNPQ-0003wV-HC; Thu, 10 Jun 2021 16:19:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 139985.258725; Thu, 10 Jun 2021 16:19:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrNPQ-0003tt-E2; Thu, 10 Jun 2021 16:19:56 +0000
Received: by outflank-mailman (input) for mailman id 139985;
 Thu, 10 Jun 2021 16:19:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5LcG=LE=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1lrNPP-0003tn-Ar
 for xen-devel@lists.xenproject.org; Thu, 10 Jun 2021 16:19:55 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.80]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 74a3bd46-0464-4d10-a688-456cfa22071f;
 Thu, 10 Jun 2021 16:19:54 +0000 (UTC)
Received: from AM6PR10CA0092.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::33)
 by AM9PR08MB7101.eurprd08.prod.outlook.com (2603:10a6:20b:41a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Thu, 10 Jun
 2021 16:19:44 +0000
Received: from VE1EUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8c:cafe::95) by AM6PR10CA0092.outlook.office365.com
 (2603:10a6:209:8c::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21 via Frontend
 Transport; Thu, 10 Jun 2021 16:19:44 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT024.mail.protection.outlook.com (10.152.18.87) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Thu, 10 Jun 2021 16:19:44 +0000
Received: ("Tessian outbound cce4cc55b7ee:v93");
 Thu, 10 Jun 2021 16:19:43 +0000
Received: from c21f63764ca8.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C81ED482-1235-48EE-B301-1562DC9269EB.1; 
 Thu, 10 Jun 2021 16:19:30 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c21f63764ca8.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 10 Jun 2021 16:19:30 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com (2603:10a6:102:12d::10)
 by PA4PR08MB5902.eurprd08.prod.outlook.com (2603:10a6:102:e0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Thu, 10 Jun
 2021 16:19:27 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::f4f6:3d5e:251c:efcd]) by PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::f4f6:3d5e:251c:efcd%6]) with mapi id 15.20.4219.021; Thu, 10 Jun 2021
 16:19:27 +0000
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
X-Inumbo-ID: 74a3bd46-0464-4d10-a688-456cfa22071f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YIxcpUsQrph7ZAldOOn8E1OaQsgjSGQs8SuQr2bRjnI=;
 b=JRZORxfanohvM+rfRLd2vnmWHK2/ykbwuwAZ1VDmRSyaXPXMklERFSKrxkb2sXaK8l2+appDA5wKLCEFYsjlLbRyvChKCl/QFhQz5j3LvieJW5/Gcrr335tFnKhERa5D/6WiX9nR+UzoeZLMeRfDPrAhGU85I+cR9pW6vNziMCc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: a0d4f73fd72b0111
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iqYUoq3gz1UNt7dkm1pVWyzlUYP1gdb3606juIDWPkxUpZ18r57UNlL70utUSOag5jNSeKd/xuNssMXFKPfqEhR6cXLyelcONcKF+kYfsuoc3VuvnlhK1BBxVQ49xX1X0n7zhHpxPbyuBuhP4/AiX7Gf9YJ+dRZD5w6+tI1kjtdYVLMkbymzVtVSkAg1VaYkh7HVLW2J7GkcV012CYC2yHJsukKRt89RYkaVCqT+w+yKaRAEUwoJ8tXOWs8ZWhTDVS0ZLzq021750dlj8qm1BI89wHvKcrQKoMtqPFOFwvKKGc+s0/epzFojPlDzdLG9TAdiebN3eo9xcKKSXNKghg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YIxcpUsQrph7ZAldOOn8E1OaQsgjSGQs8SuQr2bRjnI=;
 b=bY9wLKUlqUfM6nUiJ1ZOvNLpeuuvayPYXBdm3Fjk4WsRHyZIG4B+4IyFDFuhhbEBz9aZiVAAlNeguK9RXcamg9F8/vYvWBHVLjO7TzpOcC2XzEOx9AoCXx6rVRG3hBfR5kYRfNMEP4R+eyaIQk5OHj4Sop8dN63EwQ71jPfeX/ggz9Y1QBA91yg/04FbVOIRp4cXKw9SHXNeZLEo1x/vVreYA43lS/H+Mz6gurGSoemEeGofcGj+rMmg7wlSLJWyLnFnTZKAMm2b3ypnXDiZVmFw/f+XvUNv9ZUfMV0tiUm75X2OW7fj++SJlnISeZestPKS8yX0EjK9wLG/0LqcJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YIxcpUsQrph7ZAldOOn8E1OaQsgjSGQs8SuQr2bRjnI=;
 b=JRZORxfanohvM+rfRLd2vnmWHK2/ykbwuwAZ1VDmRSyaXPXMklERFSKrxkb2sXaK8l2+appDA5wKLCEFYsjlLbRyvChKCl/QFhQz5j3LvieJW5/Gcrr335tFnKhERa5D/6WiX9nR+UzoeZLMeRfDPrAhGU85I+cR9pW6vNziMCc=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, osstest service owner <osstest-admin@xenproject.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [xen-unstable-smoke test] 162597: regressions - FAIL
Thread-Topic: [xen-unstable-smoke test] 162597: regressions - FAIL
Thread-Index: AQHXXeaXNOHWEVIMIE21UyguaXkQv6sNHOUAgABQEoA=
Date: Thu, 10 Jun 2021 16:19:27 +0000
Message-ID: <E28F5F88-7D8A-46C1-89B8-9841071778D1@arm.com>
References: <osstest-162597-mainreport@xen.org>
 <6d95cfac-e43c-d1f0-f988-4f11335b104d@suse.com>
In-Reply-To: <6d95cfac-e43c-d1f0-f988-4f11335b104d@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.100.0.2.22)
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [81.2.158.121]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: c495e612-06be-4c9c-d848-08d92c2b8efc
x-ms-traffictypediagnostic: PA4PR08MB5902:|AM9PR08MB7101:
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB71019E2810D1E61F5281E7989D359@AM9PR08MB7101.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:2887;OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 XvelizOIs4pfs31CnAXow1vjFo6HeLXp/f59dgICQaDtM3jfMd6vjxCo5ojzrow8l7USi0RArfFUXyaU5RjvTJZRgHyubmsfjqgvs/0FDjl8j4LuSXkWwyPGGnZVi1MbYe2nEc99p8foe2vv6OjoVp1f1sOLwBOVI+xNon0PMROvUtfIOtq4efQdTG7VMwaxF4NM/z9lCpv88IkxVaLJjJvPLty7vM0AwDWk7+F9mbJuXSs2WuZhu2p0gMcFLIDo1P5/qMnu0fNLvXBoRHv+KnmMBZ7FD4blxx7emf1I1KHQAt7YcKjsE+EiYCEXLybaBibhHuo9W5nOgQFrC1KorZRzXQApzJLGlYXUl+s89tQ2Vtop6xrm3RkwduB7Zf8Dr4GGhKiDsPO5lqrUu864UjKdgQRRND3NdzFY63Qsj1Qo5M+syxBej8DdcrtxqRxb0+XEkJzZhwp7Ag4IcA144utL0TPEyXZrI3/Oy9fZTiy7h/GVT+dTK1/fsu8O6qCh2vb56W9skud4dKDkfB0ulePUu9LKnr3nLA0L1NVwZYdbPWXLz/abDOA8Tv5B4FPgWFN+wtEXz8l6PK3m9MtspyGsHkdsBEHnGv0tgqGb7anY+lMBWqQAmT9zO9lsdNvYAJmPqw2sbXztF1yas1tubXHkucJUopfXCurKEKerK1NOg8+iN+9kHDHjy4vV7KD2wcwAcuf9mTU5V6E+UQna1DIk6JiXlXshHmJD/R9Xziq3YDfUUqM+VvBciNkU1GC2m+8tN9KK/5gphCsLEitHXwgPqs5feQi9Y2db/nKNAQY=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6446.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(396003)(136003)(376002)(39850400004)(5660300002)(86362001)(6916009)(6506007)(2906002)(316002)(122000001)(4326008)(2616005)(38100700002)(83380400001)(76116006)(186003)(478600001)(71200400001)(8936002)(33656002)(91956017)(26005)(6512007)(8676002)(64756008)(54906003)(6486002)(66446008)(66556008)(966005)(66476007)(36756003)(53546011)(66946007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?9w2aWAMUrFnykwK+hHF2dPM5lsrRVGrqXJ72SQ2DqjwrYgVJCzX2ihaGUNz1?=
 =?us-ascii?Q?Q2LHzSonLlSCuRHEtkfVA2ogEGzrAJaVpht9e3qYqO1KLnrPKgB7A/VTzQZA?=
 =?us-ascii?Q?TSi7PjNZi806zQGufWGU4sXTBpCNW9Rhc++rWohAgCXjeiPHZj5QtubL3XmO?=
 =?us-ascii?Q?LF+HL+51ylHHIfMGnTTWz0cdCaswNO9EuwGb3H1LNKQZBk62hZnVnvsVpUJQ?=
 =?us-ascii?Q?R5eZ06XjV/d5CzUHi6CCOKBbs07CreVimphcF2Eeb+OQHFLoYkQLjZtMNQa5?=
 =?us-ascii?Q?GH8mExtCg1sZBLQwipXMYNND+VbX3LlbqgaJiqWu0yHzAbkpi7D4GX6I5PVt?=
 =?us-ascii?Q?9vYUL7rMTNr/mFNDmOPhTT3qvh/nLFBowAoHxui0i/VO5tfMNv3dABHDpOds?=
 =?us-ascii?Q?yjDKB/ZZBnlqC1hrJD9ALUYcuBsul5Eodk67q0DQKtrG0Slb6730gWEfu7hL?=
 =?us-ascii?Q?sIC/vtqkX2c9GswLyB+4DuUU+Z4xc9O0ZWqtzDKuVgc6cUB3HHSNueO3buqQ?=
 =?us-ascii?Q?Vq8J2oslXWE0uBCm4uqE3uNVCeLijrhHbzhapHbtDqT6BtYplKffpmCi5KoZ?=
 =?us-ascii?Q?llFFtCG3LMVHy15nqEBo2VgZHMCecCPO3o6rGRNMFwmBNOv/URlyGGG0RSfR?=
 =?us-ascii?Q?ffsUGCsgafFjhcMLoaKRZEgenNof4oOj/hRnZi0QU4xQdLXC/KXe2lQdA7Wd?=
 =?us-ascii?Q?1Uzb9HlqcqL+KiNFn7LYAU/7SJdxwNlPlMVvAG6FEtzfdaUioJ8sd0Xp2U/f?=
 =?us-ascii?Q?qUfVHYuQpVNh5r+NdlVemGVq7KCiPtjOX0NYtnARWrvmxNsPogc/HRGyjLEW?=
 =?us-ascii?Q?kvYQ3raVBmQ/mwOI7yql3E0qd84IMIZbgPjH2GAqSkLrfvs5U+cMtNWTTokd?=
 =?us-ascii?Q?AtJbrhovcNDNqIQW68J9oCUynNooo/FEbwI6CcLnjuTRRQW5VT91/u0mLT8d?=
 =?us-ascii?Q?mrw9ggy/cu+Q3vTBoiP6Cph0nhmWxrVBc9twZY+a0lsp1AiyHBWDm3R3BvDn?=
 =?us-ascii?Q?7/f+9RT3y/vnZrqy1V+SR8+8e8/mmy7HHKFYWXKhQlVsRBluLqT+yl9fzRp5?=
 =?us-ascii?Q?cD9Kqq/411/UdTzLnNXHkcLnzIwdNjJz8PmJtNmNxejZtEFRBBkFEr0VdIlb?=
 =?us-ascii?Q?EIkAWsrG+RJEDcmWps6Bbr1WFNF+uPx2bn87Ggfp4zMHmyJZ8tzk6Zv6V5Qi?=
 =?us-ascii?Q?5Yh1mfPOJ/VllyXXTQVxrCSBQaPdUVauvfkGXAD1fVcENzqcDg1MAyKTZlR2?=
 =?us-ascii?Q?6u9BPYH0XCT3HcBsuZ3HnaqHXqREwv1PVr4eIqitNL8U8ywUvx5UL9VD4dPH?=
 =?us-ascii?Q?Kh6yFDRvQrzBXpHY4C03/1GR?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1D14D7CB02E9A449B1A71530C5EE677F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5902
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	28032e8c-b05c-4eab-a94c-08d92c2b8524
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mIzDL2OK9pUMy415PNdyQW2Bl1/fR4b/utPBNDA3qqc2wus1SZqIOfQbbhkokICGojqArkeTRBN0E3CqM5EkEETRDgOz4Rt3+Tx7M9tP8qTIwlh37eEob9r+aLSgkNSvIkrLt8FE4lzJSia2qNRNhO1Pj2QpRvpLMSzVmh5mclWvafkjMLmUje7E3Mp5VoGY6+6ZIVIXeWNj4gcpTjlZVy50dIAVjISmoPNjv4tbQzpvMKSTIx8DVT7DsbADMF5SAxcAJudkYYI8TOMqaZHe0ugmBDdUQZtfjYs03OuJeQ/bqM1kCB6HKbGwEtUDfzIS+mIfe2SI5wju8CGOV824rM3tGmQXhMSRL1EiLD13rXlHo5GFdbqdUoIch3mLGQW2v6TeumWKyEbe1ZO0dZttWa/dYmr8jnvr8QWVfFQQqOsZoLh6WNlyxw9MzAuW9S8peFh3tuT1aNi41L2hvg684xgVP4rvcvOf8TECtrGXvfkYsT/0NVUlv1AXluZGpgu17isWaGRpgmPixTPwuH9738GOXNcQPv1qtO1N53Iq4PD3q90FmLOEiUP7ejFv7g29avfrhKq2XHv/XkbmdMX0ysbxuIhVmsfuOAfdtbtavOhBFKi6OyfBTHqLtKAdnPka8n/bfmDpKfKo+B8e++oMQ6iEuco3ZytWnATX2oaWvPwt2IeFffdNYbC0rW6r8lVReqjxsNbzTeQkcERERFqufONamSVMQJL44uVPFQK2KtE0q5Wwdc8Kwr5dtfzikvsNLH1e5NCDWF+G1Pu+BIduOQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(39850400004)(376002)(346002)(136003)(46966006)(36840700001)(81166007)(356005)(5660300002)(26005)(6486002)(36860700001)(2906002)(36756003)(47076005)(82310400003)(966005)(54906003)(70586007)(70206006)(6862004)(82740400003)(53546011)(6506007)(8676002)(478600001)(86362001)(6512007)(336012)(316002)(33656002)(4326008)(8936002)(2616005)(83380400001)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 16:19:44.2497
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c495e612-06be-4c9c-d848-08d92c2b8efc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB7101

Hi Jan,

> On 10 Jun 2021, at 12:32, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 10.06.2021 12:50, osstest service owner wrote:
>> flight 162597 xen-unstable-smoke real [real]
>> flight 162602 xen-unstable-smoke real-retest [real]
>> http://logs.test-lab.xenproject.org/osstest/logs/162597/
>> http://logs.test-lab.xenproject.org/osstest/logs/162602/
>>=20
>> Regressions :-(
>>=20
>> Tests which did not succeed and are blocking,
>> including tests which could not be run:
>> test-armhf-armhf-xl         18 guest-start/debian.repeat fail REGR. vs. =
162574
>=20
> This now being the 3rd failure in a row, I guess there's a fair chance
> of there actually being something wrong with ...
>=20
>> commit dfcffb128be46a3e413eaa941744536fe53c94b6
>> Author: Stefano Stabellini <sstabellini@kernel.org>
>> Date:   Wed Jun 9 10:37:59 2021 -0700
>>=20
>>    xen/arm32: SPSR_hyp/SPSR
>>=20
>>    SPSR_hyp is not meant to be accessed from Hyp mode (EL2); accesses
>>    trigger UNPREDICTABLE behaviour. Xen should read/write SPSR instead.
>>    See: ARM DDI 0487D.b page G8-5993.
>>=20
>>    This fixes booting Xen/arm32 on QEMU.
>>=20
>>    Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
>>    Reviewed-by: Julien Grall <jgrall@amazon.com>
>>    Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
>>    Tested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
>=20
> ... this. My Arm-untrained eye couldn't spot anything in the logs.

I am not sure to read the log correctly so do I see it right that dom0 star=
ted and it failed then to start a guest ?

Regards
Bertrand

>=20
> Jan
>=20
>=20


