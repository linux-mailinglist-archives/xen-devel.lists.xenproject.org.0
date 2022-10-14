Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E45635FEBD6
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 11:40:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422629.668784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojHAv-0002He-4a; Fri, 14 Oct 2022 09:40:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422629.668784; Fri, 14 Oct 2022 09:40:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojHAv-0002F3-0w; Fri, 14 Oct 2022 09:40:17 +0000
Received: by outflank-mailman (input) for mailman id 422629;
 Fri, 14 Oct 2022 09:40:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nnxB=2P=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1ojHAt-0002Ex-Hc
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 09:40:15 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2068.outbound.protection.outlook.com [40.107.21.68])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 346a7221-4ba4-11ed-8fd0-01056ac49cbb;
 Fri, 14 Oct 2022 11:40:14 +0200 (CEST)
Received: from DB6P18901CA0018.EURP189.PROD.OUTLOOK.COM (2603:10a6:4:16::28)
 by AM0PR08MB5427.eurprd08.prod.outlook.com (2603:10a6:208:183::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Fri, 14 Oct
 2022 09:40:12 +0000
Received: from DBAEUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:16:cafe::66) by DB6P18901CA0018.outlook.office365.com
 (2603:10a6:4:16::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21 via Frontend
 Transport; Fri, 14 Oct 2022 09:40:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT036.mail.protection.outlook.com (100.127.142.193) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.20 via Frontend Transport; Fri, 14 Oct 2022 09:40:11 +0000
Received: ("Tessian outbound aeae1c7b66fd:v130");
 Fri, 14 Oct 2022 09:40:12 +0000
Received: from c2227076e082.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 88BFE35B-FE27-42D0-9E68-4C24590FF5CA.1; 
 Fri, 14 Oct 2022 09:40:00 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c2227076e082.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 14 Oct 2022 09:40:00 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PAXPR08MB7317.eurprd08.prod.outlook.com (2603:10a6:102:230::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Fri, 14 Oct
 2022 09:39:58 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::a8c6:cf12:7155:de53]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::a8c6:cf12:7155:de53%7]) with mapi id 15.20.5723.026; Fri, 14 Oct 2022
 09:39:58 +0000
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
X-Inumbo-ID: 346a7221-4ba4-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=BZDnt/SDAXaFpMAo0YPmyd4U+hc8H+AoDOr04uoZa8S+3+Rj6n7fJIkf8CBL10I2okNGGBvLNS8vS4xreQuz6JqNLK544r20p8Cv5RyJ1SMMfwDfWIbn81XZ6MHZ3tR/kHzq0FQVhcGAWU5Lt1zuuFjS/jidXqIGcZvVY3dF9QyQTBjQW7gfknm1vKmTdlq+6aPfybjD1ueNWu6KCd4mI1zRx8nrzz7jI1VHAEtqwVB2jYkIiHBv6E0BhRi7FGTMJYAj65gvfL1SEGS2No4JmLXGos1tBpeJy0bYrJg4mkhYYMv5kA830uSK1UUovPA6EwaTyBfOVgOI/4plI/YOfA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KQ9chkcFUsaOmkM+wxDS+JJ/mHrbcr14BRFM6DtU0vs=;
 b=NpCN/WwGTXIzJ5QI0Cjff9exnHs87s/e74LSF0viGT75dGpQ2ZMqgivyQq8ICk2ibupm0eaUfiVZT2R/tRKd4D6FeLn20B1lQHq8qb8Bo7df0C85KF5oRrUx8KZpq56eyMvHn5XM0eFSxDz1Rulkj1gJvvXiX49WJbJ/ly+AJ4bQC0sjnrSxJLGVsReXRfwXxpJahARNa/cgIf4zh04i7AG3p7O3YYxbpi/AaT4N+kXbOKUnkldknTl3oaRZuny5bbpYIEK/9cEsI+dMYWatrz/vAcFqhGwC1gvPQeVFlMQufnWMm6hNC7VNcMYUQAG9WhGt1QvWdG9lr0hTklfTvg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KQ9chkcFUsaOmkM+wxDS+JJ/mHrbcr14BRFM6DtU0vs=;
 b=PsDFiYgtPItOLrvdMw/cAwPFmKp6/zTEOAACVDBF4KtuwnCucEn0RZgxIFuB2ZeAkfMQBpSgDAGQeUpCp6q4+LoOgk4pjRC/loxc5ttS3lG5w7iJ3ip8a11Tb8rN0GhOkpX1dL9NbFzNhvIkWMs82MOucFEVlIWwCb+cDQzkUnQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: ba42a7961afbda02
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nazn238hr+Jt+PtNi34GFC6rwyO3E4eP0HXq7H8hA7juXrSJedMKa+LGirAXh5nrH0piJ8ScAaUTa041uv30XzYriLfN0m3eZn4gfQoBGGI3HaLa0tESANeCa/OhawzHQV9B+PE3Wb8f9h24924Sse4Lsu3eJ/MJr8GxpXf2ZfFA9cwQ+uw6njcUGw/r1nppC0fgkmsvR75PX/G27zHT3EAHmXdITdjL8eFpPBLbxcNhTeq6W+pzlQ9aYPA6lG9MnshfhyyoYwfeNeWACXr9YaBYszU2XWDVV4j+gJowD1ly1WmuVmhdmPNPIc5Fo0rOLLpir0dW4lrFTN1EGZgrHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KQ9chkcFUsaOmkM+wxDS+JJ/mHrbcr14BRFM6DtU0vs=;
 b=YJV0G9AoicI8D3cy58Q4qasJPRFoQyWYYtY4EYE3gATzxclPcYPbwAxihilR378iWcJot0eJB9UPMWpgh3UfOJ7LxpleEcPhrrfMkcFdZ/HKTSIayjkW1DMDaw9LCnnQ8y3tyY0wpMGssaqjrp3dlt0fyb4Gq2fLzaUXoHU482GMtgBTwI4gGfji+m841mCdI1YVz9wI20LKrGAZ3uzLG3ez847CBPTCWqW+xy8KaeCiuOCF+k/9migsAhBW/Jdk5Q2JJdiWf5SKZlqj6V8TC0aC2nBQhw1+OmaM4BgsW0lBYifndMNwcsYGbFpWaIGN+5SwLCltZvn0N4GKIfwCww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KQ9chkcFUsaOmkM+wxDS+JJ/mHrbcr14BRFM6DtU0vs=;
 b=PsDFiYgtPItOLrvdMw/cAwPFmKp6/zTEOAACVDBF4KtuwnCucEn0RZgxIFuB2ZeAkfMQBpSgDAGQeUpCp6q4+LoOgk4pjRC/loxc5ttS3lG5w7iJ3ip8a11Tb8rN0GhOkpX1dL9NbFzNhvIkWMs82MOucFEVlIWwCb+cDQzkUnQ=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Henry Wang
	<Henry.Wang@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>, Wei Chen <Wei.Chen@arm.com>
