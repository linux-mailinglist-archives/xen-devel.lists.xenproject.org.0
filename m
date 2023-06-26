Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C92873EBDB
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 22:31:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555656.867571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDsru-0005hj-RS; Mon, 26 Jun 2023 20:31:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555656.867571; Mon, 26 Jun 2023 20:31:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDsru-0005f1-Nr; Mon, 26 Jun 2023 20:31:26 +0000
Received: by outflank-mailman (input) for mailman id 555656;
 Mon, 26 Jun 2023 20:31:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VCbL=CO=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qDsrt-0005ev-Fb
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 20:31:25 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0602.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a29447a-1460-11ee-8611-37d641c3527e;
 Mon, 26 Jun 2023 22:31:22 +0200 (CEST)
Received: from AS4P189CA0007.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5d7::18)
 by DB9PR08MB7581.eurprd08.prod.outlook.com (2603:10a6:10:305::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Mon, 26 Jun
 2023 20:31:16 +0000
Received: from AM7EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:5d7:cafe::23) by AS4P189CA0007.outlook.office365.com
 (2603:10a6:20b:5d7::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.33 via Frontend
 Transport; Mon, 26 Jun 2023 20:31:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT013.mail.protection.outlook.com (100.127.140.191) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6544.15 via Frontend Transport; Mon, 26 Jun 2023 20:31:15 +0000
Received: ("Tessian outbound c08fa2e31830:v142");
 Mon, 26 Jun 2023 20:31:15 +0000
Received: from 062de056ab1c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 07B6B930-6C4B-4012-8C7E-90A8E9A7C837.1; 
 Mon, 26 Jun 2023 20:31:05 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 062de056ab1c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 26 Jun 2023 20:31:05 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB9PR08MB9588.eurprd08.prod.outlook.com (2603:10a6:10:45e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Mon, 26 Jun
 2023 20:31:03 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1024:cf14:d520:9b38]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1024:cf14:d520:9b38%7]) with mapi id 15.20.6521.026; Mon, 26 Jun 2023
 20:31:03 +0000
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
X-Inumbo-ID: 6a29447a-1460-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GBM6UfEb0tfydvZVwh/Qvf8w7fmLo3MsFup7d7Get+o=;
 b=j0jpTKhgbv/RjYD6weMZSKcTtU8A8XFu9msu4ylim/3daK7XvnMaieobZnGuu0IUvGNpY222cOcmdWcI3cMUDoNmySV1FYAZ+ePs9OODEZ9DwqyUtGClXfnx6/uTrh1qJeKU2si0pU6GqRl/dFnOb659MhPF+6dZv7JZ9+igzoc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dYOat4n4q7h7/9YXIzunJ0vbURQ43d/IFlufN+XLx4d41QSEfvIM2lTLiVH8X+kXnOM9kTBVBduLjb36+tISrDV08hXeOhzkCrirSt0vIZ1jX44DwWFSGkSFPshjm+AfkI/n57sgRJ1EdSRkISLNjNnQrpLDOYijsCJgLRNPcvQfBXFdj9prw8tFCTFl7rK2gtNwugLALRR6a2fuiFsty8QZdEMzngqGX2kMqtpDRS2iHEt6Cf1/R8JM3SKT6S6Gv+8nYdeE8jIwYpNW19GTLUwUEcIKOcUD2M8S8UgMOL8ypqf0y0hMaSolwFZtPSIn/0XahMENnzTvwXJbESNPFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GBM6UfEb0tfydvZVwh/Qvf8w7fmLo3MsFup7d7Get+o=;
 b=bJaL5/honfv7n1ZszvsZn5DKs+3DfBpb/RlLqc0gCc8/kq7nT63l0RiFylCc6CQuyHo9VYwtcTL2yZtv+TUFsyrC7yts/XzEHM7BXalEYL27Rfl1DawbT4+GgHIscE1ZMAgw3CT87TaQGE+9RXxNZTSKVUF64ik1jBp5K5iK/IDrSVuRIFqxO48xjDKik0nd03JuUX+fWf8Vp6P8aJtOiHaIHCQSfAnHzhDfBgN0ORTSylTJw9agb9UsHaCxDUPs0hVEYUCIUY7xcEl/ZC7N76SW5XouUs/fdSlK61RF6FOZBjoy018MNOxHm1XOeMphPiNmaQShk8lpnto9wRdiSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GBM6UfEb0tfydvZVwh/Qvf8w7fmLo3MsFup7d7Get+o=;
 b=j0jpTKhgbv/RjYD6weMZSKcTtU8A8XFu9msu4ylim/3daK7XvnMaieobZnGuu0IUvGNpY222cOcmdWcI3cMUDoNmySV1FYAZ+ePs9OODEZ9DwqyUtGClXfnx6/uTrh1qJeKU2si0pU6GqRl/dFnOb659MhPF+6dZv7JZ9+igzoc=
From: Henry Wang <Henry.Wang@arm.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@cloud.com>, Julien
 Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Luca
 Fancellu <Luca.Fancellu@arm.com>
Subject: Xen Summit 2023 Design Session: Stable Releases
Thread-Topic: Xen Summit 2023 Design Session: Stable Releases
Thread-Index: AdmobMSQTHaF+Lp8SkK9E1+SOwB5PA==
Date: Mon, 26 Jun 2023 20:31:03 +0000
Message-ID:
 <AS8PR08MB7991C93DDF18C60A5B91B8D69226A@AS8PR08MB7991.eurprd08.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: AA09D4D31A72BF45BBF8AA9CE7B3287A.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB9PR08MB9588:EE_|AM7EUR03FT013:EE_|DB9PR08MB7581:EE_
X-MS-Office365-Filtering-Correlation-Id: 66cd51bf-7a9b-4570-754e-08db76844a70
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 v51vxdZVpdfB+/08EqI6HDrC48cukWxJP1HAWqhYiI675pYMzC/fm2lQzOgecvIzIS0tTlQ83fbSWQP5R8GcrFcj/Lb+F0MvMyW2NKd6lIiWLbyYlGmXO5nnFy944Wziyr8niNTsDNGaxx1lYbl9YVwxBtAax1w+7zR1dd0GheykDdnhTdYJz4IOL6NvEoLiNQB2UR9tHGfVXDptczrFuu8V1SJNSzhwelh306NC98blZ3i23uvn5wS4IhQWfRfPNCMlvU+kWO4Xbh3Kww9LI/wq8iP9TdxF/41kZfth0SJx2k3oTGWDISqRV2tRfv/u0MmUawVOO7jM/L0Yt/x1WDbfTTjpF7qa/4nb7WkC0n1onC76xCQOZ8uvn80leEvqH31XWcZXg2qDkz1JmjRQUCVchLr/D3AnQeRjmBLG0aEI8/F5Auzt7cwNSLHAi8JF1HhT5hC52rr91Z/bnI0318kKWKKb0HDl3uScPyqXktZWW78IShfBZDDGfaTJmeNi4OTul94HcriuDfqyYQZ91dpN71pCiIMZyT5bRDqv6YW0iR8DmESDFUxo1W+/Njdtq+YLVywHtx8K4Nys/SU06F/aj3D1sRgGEB8oXLSjpL5MmZLH/JxWgaCyM3pBk1kj
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(346002)(39860400002)(366004)(396003)(451199021)(66574015)(478600001)(6506007)(7696005)(71200400001)(54906003)(83380400001)(66446008)(26005)(9686003)(186003)(2906002)(5660300002)(52536014)(33656002)(122000001)(64756008)(316002)(55016003)(66946007)(76116006)(38100700002)(8936002)(8676002)(41300700001)(6916009)(86362001)(4326008)(66556008)(66476007)(38070700005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9588
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	907c6018-b15f-4e74-2189-08db768442bb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+zRkrgR0y+4Z7gHhKUo/vHj5FY4ma1C4gceiCwh+eJEKDyI1WgB8CkTvl8ZMG9vv4hyV0kJA3mat1waMrHH48FNxJPBCT7vHZ2avOQNKRjcG3qsi1uut4yqKZcj3Hrdcy5iW/Qzn1alljCtDAxjRrMMzQo2H9f8P+2I7dc52ojm5hsXIqoWsTnlszj+/8uVpNdGij7yYDNlMglvTX8Hp6jYsiq8Stez+CqcrmeR/VHCzRDDXheqNDkzVN3yO6bFxYIIN4UtCkajtlMectmTEVPLnT7UP0n7nY9n6OoDbgV1WDViuUO2BgttoKvnwAvG7g5WnzfjTssau8tN8oAJX+I/FCXX77GLKFmLjjZb5qZEVMrcLfRY3p2Qaw0o4/EcTrV0TRH8Xpj58TuGA1BW/rBHj6jeWaBk3OwEE8DCsWCxZbGu2MWN90pc1xm5PFR1JqRp4YSygpS67gCdoCugvHENkPF9sA4UtpF6Uh6L83NwDnZShp2sO91iRQKHJnELW5+cq8NgB4Xz2BsCCjBfIMpmvr8Loiaj04p27/A0pwwMDc9Af2S9yrlxrR1QIC+3bziHOY+Lm9GE21sCr6/h3Tkf6IRFyGW2HtHhTDTbcfC/cUddzXPbWj6KaH10JmU5GKC6Yi7zh1gMq5fpVmdi3bk/ap6uPHhOoWGm1eeNyRFozGGLFuHO0kY+FQ26aWhfKV9aWx82/SibwNGHa7iYJX9gmtoRDqX395Wr1cfgZ6Uakn8v3d7r6OCy0jhIUHKXX
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(136003)(346002)(396003)(451199021)(36840700001)(40470700004)(46966006)(36860700001)(82310400005)(33656002)(40460700003)(70206006)(52536014)(356005)(5660300002)(6916009)(8676002)(41300700001)(86362001)(8936002)(81166007)(55016003)(70586007)(4326008)(82740400003)(40480700001)(316002)(66574015)(47076005)(9686003)(26005)(2906002)(186003)(478600001)(6506007)(7696005)(83380400001)(54906003)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 20:31:15.9233
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66cd51bf-7a9b-4570-754e-08db76844a70
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7581

Hi all,

Below is the note that me and Luca have taken for the stable release design=
 session.
Thanks Luca for sharing his notes.

Jan: for long time we've done time-based stable releases, but overtime
     it is brought up purely time based release is not a good idea.
     Sometimes because of XSA, sometimes backported patch does not apply
     cleanly. One possible solution is one stable release per XSA, but we
     need to consider we need to be practical, too frequent releases brings
     problem for people.
     One of the problem is, that patches are not public, before the embargo=
,
     so the public tree cannot be prepared for the release until the embarg=
o
     expires. Maybe some preparation can be done upfront?
Jan: Should we change the stable release strategy, Do people think that we=
=20
     should change timely cadence of the release?
B: This is only for stable release?
Jan: Yes, Major release are going to stay as they are, stable release are
     the subjects.
G: We need to know what the users of stable releases, what do they want
A: Current thing is good for Qubes
A: I've been informed that some customers in mailing list wants more freque=
nt
   release, fedora, etc.
A: I know some projects cut releases once per security fix. I got the=20
   impression from customers that they want one release per security issue.
   what they want is after the embargo, they can pull the tag with the secu=
rity
   fix.
B: I am on the yocto side, having downstream patches stored in yocto is not=
=20
   good. Bumping versions is easier.
A: sometimes the people preparing the tarball of Xen is not technically
   "users". The point of Xen security team is to deliver the security fixes
   as easy as possible to everywhere.
Jan: Sometimes it is hard to get the binaries on time after the embargo. We=
=20
   need to have a model to have binaries right after the embargo
B: Most of the time yocto is in the middle. Xen version is bumped in yocto=
=20
   every yocto release, by then the XSAs are pulled in. for yocto it is not
   possible to maintain the single XSA by downstream patches
Jan: why dont we do partial release, tags but no tarballs
A: that would be satisfactory for the people who complains, normally no one
   uses tarballs now. This would be entirely fine.
G: We can ask who is using the tarballs, we can ask LF.
Jan: dependency for the leaf trees and qemu
B: tarballs is useful for students and new starters without Xen knowledge.
Julien: We can use gitlab to make the tarball?
A: tarballs from Xen dir is not 100% the tree. It contains more such as qem=
u
   dep so not be directly done by gitlab.
B: we need to be realistic about what we can do in short terms. The number =
of
   tarball downloads would be the initial question.
Jan: mini-os
A: Just add a tag for sub-releases in xen.org would be good for most of peo=
ple
   complaining.
G: we can ask in xen-devel to collect feedback about tarball. maybe a surve=
y.
B: You can apply the tag as soon as you apply the XSA. We can also not limi=
t=20
   this way to only XSA.
Jan: Too many releases?
A: we can have even more digits in the release numbers
Jan: for interim releases, make no announcements, no tarballs, no website, =
but=20
   for normal stable releases, do them all.
A: Users do not really cares about tarballs, websites.=20
G: we can put more info about these release in the new website or gitlab
   instead of xenbits website.
Julien: Can we check the number of downloads?
A: We check the number of downloads, if nobody care, we announce that we mo=
ve
   the website etc. about the releases to new places.
G: also ask users what do they need.
B: You need a phase out. You cannot do all the movement instantly. You do i=
t=20
   step by step with proper guidance for users.
Jan: If we do more frequent release, we cannot ping people about backports =
as a=20
   new release is coming, because this means revealing there is a security =
hole
   in the code and the XSA is coming. we need to ask for more frequent of=20
   backports and probably give Anthony commit privileges for maintaining th=
e=20
   tools.
G: Summary: if we don't have to do the tarballs for sub release, it is fine=
. If=20
   we have to try to figure out who is consuming the releases as an underst=
anding,
   then start from there.
   Putting a tag will solve the complaints from people, there is a general =
 agreement.
   Check the number of downloads, put something out something in a public p=
age=20
   to ask feedback on the retirement of the tarball. So we should phase out=
=20
   that, in an agreed time.
Jan: Discuss in community call

Kind regards,
Henry


