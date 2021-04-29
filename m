Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA3036E999
	for <lists+xen-devel@lfdr.de>; Thu, 29 Apr 2021 13:31:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119901.226705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc4tK-00087o-Oj; Thu, 29 Apr 2021 11:31:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119901.226705; Thu, 29 Apr 2021 11:31:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc4tK-00087P-KQ; Thu, 29 Apr 2021 11:31:34 +0000
Received: by outflank-mailman (input) for mailman id 119901;
 Thu, 29 Apr 2021 11:31:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sKbL=J2=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1lc4tI-00087K-GX
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 11:31:32 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.44]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2ba1cb86-2e31-4746-b7b7-e7b1b90bd4e9;
 Thu, 29 Apr 2021 11:31:30 +0000 (UTC)
Received: from DB6P191CA0002.EURP191.PROD.OUTLOOK.COM (2603:10a6:6:28::12) by
 DB8PR08MB4985.eurprd08.prod.outlook.com (2603:10a6:10:bf::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.24; Thu, 29 Apr 2021 11:31:27 +0000
Received: from DB5EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:28:cafe::fb) by DB6P191CA0002.outlook.office365.com
 (2603:10a6:6:28::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.25 via Frontend
 Transport; Thu, 29 Apr 2021 11:31:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT042.mail.protection.outlook.com (10.152.21.123) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Thu, 29 Apr 2021 11:31:27 +0000
Received: ("Tessian outbound 6c4b4bc1cefb:v91");
 Thu, 29 Apr 2021 11:31:27 +0000
Received: from d3da924730e7.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A165D93C-8DE3-4F6E-937C-D520BB273203.1; 
 Thu, 29 Apr 2021 11:31:17 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d3da924730e7.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 29 Apr 2021 11:31:17 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AM5PR0801MB1940.eurprd08.prod.outlook.com (2603:10a6:203:48::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.24; Thu, 29 Apr
 2021 11:31:15 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::856e:d103:212c:8f50]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::856e:d103:212c:8f50%4]) with mapi id 15.20.4065.027; Thu, 29 Apr 2021
 11:31:15 +0000
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
X-Inumbo-ID: 2ba1cb86-2e31-4746-b7b7-e7b1b90bd4e9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=USL8mQT5el1o/fEf63MaGqw+KZW/W8Fc8WnR4UffJko=;
 b=45aG0qsUBztgA8ZlYjn2ZhzSvW40f8YVp4DPpiJIVdu2lmPpFxa9LhESjOKeJNP7/AATravMkugTkOdODxBM+1nk+k0sbv3ljxIWT0cdNAEnqqRqQhGnayGbQlUiC9A0/gXHm0rCKOEBwcqAbae+AuGQMXuZO6He/8PS8vOW2dY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1db6d910a668f173
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L4Rx/1MoCgE5RARAY4ceKVo2GbEazUNhmyPQMsDVtCNiOzmmzvMX39rTSJmQ9bZbJjzBLAN0goJKe+YjFnfzStHsnR+nsRrwoP5h797NgKV147ijXLbhuhcrg6p2Zx9M/TvJ6qPDzz2v6ReVL5iT+/9bAY4SVRw6NuAj290DIsjNqEBzfSrnIJnZW/cqQk47BnD47p4Lcon5eZFzoeDeibxsgMOpP7UDAl2A4uiDojeODq4Or+dDK2+BtmFvN6xKjspAR45kMGRRedIgZj7qbJTV/J7iIOn38mO2mgS7rbmlVQVSGXsxpuOMtY4lCigfPgfNuWspoNM/ElIMNWQa5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=USL8mQT5el1o/fEf63MaGqw+KZW/W8Fc8WnR4UffJko=;
 b=BN4mRMAVo1djmEYFG1dsvz7oyJDwL07pRs4sr/P/vg8yL25j+AdVgJwokkjqrUjRTxXccAlY7NVPvi6d3Tj9Nv9AvVJ33qUNfW0QsJGJO6WQGta/PFykko0soR+SCBBVtSsR+uByDbbe0rSi8RnIq5noMTMYEydPzZRV9J4nlEcO3JZQgeUJOZoGqjZbMHoK7AiX3duBiYqhooyPUecZVrx60iOu8wbymIQ2ZtGLN3bxvz3x560RbbEfABz6eNWy5NLz9LV331TqBxHhsaizglE55J/VmZGrbaPHTxThq78XgN83u+cxLNLxF18Py7WlmynRBvLIrnwCpfqxb2UaEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=USL8mQT5el1o/fEf63MaGqw+KZW/W8Fc8WnR4UffJko=;
 b=45aG0qsUBztgA8ZlYjn2ZhzSvW40f8YVp4DPpiJIVdu2lmPpFxa9LhESjOKeJNP7/AATravMkugTkOdODxBM+1nk+k0sbv3ljxIWT0cdNAEnqqRqQhGnayGbQlUiC9A0/gXHm0rCKOEBwcqAbae+AuGQMXuZO6He/8PS8vOW2dY=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Paul Durrant <paul@xen.org>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>