Subject: Re: [PATCH for-4.17 2/2] SUPPORT.md: Mark static heap feature as
 supported
Thread-Topic: [PATCH for-4.17 2/2] SUPPORT.md: Mark static heap feature as
 supported
Thread-Index: AQHY3q+gq+iAwC+K3kK6Akvdo+Mt6q4NAU4AgACRG4CAABIQAA==
Date: Fri, 14 Oct 2022 09:39:58 +0000
Message-ID: <FE2B710E-E3D7-41E0-8BB7-31F59AB16D2C@arm.com>
References: <20221013025722.48802-1-Henry.Wang@arm.com>
 <20221013025722.48802-3-Henry.Wang@arm.com>
 <alpine.DEB.2.22.394.2210131655530.3690179@ubuntu-linux-20-04-desktop>
 <a4a8fa5b-afff-0a49-7c06-b9be82669aac@xen.org>
In-Reply-To: <a4a8fa5b-afff-0a49-7c06-b9be82669aac@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|PAXPR08MB7317:EE_|DBAEUR03FT036:EE_|AM0PR08MB5427:EE_
X-MS-Office365-Filtering-Correlation-Id: 50dacc02-9026-4ff1-03d4-08daadc8170c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 QuzgxiL79P3vlnsj/2aNg/huaXSWP5Lp154PJ5rPdmr1oIa4yUSFrhMYsvELK4pyEduI5FuNWMo3swIz69diuqcmL2Dg4W3/FaW1oB5Gfyau9eHePQa39X9I/xcpU/CVqvcoY5gsf5uhWuIE0EqyKpSycNUxLATnuua5h8DjVHDBCe2GAdOafbKjPuhidkTRm6vv2afw+nMQtbsE9Fp9TpyeyKNbMFYFrjRb9oWFWE4h55yCxbDpm6c3V1HZ1hw2XXa4rZkCHFVhTi2Y0ecAwgKWixW0EHXmmFIZ9Zdb/wi8KKeT+d8HpJL4WyUg3PkjgSjxB9P7mkzsSA8LzEqlUf5YOXFoVHMavucWlZbso4rjvG45pFwqX8HUa6ni6eKIcMARipJ6g3ZUcW12+vykrYlGqZDmHS776JkmF86t88Hg265VhcCyVrnDmDt9nue1Q4baV6Nmdjf3kFhl3ucEMEIYfsJlcJ86/rwYb7sGhU6pI8FtQjmebUACLUsx7r2Vml74cOME02h20I2PlqNGp4c0zh+B/QuCZPUE+k7LJZb7xTK7JNtya83317eLzH731UkmzMgqasSxezt52/94QIX7n0dz+ASrYW1BMSQDDHzSoU2Lumu+tz1CpLd1RC8V0aLkv7tuwJxBkmT3WVMgBUWPGHV4aIiy4G4tYvkcSbKNhI+eFY439BKFNrZ+M3pOvUMUMtPk65gCp96rD5SZNuzNf2xGqN7p/dKDDnDSchJ75m1YXvEnIxkaBdXPdWKJlXkYz7x7xvW6mq/tgxCkt9R8MRW0lmIpno/oo5dQjlY=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(39860400002)(136003)(376002)(366004)(451199015)(4326008)(64756008)(66446008)(66946007)(66476007)(66556008)(38100700002)(8676002)(91956017)(122000001)(76116006)(83380400001)(5660300002)(33656002)(186003)(2616005)(2906002)(36756003)(6506007)(53546011)(6512007)(26005)(8936002)(41300700001)(478600001)(6486002)(86362001)(71200400001)(38070700005)(6916009)(316002)(54906003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <758CE40540686449B0E1E961819032E5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7317
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	407a3699-800a-4d02-66cf-08daadc80f36
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OiYWwi1nueNqDZKyyRH2Kh+ru5n9mZyua7JqrqFDD7ASgSm0S1dYiiK9u//3wnaUscFMHOIxJSZDY2T27li6M6x4If3iCmZEKYGt5tE0mNG2WN8nZHN+XJv8QdZ+B5ovZZ3Ifwq8QTXaftfUxGLuEeV4Swy3BbRPMka7OtQ+HoKb58q7o1czb0ePo/igNOoYK82eDmYSlk3cNxuUDqQJm5arANM75A0gYsdCoHg3onwaL+8WQ5e6P2RvRO7DjFZi15x7bbGwCr1u+4jwDPYryRaueCspbIsGbfXIcuIqd/W9RPSL5ORNEiJKxbWh00LzdpNFa5b6FgAHwyUT0iYkb9EaF6fo5JIv4Q+7zTX/7KuPUzZUzKLgtMO4u8ll8SZUMiz0hq/2QErOj9j4kNLkNiHYqu69SOckhVsAjTlVNhMZWWIYqNMwQzr2aeL+PtJDcWFDmL9eLrEMAAL/XzRZ9X3wA+MZyvlDnS0iOCVM6MoxWaujj9gfIG+c6InY52USwbGnhgUJIdpjJnAZrvdXiJ609Fbm76BNpkNdDKtACdB7ra4aGsrizr6MhlDke3lXmnYXqDQwEN1FMJEhsR1NlX0HlkdepGvX4CISSSx/rYQW2GMWhtg+V8BuK4JcGfxR/4Bl5ZNqbUyeivPFxTtx52O0Dtorahxa9W3Fi2ftP1qFoW128QXca+F0ezHyL6OD/aIkViYedtu8uYCIpdp1OyPfZt1sS7u145N675+93MyeM24MKTXM8u1og+cNAPrdJqEVodR0UpXa8xQHWOqRig==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(136003)(376002)(396003)(451199015)(46966006)(40470700004)(36840700001)(83380400001)(186003)(2906002)(2616005)(86362001)(40480700001)(40460700003)(33656002)(8676002)(4326008)(36756003)(6506007)(26005)(41300700001)(53546011)(82310400005)(81166007)(356005)(47076005)(82740400003)(36860700001)(316002)(70586007)(8936002)(6862004)(54906003)(6512007)(70206006)(5660300002)(336012)(478600001)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2022 09:40:11.7918
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50dacc02-9026-4ff1-03d4-08daadc8170c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5427

Hi,

> On 14 Oct 2022, at 09:35, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Stefano,
>=20
> On 14/10/2022 00:55, Stefano Stabellini wrote:
>> On Thu, 13 Oct 2022, Henry Wang wrote:
>>> With the P2M pages pool bounding the domain memory runtime allocation
>>> and the documented minimal size requirement of the static heap, it is
>>> safe to mark static heap feature as supported.
>> Usually we wait at least one release cycle before marking a feature as
>> supported. However, I can see that this case is a bit different because
>> effectively static heap memory is a safety/security feature.
>=20
> Even with patch #1 merged, we are still missing some information on how t=
o size the heap. But see below...
>=20
>> Julien, Bertrand, I'll let you know decide on this one
>=20
> It doesn't seem to make sense to security support the static heap when al=
locating statically memory for domains are still in tech preview.
>=20
> That's because if you want to have your system security supported, then y=
ou will need all the allocations to come from the heap. At which point, res=
tricting the heap seems pointless.
>=20
> So I think it would be better to wait until the static memory is fully su=
pported.
>=20

I think this should stay a tech preview in 4.17.

Cheers
Bertrand

> Cheers,
>=20
> --=20
> Julien Grall


