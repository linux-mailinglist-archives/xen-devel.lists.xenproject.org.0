Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7890537783
	for <lists+xen-devel@lfdr.de>; Mon, 30 May 2022 11:10:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.338398.563166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvbPL-00027g-FD; Mon, 30 May 2022 09:09:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 338398.563166; Mon, 30 May 2022 09:09:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvbPL-00024Y-B1; Mon, 30 May 2022 09:09:51 +0000
Received: by outflank-mailman (input) for mailman id 338398;
 Mon, 30 May 2022 09:09:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zbnX=WG=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nvbPK-00024S-9y
 for xen-devel@lists.xenproject.org; Mon, 30 May 2022 09:09:50 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20607.outbound.protection.outlook.com
 [2a01:111:f400:7d00::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41db320f-dff8-11ec-bd2c-47488cf2e6aa;
 Mon, 30 May 2022 11:09:49 +0200 (CEST)
Received: from AS9PR06CA0412.eurprd06.prod.outlook.com (2603:10a6:20b:461::6)
 by DBAPR08MB5655.eurprd08.prod.outlook.com (2603:10a6:10:1ab::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Mon, 30 May
 2022 09:09:47 +0000
Received: from AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:461:cafe::4b) by AS9PR06CA0412.outlook.office365.com
 (2603:10a6:20b:461::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Mon, 30 May 2022 09:09:47 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT015.mail.protection.outlook.com (10.152.16.132) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5293.13 via Frontend Transport; Mon, 30 May 2022 09:09:45 +0000
Received: ("Tessian outbound c1f35bac1852:v119");
 Mon, 30 May 2022 09:09:45 +0000
Received: from b656df027a4a.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7B48A406-F1D2-4561-B5D0-AC8598C0320E.1; 
 Mon, 30 May 2022 09:09:33 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b656df027a4a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 30 May 2022 09:09:33 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by VI1PR08MB4286.eurprd08.prod.outlook.com (2603:10a6:803:f6::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Mon, 30 May
 2022 09:09:29 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5293.019; Mon, 30 May 2022
 09:09:29 +0000
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
X-Inumbo-ID: 41db320f-dff8-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=YWSGjsqBo52g8vnF9u4cI3gk/sVFjhmnxztK0uv6vr19VXaOsr5v0zmwjT0yGSpywv4gs2mGhLR5fNrPNlFkSCBapNoaMd9nmq/6oZ7p7p05xzYFa5b5JDC1hb0MO5IHNOkea9lqm8vgVbn1yc/oIbH3Uclrlf9zgdloaZc//z7QCjoLW0JT9ounJMLYx3hkAsPWWIQcJN2ld/JWbZRKyqt+VP4Utbxj39KTo+0nPKLt3/rWTFrzgRBYspJUeyNKc52QZLwe2IYCy8a+3Usha5PyfRvojakCtzGlNbwdySM7dFyLW2wVIvN3f3FM/UQweOlUZ4L34VRMzJyVM7Dnww==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e07rWfO/vgqUAvRMOhrmo1yBxYzOVBheNMOYS6KhLxY=;
 b=gaKH45gGY1en/YVIAZqDEDUOqc8KYY56TKhT8NmpKbm1nD/Fg43MHX2EegfP5fNL01EOJfhbZb2YEe8qRbX4hYsrYgSDW0T1SovQ1Hmj1MBjCXa+WXryR9Q+ArlvpE/LYYsr0MiytkFOcSvhlHxhffvKizyLIm9PPOs5k2NRy9lt8wbRjttoGoId6G6jJkYur8kS10aCbq3bgnw3vCGuqvnI877PlInTO+28fgfxdIGH6yAyrvsdjMuXIiqmTzAUp9b2deCz4jMPDTEKMfI0cRSZ9jUOkf38Cq+Hp+MdgbQEP5bLl6cqcunTHVyFz09WGvKd7d/MnSMEL2L6auf/OQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e07rWfO/vgqUAvRMOhrmo1yBxYzOVBheNMOYS6KhLxY=;
 b=N8WJ7Lh2f/its3/J2sxpvzb+ekmi21CjVHzn14UAYK5AWdFLIxpwIlKo7WP9o5+/mI8bfqIPOKQDCvYYK96oiv/gF0REnckh3u9MJluXCprMFUmLGfJt1+hYw540dRgTkFZxSpxNZFA8wEU4ueptkBhMTnxs1xVCzLxGm3KwK8A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 79f9c0e9ecbac5a5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UsbSplKGxnhkqvOj/zvWgLvEa8dJehjHd+mpP6wLlOH0rR+A3qbCLvNCPHxPwQw3Y/QPu5otMHG1CwNN2N8gWG4m3rIZHu44TMz6LFEGlrBYcQWIM/JtmNgXQKci/n0fpHlIcZmp7d28hkRnRtUFTkZf7jgqV7GVDDwJQgYvJi93ZgPVQBdlBejl9cRKfjfaNrNxSzDmsqHI/BbwgI+/r6sH5J6kN6h0Nh03r6PNSjwc442KCThRM4QVl8iJVnzODfF9Se9wrMHTZAkJ/Ec48G+sxYJAwBDXz/mMSKfR9c4AUv1AWI1X4ZXdkd6nnM/GHtzcSO4cGWvyto9NUSH5Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e07rWfO/vgqUAvRMOhrmo1yBxYzOVBheNMOYS6KhLxY=;
 b=eks7i/InE57RGKa+l9bJfGr6RsmcwqlpvPnlCvAXkuzrB1EiHixGZUmyzkLJgT29qvq6+O8QX6J609A4+D68ttuGgAC8kuT7PnsJvIQTINnj7B0VMdhy0hKPyVjM78TcYLD4NC+sH0NeQHV6JwFgh48ZQohaxbsmEuryZ4T6uh0so3ALS+JXJwBEYKaBFy5ZZAM8qt384pBcNnc5aoQU0GJac6FhPuVpgXaQl0alNysJGz5gTqnh6plCoTeOPTtrhKUC6yPQyhE67/nko/FiW9vzPe6+BfeLSi0Zwg4ffuerHGUzv9H1o0TkYrkRct9XG9LqxyEWuorhZQWBBWzg0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e07rWfO/vgqUAvRMOhrmo1yBxYzOVBheNMOYS6KhLxY=;
 b=N8WJ7Lh2f/its3/J2sxpvzb+ekmi21CjVHzn14UAYK5AWdFLIxpwIlKo7WP9o5+/mI8bfqIPOKQDCvYYK96oiv/gF0REnckh3u9MJluXCprMFUmLGfJt1+hYw540dRgTkFZxSpxNZFA8wEU4ueptkBhMTnxs1xVCzLxGm3KwK8A=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <Michal.Orzel@arm.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Allow setting the number of CPUs to activate at
 runtime
Thread-Topic: [PATCH] xen/arm: Allow setting the number of CPUs to activate at
 runtime
Thread-Index: AQHYboWC3AEIHk6mmEWNblBNSTXfPK03LOIA
Date: Mon, 30 May 2022 09:09:28 +0000
Message-ID: <A1DC403E-3BAF-4BED-AFF1-68313005669F@arm.com>
References: <20220523091324.137350-1-michal.orzel@arm.com>
In-Reply-To: <20220523091324.137350-1-michal.orzel@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: f47c748d-5344-4c93-476d-08da421c2425
x-ms-traffictypediagnostic:
	VI1PR08MB4286:EE_|AM5EUR03FT015:EE_|DBAPR08MB5655:EE_
X-Microsoft-Antispam-PRVS:
	<DBAPR08MB5655967F6A27DFA3CB69F8689DDD9@DBAPR08MB5655.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 4wRY9VNNi8/4pDTVF3K5zwZIv3KK1XOCufEL9oDhTHAVe0ZCD+k9V7X49U/LZAtQDx9+DlUulVufbOm8bAktv8JpbksIZWZDbl4WWMJHyNi6NoPoBMgLmaUKqGPGD7ShBpfpfwA9rAnk+JY37uRMzDsrAL9FhTA29X5Zn7lImiKWSuy/Wj2xfyIiQFCgJW50FiTr+WA05TThQn7PYcyUa3N08RHPJqZ/hmLABngt8I+XZbKJV/HteLdPXeJM+LHz4TNh1j6GPkFfueXFXWSHIIuNnD+8g0uwXxseC3PP5MMdRdxQLX6mVeISrZd6cyz5fIOhrPAbBTd6dkKBk7gXLJGBN8JJhKXq306b6/0fX+hTxC1f+Qnk2w5TEbJ41LPmNQIWEqtto61ac9iPzQZ0N6htBU5Ja/U8RRghL9/YhfwXQNf8cKrxmM+iwiO3p09g1VZVKeSROjmWZBsBFn527VHTxu19i7KNXWHfuLbm8UiGrJedZqdOLtFukKyjZhs8s3D3U5b0UtBZZ43/cHiMen14MXkNppFTYmB3NwyMVYaxCQmknJcDLqV306r+ZhtaK2fa7xLPFgK7u6GoHvinI0jXlK4X54y6JbJcpwPq8iLONEXGBQGKN6Q2HLHCI5AvLjdV8/6Ljyy+lxwzXWPh4PBQTQfbdu44aEvuKTouHbJYlaXl7FK/gh3vhIJ8ZWffqZgnAzxW1naSkV2bDELmIFuZGrsQo6yCqoMP/hsiwPzpT+CCM6q33K24QUYaDiE8
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(37006003)(53546011)(26005)(6512007)(6506007)(6636002)(4744005)(8676002)(2616005)(2906002)(33656002)(54906003)(508600001)(6486002)(38070700005)(86362001)(71200400001)(122000001)(186003)(38100700002)(36756003)(83380400001)(8936002)(91956017)(76116006)(64756008)(66476007)(6862004)(66446008)(4326008)(66946007)(5660300002)(66556008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <495BD34E7EFAD34789CE8A3BABFEEE3B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4286
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9fc0d0ff-f13f-44f2-431d-08da421c1a12
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eH8PKlDummJF6rwErfFzMNzQySariuUC4VssW6xJa24XrhpYsE71MSPPWwIR/Xz0oPN2m5ONHKpzSJhW4sx/l60fPodgkrITnTj6YJ4syI0bb5EWe9ROUvPyRlO6io3ryxesuv3LENZL4EnEknOx59y84iRFBpDkIRRZuqkJlUxW0f9vnyh359Wugoe5CRthHP6qJKJnLYY+KXgKhn4ySGuQNm2l6PsYdgWIkbarcpkVnsLUJUtDa+OpKI2016CSZQlq608tdGUYj9oI+5gu/7ye9ooB7D1+NO96rV4lNyU6BMz0M2pVbIw/tKTmoDARBkkVYHNMAt3uXhR8yG7B8+ybJc68IfEKXbzjBh/w9kkMJkyFCRPloUv7H4RNBlgnDchdo7MBTkJYkSeahQk+dHLfeRx/ftb1ctEkTs6RkhJ7IGz7XweZFLDVKceDar67zbEQK5xIs+WGnEGhWLL78uSvgGoaoY5lOhdt5L9RTKc0HFZzIOAUjQvFGcARWxbEHG+9X2nPEwEuPZxy7+BLiAPYlN2lEwQxHPncLVGeGX4uV+FcNvOuMzy9KyvzeaKWlBCPiMVwveO4qYCiaZTzvBYN5ZahETpNxHZnRVFfaMfUxPXOa42YEvYCrtWhMHIvSfmxGe17VQJgPCuKfWpxS9FGZkZlJeN/80sJKqtdYTPBncmEanhdB1v4F9GXDRTN
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(26005)(6486002)(8936002)(83380400001)(508600001)(70586007)(47076005)(6862004)(8676002)(4326008)(40460700003)(6512007)(53546011)(107886003)(2906002)(336012)(2616005)(5660300002)(33656002)(4744005)(6506007)(36756003)(6636002)(316002)(86362001)(37006003)(54906003)(36860700001)(356005)(81166007)(82310400005)(70206006)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2022 09:09:45.8661
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f47c748d-5344-4c93-476d-08da421c2425
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5655

Hi Michal,

> On 23 May 2022, at 10:13, Michal Orzel <Michal.Orzel@arm.com> wrote:
>=20
> Introduce a command line parameter "maxcpus" on Arm to allow adjusting
> the number of CPUs to activate. Currently the limit is defined by the
> config option CONFIG_NR_CPUS. Such parameter already exists on x86.
>=20
> Define a parameter "maxcpus" and a corresponding static variable
> max_cpus in Arm smpboot.c. Modify function smp_get_max_cpus to take
> max_cpus as a limit and to return proper unsigned int instead of int.
>=20
> Take the opportunity to remove redundant variable cpus from start_xen
> function and to directly assign the return value from smp_get_max_cpus
> to nr_cpu_ids (global variable in Xen used to store the number of CPUs
> actually activated).
>=20
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>

With the warning added in the documentation (which is ok to do on commit):

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand


