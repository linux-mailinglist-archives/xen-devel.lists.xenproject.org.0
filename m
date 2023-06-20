Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F68D737572
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 21:56:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552254.862220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBhSB-0003Xa-FJ; Tue, 20 Jun 2023 19:55:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552254.862220; Tue, 20 Jun 2023 19:55:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBhSB-0003UT-Bk; Tue, 20 Jun 2023 19:55:51 +0000
Received: by outflank-mailman (input) for mailman id 552254;
 Tue, 20 Jun 2023 19:55:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2irc=CI=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qBhSA-0003UN-DZ
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 19:55:50 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2048.outbound.protection.outlook.com [40.107.7.48])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 733831e6-0fa4-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 21:55:48 +0200 (CEST)
Received: from AS9PR06CA0203.eurprd06.prod.outlook.com (2603:10a6:20b:45d::27)
 by GV2PR08MB9277.eurprd08.prod.outlook.com (2603:10a6:150:d5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 19:55:06 +0000
Received: from AM7EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45d:cafe::21) by AS9PR06CA0203.outlook.office365.com
 (2603:10a6:20b:45d::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23 via Frontend
 Transport; Tue, 20 Jun 2023 19:55:05 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT006.mail.protection.outlook.com (100.127.141.21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.23 via Frontend Transport; Tue, 20 Jun 2023 19:55:05 +0000
Received: ("Tessian outbound 3a01b65b5aad:v136");
 Tue, 20 Jun 2023 19:55:05 +0000
Received: from d885df5e577f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 63FD0EDA-0FE3-434F-962D-CCEEC6E48398.1; 
 Tue, 20 Jun 2023 19:54:57 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d885df5e577f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 20 Jun 2023 19:54:57 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS1PR08MB7401.eurprd08.prod.outlook.com (2603:10a6:20b:4c7::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 19:54:55 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::ed0b:5730:a1f9:577b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::ed0b:5730:a1f9:577b%5]) with mapi id 15.20.6521.023; Tue, 20 Jun 2023
 19:54:55 +0000
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
X-Inumbo-ID: 733831e6-0fa4-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9circiMDxEmemgz5d54tTuPK2WrlvY/vCTY4DFFw1Ac=;
 b=6ZhDwmEGOeMoA3Eut7UK5SHhNbPWXWgiLcrTRrmXuiUWAcjSIzbq1xAWt5nTFtbPTEIfiqJ7oXoJjlsOz8XKecTsmNXrPESsN5fupb0WkavunTJRRtXrVEOVS8Bf+u8dWGMFkpBMJTVrkzXCC9gQ5dHUuJB0iVtrfWFOI1nPuq8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f27eeefb9f1dc146
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kTiNF7aWca5AV8r4NzrLtmuO93N088TxqZl+ibA4jeOe/ogrSNoVJnEtXya8b9/LJsVWnBGR0rXgrF7DfZFhIkZJVA1BxRScXKX4+8UnYDyfH2CPStF1cXyVKsc7m+D5tRcCswUGw10pRsQR4fOYnAHUj4NkNVuTSlXQBpzeiAVuOELmmYjyuDizb3ff2BBlVHS+7SSrc+gf/iATZH533HtSVzuPT1Wze6m/5WR5io+edcuoKwLIPF9aGo1tDVTzTNMfCeyLXPPf3r5Pc0ETf6U/nc3/MYkGb2bEZ8DMlfUAJxYeyZJ8UWgF29XemgfpUHTvAXpV8dJApwmoOE26tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9circiMDxEmemgz5d54tTuPK2WrlvY/vCTY4DFFw1Ac=;
 b=RI4soxr28P8MgAzZsoiQqN9bYRVCR+w7IC8i+mFQg5PbCWoY9jioPNeE+OMLM9OxqgNDDvJURVouPVWAOCb6kefCLhKdwY2gIYhIr1RNXNJpsFFNjBkCXj6/Zy89JFYrTMSZP1yI8A52oFn7Q812CbrNu21chwnKeHa97KgOfLVl5tVMcM8s4ZC2bid+QJHxAt4UVBmdzmr+TRV0c88miSk7gzEWhKwpOkawM06RQ7c4VbFR165BVowMkalZIZs9r7cuTXtHb75VWKSu018FXpdq5SJWKAvPdgX8KfDC72ShsaViAwDadwLsrW8uQaqsXmisN3eiYtEk2uI/6ZnWVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9circiMDxEmemgz5d54tTuPK2WrlvY/vCTY4DFFw1Ac=;
 b=6ZhDwmEGOeMoA3Eut7UK5SHhNbPWXWgiLcrTRrmXuiUWAcjSIzbq1xAWt5nTFtbPTEIfiqJ7oXoJjlsOz8XKecTsmNXrPESsN5fupb0WkavunTJRRtXrVEOVS8Bf+u8dWGMFkpBMJTVrkzXCC9gQ5dHUuJB0iVtrfWFOI1nPuq8=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Simone Ballarin <simone.ballarin@bugseng.com>
CC: Jan Beulich <jbeulich@suse.com>, "consulting@bugseng.com"
	<consulting@bugseng.com>, Gianluca Luparini <gianluca.luparini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Michal Orzel
	<michal.orzel@amd.com>, Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>, Ayan
 Kumar <ayan.kumar.halder@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH 13/13] xen: fixed violations of MISRA C:2012 Rule 7.2
Thread-Topic: [XEN PATCH 13/13] xen: fixed violations of MISRA C:2012 Rule 7.2
Thread-Index: AQHZo2ahcQOuFpmGz0i0RQTxkmFbqK+TrUGAgAAKzQCAAGNCAA==
Date: Tue, 20 Jun 2023 19:54:54 +0000
Message-ID: <8B3907CA-0253-4A74-8095-1923943A422B@arm.com>
References: <cover.1687250177.git.gianluca.luparini@bugseng.com>
 <3560de5fd05a67cc10c9426ffd55639ebe24d98d.1687250177.git.gianluca.luparini@bugseng.com>
 <7837d4f0-ebb2-b420-7af6-d8b3c6b2daa3@suse.com>
 <CAFHJcJunx5qsiZvpQ5udwmrdM5njEZS8OBiPGrjbGyr-8hkFEA@mail.gmail.com>
In-Reply-To:
 <CAFHJcJunx5qsiZvpQ5udwmrdM5njEZS8OBiPGrjbGyr-8hkFEA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS1PR08MB7401:EE_|AM7EUR03FT006:EE_|GV2PR08MB9277:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a82cbcf-6280-411c-b9db-08db71c83e2a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 oFdmR9+0aoJxvO7XDiV4sSz0nlDHPH71nUL0Dh5OPqsJITgb9lkLztbUqLNY9lt1ZviFj7pSetbfzP4QnZovjWWTdK2Ny9xWf2cPJ9AeEUsbBLBThwusVgWcp1PL2957Ck+o+shbiSSWFFCIiN9rBVZOntUEdPPXhZLBg9kocOpWaLy68rIw5XjkKAmaokRqwn9+yMGjU6IOg6vTKMqAdFbJPH3ChMUiWpPQ952FAN1ZwJi+hwxACIRZ9j6trX/UJmM7qZH3Dxreyvy7H5Cq9RjOvPQME3bMdw84a3aZ8vzjiUSxxcFHqoxEXHXBzETTe7uKtxqN4+DTCGmCvripL7oYBrOBMmqPIh+1a1oJIsjZh7UcGU0+ThO991eGZYIdhTR5VS8BzEf3lnoM2WHnRCpv/xzW2R0feCZvX77cKkfdhAXJYobJA5zrnO7/X9MJzWrHeZXjNqvb1GJtyJAEDLZGfbYomH7BgGz1goJDIhQKq4oCYioa4a3fOCT1GW592cZo53VB7Z1U/p//xdl9St0XC/lBVn0YO3nazSyqNQrVUaw9Aj8/AYHr4fZsdS9+JVRaSZnduiCZP3YbGUveVS43u8Q2OsCaVc8zPafgzN/RxYbLPhpZqxTqxJhOz5dd
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(136003)(366004)(39860400002)(346002)(451199021)(8936002)(26005)(6512007)(186003)(6506007)(91956017)(38070700005)(53546011)(41300700001)(316002)(4326008)(76116006)(66946007)(66556008)(6916009)(66446008)(64756008)(66476007)(122000001)(6486002)(38100700002)(71200400001)(54906003)(36756003)(478600001)(2906002)(86362001)(2616005)(33656002)(5660300002)(7416002)(8676002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A49F9918A4C0C2438DE71CB1B8813A60@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7401
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d5d45ddd-c4b1-471a-97cf-08db71c837e4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gdWOJDYlBPXsC46XLruoVpxjz0KW3Lace/iEkglUKQS6HwW5fh9x1FXV4t6lgpuQfOz9PNZ//evRswWFYEiizIt6de6D9n3SzZQuqcRB8EmKMeGZBA+ZUo8NtwxCgLnW/TrEWhXzN7Za3fLEHoO6ZgLFz3Fj/VLy3LGd7P8aPhrTjDJ6tFPwypYPBDI7529ih6oV8xJYzDEYroeBVG7i/o68rsdYYybvQaYthcBhsaGw1hriD3tl8jnJJVM42oaIgw8yw0M8t07xPJk0E3y0NXjK8RgQjLvy9T8Q+qsRWEwsMR4oTR5wZfidOSox1CkjdrmtBfH3pxC6xrpdhVW8gC7lauVFndnxnDMmMmXVqmWO/I2kuyu1nDMuz5alXxJkS3krYFgjgEKnIpEn8rgnYaErNqFy9tiG4HfCe/jvJYwQu/9iz8Kbxugyu3ZjRcupsjHHwY029J4D2eCaIdbgWChGVuuNUHhoeV0kl0FhsthUqgReM7iH8zMzNlFXAVSQg6yqjXmKG37VGbcYKNVUd+ToDuUpZqY+R3Nkb9NsJ04DVoa927155IiaxPsyZKxtLNUxB17ndoQr6ueOpEbKaZQdi6vo9GLzspFC5eCrALcjxWGT4/ElPcRm6ervoqH9MQD40Bc+9WPPqD1bqWAAeNUHLPRgEJPIhNU2im+0CyGic4zUCxqj2qf5n80RCWtDl+kFqzOeGjp2rMFqw2x596+vAdMUgrWa+ZmFy/adtP4=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(39860400002)(346002)(136003)(451199021)(40470700004)(36840700001)(46966006)(6506007)(6512007)(26005)(2906002)(36860700001)(33656002)(40460700003)(86362001)(40480700001)(6862004)(70586007)(70206006)(4326008)(41300700001)(316002)(336012)(47076005)(2616005)(53546011)(6486002)(186003)(82740400003)(82310400005)(36756003)(8676002)(8936002)(356005)(81166007)(478600001)(54906003)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 19:55:05.2817
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a82cbcf-6280-411c-b9db-08db71c83e2a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9277



> On 20 Jun 2023, at 14:59, Simone Ballarin <simone.ballarin@bugseng.com> w=
rote:
>=20
> Hi,
>=20
> Il giorno mar 20 giu 2023 alle ore 15:20 Jan Beulich <jbeulich@suse.com> =
ha scritto:
> On 20.06.2023 12:35, Simone Ballarin wrote:
> > --- a/xen/common/gunzip.c
> > +++ b/xen/common/gunzip.c
> > @@ -11,7 +11,7 @@ static unsigned char *__initdata window;
> >  static memptr __initdata free_mem_ptr;
> >  static memptr __initdata free_mem_end_ptr;
> > =20
> > -#define WSIZE           0x80000000
> > +#define WSIZE           0x80000000U
>=20
> This again is an imported file, which I'm not sure we want to touch like
> this. (Then again it's only a single line change.)
>=20
> This file is not present in exclude-list.json, in any case, I can remove =
the change.

Hi,

I think you can touch this file, yes for sure it was imported from somewher=
e, but
from what I can see it was adopted by Xen and its code style is the Xen cod=
estyle.
Furthermore a previous commit, 21a41a6164305bbc66ff1e42ffc11301712f6d65,
had already fixed a MISRA violation.

>  =20
> > --- a/xen/lib/muldiv64.c
> > +++ b/xen/lib/muldiv64.c
> > @@ -27,7 +27,7 @@ uint64_t muldiv64(uint64_t a, uint32_t b, uint32_t c)
> >      rh =3D (uint64_t)u.l.high * (uint64_t)b;
> >      rh +=3D (rl >> 32);
> >      res.l.high =3D rh / c;
> > -    res.l.low =3D (((rh % c) << 32) + (rl & 0xffffffff)) / c;
> > +    res.l.low =3D (((rh % c) << 32) + (rl & 0xffffffffU)) / c;
>=20
> This might be neater and more consistent with surrounding code if
> switched to (uint32_t)rl.
>=20
> Jan
>=20
> Ok.
>=20
> --=20
> Simone Ballarin, M.Sc.
>=20
> Field Application Engineer, BUGSENG (https://bugseng.com)


