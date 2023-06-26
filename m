Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C432973EC32
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 22:54:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555664.867590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDtE2-0000I9-QW; Mon, 26 Jun 2023 20:54:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555664.867590; Mon, 26 Jun 2023 20:54:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDtE2-0000GE-Nq; Mon, 26 Jun 2023 20:54:18 +0000
Received: by outflank-mailman (input) for mailman id 555664;
 Mon, 26 Jun 2023 20:54:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VCbL=CO=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qDtE1-0000G8-HF
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 20:54:17 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0613.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9bb54150-1463-11ee-8611-37d641c3527e;
 Mon, 26 Jun 2023 22:54:14 +0200 (CEST)
Received: from AM6PR0502CA0043.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::20) by AS2PR08MB8877.eurprd08.prod.outlook.com
 (2603:10a6:20b:5e6::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Mon, 26 Jun
 2023 20:54:12 +0000
Received: from AM7EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:56:cafe::f3) by AM6PR0502CA0043.outlook.office365.com
 (2603:10a6:20b:56::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.34 via Frontend
 Transport; Mon, 26 Jun 2023 20:54:11 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT037.mail.protection.outlook.com (100.127.140.225) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6544.15 via Frontend Transport; Mon, 26 Jun 2023 20:54:11 +0000
Received: ("Tessian outbound e2424c13b707:v142");
 Mon, 26 Jun 2023 20:54:10 +0000
Received: from af778688d290.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 ED6AEADB-9DAE-422D-8A7F-79AE16C78D1E.1; 
 Mon, 26 Jun 2023 20:54:05 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id af778688d290.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 26 Jun 2023 20:54:05 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB9PR08MB9564.eurprd08.prod.outlook.com (2603:10a6:10:456::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Mon, 26 Jun
 2023 20:54:02 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1024:cf14:d520:9b38]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1024:cf14:d520:9b38%7]) with mapi id 15.20.6521.026; Mon, 26 Jun 2023
 20:54:02 +0000
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
X-Inumbo-ID: 9bb54150-1463-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AmFJVhpCI6znewtftscvwD3zMzz33nwPhiW8ifHN6qo=;
 b=iLjmt5FV4klVQy9h4hbmGB6MUef5emvD76pUkHa6JCf+tAgEgYVkJzM+B66gb0FxQekzDSTyIW7QrTyCbPE4eh8MMqNvh6R8x0fO8RYk5E/PI7+aMar8Vx/i2dXylXW2YqdZ/O50sgza+kII8U1nrTYLCtv6BIJJCXFpExifNO4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UEuf1tSv12UpQLLDCw7MCUEF9ZgSMrneA6f0eMr2TwwAZ3UPBNLR5NUtb2LlJewyv1Q4OeW6NqgXFr24G2HCQiD8jgYVslUVmMlsrywlw7Tuvp0En3ATEuRTK4hn2dejfPugTOredyyDbG9id5rNZTwqdUPHTYXn8kVKiOXCvk9wyPyOCdVI4k3+pOwZh/6LC/BDUOYLCa7zXa6Dvv2JND7JpKqS0kKbuhgzZ4yfeA3c4Y9u3qzCsV8E7VYHEk7+JmUyFnU072A9idDQYtAkH6cZNjTLZFJInp2iuT+2XBNhiydkOfFMNx5At+PiwPlicFMKKvijpnBgWmcebPVHAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AmFJVhpCI6znewtftscvwD3zMzz33nwPhiW8ifHN6qo=;
 b=DoauJT12jZu++8aKN6XoWJ3kh1lJhYtcSqZD8rAyO4/ffeq7JXQ58VzmHZGHDI0tZtU+vBsOmct0HAvMGcTet+JQAn6+4fAVDGiYyzkRq4F9znNdwcfRwf7t8OyZoU57UtCWA87H+B8vWLxlidMimudrpCQ3TE2mgmLWFW74RbbWSCTxY186a526Zfv9qjKFKpiKpzGm+8vFROiC1iSZDBgqL0vJDkNLv8Pgxmrev23aL8Q9CTz4J7sPW49pHZcsl31uTDCYsZWP0k/hTzqF/QUZTcfxdDYspy1de9eRBEqUYVDsUMRwwYaNkiguwDCzoLg+qU9lCAQfOGUDSQEgGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AmFJVhpCI6znewtftscvwD3zMzz33nwPhiW8ifHN6qo=;
 b=iLjmt5FV4klVQy9h4hbmGB6MUef5emvD76pUkHa6JCf+tAgEgYVkJzM+B66gb0FxQekzDSTyIW7QrTyCbPE4eh8MMqNvh6R8x0fO8RYk5E/PI7+aMar8Vx/i2dXylXW2YqdZ/O50sgza+kII8U1nrTYLCtv6BIJJCXFpExifNO4=