Subject: Re: [PATCH v3 2/3] xen/pci: Refactor PCI MSI intercept related code
Thread-Topic: [PATCH v3 2/3] xen/pci: Refactor PCI MSI intercept related code
Thread-Index: AQHXOrhr42FH3XtdSEulNtIMBWAh5arJ+c6AgAFnEwA=
Date: Thu, 29 Apr 2021 11:31:15 +0000
Message-ID: <636D798B-3635-4F3A-ABF0-ECA42695352B@arm.com>
References: <cover.1619453100.git.rahul.singh@arm.com>
 <480947d549c46270fccc4c6d83ae8beca3c0fce6.1619453100.git.rahul.singh@arm.com>
 <69e0f583-3c61-afe9-0710-6531f99e8a2e@suse.com>
In-Reply-To: <69e0f583-3c61-afe9-0710-6531f99e8a2e@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 414c2f28-62b1-42dd-f1b2-08d90b0253fe
x-ms-traffictypediagnostic: AM5PR0801MB1940:|DB8PR08MB4985:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB8PR08MB49852C0E2E9537E24129A83BFC5F9@DB8PR08MB4985.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 CygG21Btq6gZPG7k6FCTpCCLDza7hKuDff0et6v6Tc+MSztsXCAoPULQ9bdaP2brKYlSZ/nJQ06GD7G3fmN7h6XDbV3FGNEOQXAN9KDhc4s1j/6thil2otDh/GI7/1VBZ8LCze9EdNTehRK9GRh5dGD5Gia4LTLt9fQIcMt7rM42wh9Oj5fb5GhZ9YN4z2rUl/wOjMnnvneNYrCGH2KQn+o84BwALd94GWd/iYPLCx4ZQOzBrHTn1irb4ViHy0rmISQ8d6afNXBJb2VFtN7s7nkIzNZFpSbshDZU2pxMlcw6UFfPG2ys3c8Q9zdGPluRg1gwwQBHHTUhtuAHbc8iezQuuJ4M0pbrArlklMdYUOafyZ6NylVG/ZeqIUY/C7N5AU6lCxtOnt6rrpyt2ZS6P6Wq84RTJFnA/jSYK+rYaUdlSequIgOH60EzK7swRBAWtwchXZ/ryw33dU76AAIJbLbLudTE9ixgbNy72Y6W9mmLorrFD6Vp1AAuunzJrHaFVYySJJ+ihaqYTTqB+RGx3o55hInClPOD60aOFewmt5XAqfEkZiPJaapwlNK8BaL83MnB/gGsW3IpXZy83RH+vFZJ658XJXeszhh2uvjha32Ll5ypop59iGU6EEO+wZDOaIUm5vb7yqj05dWfoTU5XIcX6LZHUwSU/kD7DlB4XtM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(346002)(39860400002)(376002)(396003)(38100700002)(8936002)(33656002)(8676002)(186003)(66556008)(64756008)(91956017)(6512007)(66946007)(76116006)(26005)(6916009)(66476007)(71200400001)(122000001)(36756003)(83380400001)(2906002)(7416002)(86362001)(6506007)(478600001)(2616005)(53546011)(316002)(5660300002)(6486002)(4326008)(66446008)(54906003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?iso-8859-1?Q?U+2ym+r5QH/38FMDZGriUiHTK4PMXHQplfX+c/bSxJceOMZQBSE8deH9Ze?=
 =?iso-8859-1?Q?vGl/eUphHom98Gmk9G37yyKCagSayAQYn0rKVVHA8jK3WGdGalXCnEWKjO?=
 =?iso-8859-1?Q?nXUA3ibtSxkWXndkltCl1jjDhxVUt2xtoNe4NhfZjXODUQfSN0MQsj1F4R?=
 =?iso-8859-1?Q?9jyhQT6cYW/QsXcRywF81JsEBJHn014ylhQ3L7kku7gzrA6UtuQm/NGhwX?=
 =?iso-8859-1?Q?wA5nXnAm4BWK1f6b/PUywt/+7Wi4CmxouzO2qqrELNChtMyybPiZvahkVq?=
 =?iso-8859-1?Q?cNUTHovAXT2tILvfdkzKS+shW2RoWQSM9ElSd8VtQq2erLbGv3jsWm7N0e?=
 =?iso-8859-1?Q?Pkci1fu6ugZkobRVHC8rerv1zAuNc2SL0xkdDHkKc/f54PiIfVjIvag7BO?=
 =?iso-8859-1?Q?nKUNTYSHTVyy8qOzQ+zwX81FHepSrNp0CSB9E8yoHeYN3EqQZp03H81TtY?=
 =?iso-8859-1?Q?OPkjLBRpO4nnsg0rKSifTlhpOcuv/grnvWfUuj0JzliHnZFZQXA9fbepLY?=
 =?iso-8859-1?Q?OAG64IgWHZo+geSB4/xtz1OaiTqn7XgLnPMX5hbCcYUsUzPDNnl6ip60T5?=
 =?iso-8859-1?Q?HvfwfLvrCDlWfpBmUBXR3SLlKkvRxDtPCM+3cWJZLYQANSrYneRMIbKrEv?=
 =?iso-8859-1?Q?4xCaSFfyCub+jJpH2UI4ojGfhVjKn8hXZYQNLXOiKTuFuk0xffutkvjYBN?=
 =?iso-8859-1?Q?zPBYa8JzHlyWwW10DiC0tCKgV9E8S6mrBBFKO0XAszw0fbXyHsUqJ4xvhu?=
 =?iso-8859-1?Q?iwuzULiY2g/YcFjjSZPz9iNWe1xH/6a9xhunz6qchdRWm2znOS4AQgxcc4?=
 =?iso-8859-1?Q?BZGAXa0D4MBqK/kl7jAgYRd5GeRH1SpQbjwGJ5H+2fSSs5w6TFiIYjagM+?=
 =?iso-8859-1?Q?kKTSkPtIgWIE+HXM4eemJ+By0SXOMWGhWzCE98WSJ9Z3NbHSMNncChxCtN?=
 =?iso-8859-1?Q?gkJKjcTiA8cIbHq8xfdzfxKdQCDJ7xtCkzCr8WlYP4BuN0fxwNDjcDpT/c?=
 =?iso-8859-1?Q?4QNV/pkkTjuS1zXaVK/3MrI/5IdIYiV9gKPVtqgXAsFk70JxwYgVw+eG+n?=
 =?iso-8859-1?Q?Ema/59geDa+TrpN2rC7dTwOa6SizNJjQnCHvW6WiP6RBPrrpX7e71JG042?=
 =?iso-8859-1?Q?706JliZkQu59F4XjnYgDvEthgGEzCN0D9+Zr6wHYZSfNcoACbu+RZ61Qza?=
 =?iso-8859-1?Q?6uSQJgFmt0T94n6wP/wRSKatAQLKZ5kf449nJGWER7UH0+vJLdI6NAKR4e?=
 =?iso-8859-1?Q?Ndu3Z9NaQd5F6Y5r/ot1oD2xhaurM3H8JmG7z4XquREaC+S/Y64OGRVAo9?=
 =?iso-8859-1?Q?afHrOC46m4IzB18Vm+BTGqO6CuAnOx65hICOh++AnE5U14cEUqvLB+BnU0?=
 =?iso-8859-1?Q?XpuOHqAAUG?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <81D5513216289040BE7C0A7CE830ADE8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1940
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	73978460-f66b-4083-0d7d-08d90b024ccc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wY0hHBqW3+4s6ZVF6TCo+lwfrHObWNCmAaIkGLbyQT3+lIAufK5B2Jt+AeE4AX9aw2JTU13E1aQVadExGu03BGpFRwkG1qXHueAlrCAONZRSEoXInPtsQWEKYEG+Gxw2YZyQiKdN1OF8+LgM9qdOaXUHffSwznzl5h+pFaA6mrMhsW5I7rXaxH4SolgsAto1GHJorZQXhnh7AUMwxz7sofNxhAVRBeiwBHbCCmp2eYd/RRIPwM3oGZqkg4zJcDPOvoKmsBgc50NE3TR4Aj0J6VCHDqt4UG4lM63rnOx+0sEB2gGiquHjpDRDUR5McKT20KUE1yjJWG7g4gHi7IBXUR+j8k/tZx+cLZKUf1uZMllkMRORceCzbfyILud8ltZuGBw19puKjmWoTqnjBDXih6NRXrGwxClutjnWcZEYTXXSkIma8I/5vViLWsJo06kt0JQYo4J0TvAfjtDY8BIUgRX5TH5hQH7GMVrJLbQtwvw/kFtO2wMmonu+Vys58b+Lou1oLfuSvIYsy9dMZJT5I96eY1E2lHjJYswsy9u1vdwj36kQoZlSZjlQn4+7UJQo/RswkN5tzZYqPeXlEfR8VvUC+EebGP9QhrDX8IgpJDDQ58+kr+2wCz6iQxApCx6v/JNXatPfUwq/cEvnzlXN2a4oQb/eW63kqmBRCkSKm67j3Uu6rP4VNhjs9OFng/H0
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(396003)(376002)(136003)(346002)(46966006)(36840700001)(4326008)(33656002)(186003)(6506007)(356005)(70206006)(70586007)(2906002)(34020700004)(336012)(6486002)(6862004)(47076005)(2616005)(54906003)(26005)(316002)(86362001)(82740400003)(81166007)(36756003)(8936002)(6512007)(478600001)(8676002)(53546011)(36860700001)(82310400003)(83380400001)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2021 11:31:27.6622
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 414c2f28-62b1-42dd-f1b2-08d90b0253fe
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4985

Hi Jan,

> On 28 Apr 2021, at 3:06 pm, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 26.04.2021 18:21, Rahul Singh wrote:
>> --- a/xen/xsm/flask/hooks.c
>> +++ b/xen/xsm/flask/hooks.c
>> @@ -21,7 +21,7 @@
>> #include <xen/guest_access.h>
>> #include <xen/xenoprof.h>
>> #include <xen/iommu.h>
>> -#ifdef CONFIG_HAS_PCI
>> +#ifdef CONFIG_PCI_MSI_INTERCEPT
>> #include <asm/msi.h>
>> #endif
>> #include <public/xen.h>
>> @@ -114,7 +114,7 @@ static int get_irq_sid(int irq, u32 *sid, struct avc=
_audit_data *ad)
>>         }
>>         return security_irq_sid(irq, sid);
>>     }
>> -#ifdef CONFIG_HAS_PCI
>> +#ifdef CONFIG_PCI_MSI_INTERCEPT
>>     {
>>         struct irq_desc *desc =3D irq_to_desc(irq);
>>         if ( desc->msi_desc && desc->msi_desc->dev ) {
>> @@ -874,7 +874,7 @@ static int flask_map_domain_pirq (struct domain *d)
>> static int flask_map_domain_msi (struct domain *d, int irq, const void *=
data,
>>                                  u32 *sid, struct avc_audit_data *ad)
>> {
>> -#ifdef CONFIG_HAS_PCI
>> +#ifdef CONFIG_PCI_MSI_INTERCEPT
>>     const struct msi_info *msi =3D data;
>>     u32 machine_bdf =3D (msi->seg << 16) | (msi->bus << 8) | msi->devfn;
>>=20
>> @@ -940,7 +940,7 @@ static int flask_unmap_domain_pirq (struct domain *d=
)
>> static int flask_unmap_domain_msi (struct domain *d, int irq, const void=
 *data,
>>                                    u32 *sid, struct avc_audit_data *ad)
>> {
>> -#ifdef CONFIG_HAS_PCI
>> +#ifdef CONFIG_PCI_MSI_INTERCEPT
>>     const struct pci_dev *pdev =3D data;
>>     u32 machine_bdf =3D (pdev->seg << 16) | (pdev->bus << 8) | pdev->dev=
fn;
>>=20
>=20
> Is all of this really related to MSI interception? Iirc the code here
> has been around for much longer, and hence is more related to MSI
> support in Xen in general (as required for PV guests in particular).

Yes I agree this code is not related to MSI interception but I decide to mo=
ve the code=20
under CONFIG_PCI_MSI_INTERCEPT flag to gate the code for ARM as to avoid an=
=20
extra flag. We can modify this code once we have more data how MSI will be=
=20
supported for other architecture. =20

Regards,
Rahul
>=20
> Jan