From: Henry Wang <Henry.Wang@arm.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien
 Grall <julien@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
	"alejandro.vallejo@cloud.com" <alejandro.vallejo@cloud.com>
Subject: Xen Summit 2023 Design Session: Doxygen
Thread-Topic: Xen Summit 2023 Design Session: Doxygen
Thread-Index: AdmocBRMK0dHrUOwQbGVwm1jyHsL3A==
Date: Mon, 26 Jun 2023 20:54:02 +0000
Message-ID:
 <AS8PR08MB79916D1F2CAFAEC6AD0574629226A@AS8PR08MB7991.eurprd08.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 557CDB15D79A934E8A62E89BD7B27B03.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB9PR08MB9564:EE_|AM7EUR03FT037:EE_|AS2PR08MB8877:EE_
X-MS-Office365-Filtering-Correlation-Id: d21fd09b-5274-4991-9e93-08db76877e14
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 KrDFzkMKox8Ag6aHlX1qtF73b5YqoNcw/XPGjFkfy31/amPcIVCorKhq+40kJ9Y65PcSDVk3j7XQvw6u5utUHt9fqR+SajvGl4NwvKjgZT2eVUCX4jCI8sLP36slwAwXQtALl6fTEj7Fn4k7N3DwTVD6ClM9ERMMNWqd0RH/Vu+Zj5FJmhmJeePCMosTBL6TSevxstWyzIxKnwmko/MId/q1n3b7rP2Bb7u02Q5I3jIFb0iUAz2vZ5CSI7pp58BlMFamDdbWGO+2VnsGaYJdmEdleE7QRnCv8cqUUv/xWQPfZesDj3vYv84Pw4s5XFNatB9c/jgbxE2iE6xXnjM4kIBlIMQgu8tk9jV9DIdBL4jV81K7kd7H/kJ54V1+6ZVQapYf4WT12FTXzxZvpFYZcFm8TuysBWGCj8hgPIk2zeSnkwoJBEP7+BtkeTU3Wj8u2V+yPf8vrQU4Y59LfsbJAP3knRfZmklQtSmWbXnezwOHgTfmQ8EQJ6UyRe2xNF+ZHV8mH8/LZj9Ao+BtIVc7RCB1DEkr2cOYUdO28fSnspGgRxi30Qz7cKNoHHWlYpqRNa+j9smqw2ZcGiYGrSLxbNPfDW4mdQg61hP2IvG1chZVgPAV1z7+6vqouBrdRTvT
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(376002)(39860400002)(396003)(346002)(451199021)(2906002)(186003)(71200400001)(7696005)(122000001)(38100700002)(6506007)(26005)(9686003)(55016003)(41300700001)(54906003)(38070700005)(86362001)(478600001)(316002)(66556008)(66446008)(4326008)(66946007)(6916009)(33656002)(64756008)(66476007)(76116006)(5660300002)(52536014)(8676002)(8936002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9564
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bfcb6caa-f52d-44de-119e-08db768778d5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KVtgdhbh0Nfe/E2X+3o8qmph0lJcFeP7tB/k9zidnJRnIBi6VUvqYBuHKacD9EkTcSGIzWd0I7/Phv49m98t+IcMMGAz1AnoXspK18rClXOYbLZALeeLXjf6gosDGX0NXRezxSv7K1wjxH0LIkUrK9xKe7bdD69skPsed6ZHinCYPC8bE3fZUeK08KVjc0SyAPpSTlymlcTgm0yZw7C7b3Dh/tT9qTABqux1Q8073dOvMc2uociZhbzYRC2DHIJ1wEDrlyfMKEaZNU1J17pUopxDNpzfBObrvr/F4u4xulFwHrSUr38LrTd/XMlUQk68DvD9aGrDfYzQpYUQkCLLauz9tawC/AP3kCgKiFTd69t71FGLw2ZeY2uMeKgtEhr5dJNhYdnA2dBTmoJq0R8Jlezi2b0/OA/x78K4KhgIj8SdrlRpc5cQmxRYDgxo6J16Hzl/Xptaf8/7Y0zuSPru3m2W0Y4K5eIKMzLOQP6Rp5x3XFTgRR7sHaqpWo5rFh9IPZZClw4y4eo07dVpUIr1ZwRwlE982O6PYuEGN0rKOH+Hxuu+qgeecWS5QGb1mRl7ZlDwbuC/gj/oTKq9A5lSOfIsdaVTJoBvoVyH73Cj6Ea8qj/a1ENCxqPec+bRHEHH7cS3IJElxCrjj7HGwgoyB+POcmFh/1FcryOUDv9VYtt5ZlLiUpEb/1CN81CBLjz1VDzjOwzFFhKHAKaW0YJmCOqvX3YeiihqggwRApcvF0n1XAndeJTP1W09k6cmO40F
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(136003)(346002)(39860400002)(451199021)(40470700004)(36840700001)(46966006)(26005)(82310400005)(36860700001)(47076005)(107886003)(478600001)(336012)(7696005)(54906003)(2906002)(6506007)(186003)(5660300002)(52536014)(356005)(40460700003)(33656002)(70206006)(6916009)(81166007)(55016003)(82740400003)(9686003)(40480700001)(70586007)(316002)(8676002)(41300700001)(4326008)(86362001)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 20:54:11.0531
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d21fd09b-5274-4991-9e93-08db76877e14
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8877

Hi all,

Below is the note that I've taken for the doxygen design session. Please co=
rrect me
if I made mistakes. Thanks.

Luca: this is to discuss our current documentation and improvements.
      We started at Arm 2 years ago to introduce sphinx and doxygen.
      There are some problems as doxygen sometimes needs some in-code comme=
nts.
      Wondering if having doxygen in Xen is a good idea, we can start from
      maintaining 2 docs in the project, one is the current and the other i=
s=20
      the experimental one and then evolve from there.
Luca: we have a series Arm internally, we need to rebase it again and again=
.
S: We have a scripts by Ian Jackson available to do things related to the d=
oc=20
   and the website. The script is unmaintained now and we might need to get
   rid of it. doxygen is better in terms of maintenance than perl, but the=
=20
   problem is doxygen is not really "improvement" of the doc itself.
J: It is more about, for example, list all the hypercalls description in th=
e=20
   same doc instead of maintaining the large series.
S: If we want to have 2 docs, we need to keep consistent between docs, the =
2
   docs should both have complete information about every hypercalls.
L: We can start from smaller steps, maybe we can just start to construct th=
e=20
   new doc instead of directly introduce the hypercall description.
B: if we agree the doxygen is the format we go with, the change is more or
   less mechanical, but the problem is to determine the format we will use
   and the correct things to do, like how we build the doc
S: agreed
B: doing the mechanical change should not change the existing contents at a=
ll.
   Otherwise it is hard to review. we need also to take notes about the=20
   possible improvements during the review, and gitlab would be a good plac=
e
   to have such noted down.
L: our build system is able to build sphinx and html based doxygen doc. can=
 we=20
   push something to the community about introducing such doc?
B: Also take the opportunity to introduce the gitlab pipeline for building =
the
   doc
Alejandro: I know there is a way to do that
Anthony & S: someone knows the xenbits webpage and doc would be good to spe=
nd
   some time to help
B: we need to keep the old doc for a while because we need also to provide =
the=20
   doc for older xen releases
L: suggestions about introducing the doxygen
S & B: I would start with a 1 to 1 doc instead of too many redirections and=
=20
   things complicated
L & J: Since an agreement is more or less reached to start to introducing t=
he=20
   doxygen + sphinx, maybe we can continue the discussion in the next commu=
nity
   call to involve other community members unavailable today
Anthony & Bertrand: we start from use doxygen to replace what it is current=
 now
   and then even start to work on constructing the function API doc using=20
   doxygen in the future. This is useful also for MISRA.
Luca: For now I cannot commit anything to it, but I will ask for internal
   opinions and others can also contribute to this.

Kind regards,
Henry


