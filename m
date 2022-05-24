Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2D553204E
	for <lists+xen-devel@lfdr.de>; Tue, 24 May 2022 03:36:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336099.560397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntJT1-0002sv-Bp; Tue, 24 May 2022 01:36:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336099.560397; Tue, 24 May 2022 01:36:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntJT1-0002qL-94; Tue, 24 May 2022 01:36:11 +0000
Received: by outflank-mailman (input) for mailman id 336099;
 Tue, 24 May 2022 01:36:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iQM0=WA=citrix.com=prvs=1363f17a3=lin.liu@srs-se1.protection.inumbo.net>)
 id 1ntJSz-0002qF-Jd
 for xen-devel@lists.xenproject.org; Tue, 24 May 2022 01:36:09 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd1304f7-db01-11ec-bd2c-47488cf2e6aa;
 Tue, 24 May 2022 03:36:01 +0200 (CEST)
Received: from mail-mw2nam08lp2176.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 May 2022 21:35:55 -0400
Received: from SJ0PR03MB5405.namprd03.prod.outlook.com (2603:10b6:a03:286::9)
 by MN2PR03MB5168.namprd03.prod.outlook.com (2603:10b6:208:1ec::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Tue, 24 May
 2022 01:35:52 +0000
Received: from SJ0PR03MB5405.namprd03.prod.outlook.com
 ([fe80::871:4ab8:9b74:1cf0]) by SJ0PR03MB5405.namprd03.prod.outlook.com
 ([fe80::871:4ab8:9b74:1cf0%4]) with mapi id 15.20.5273.023; Tue, 24 May 2022
 01:35:51 +0000
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
X-Inumbo-ID: dd1304f7-db01-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653356161;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=AMjGSYoSDr1II+HY6tjfoYblKWLPY8jO4mHfz7mwE80=;
  b=dPeNJbABdfp0cqxhKFrOlnNxQGqJHT25gP/5YkmzWPKA5KyXVk0bJcgV
   YZ0Fdv1diY9SjJ3WeSg3iAKft1fHV3aHzYqXewf95EnayuaxuC+aC9P6k
   5gam9J6/UjnpaMNHXsWI2H/oPgEdXRSUkscEOUr0aRmrYQ+SB/9jSTb0R
   w=;
X-IronPort-RemoteIP: 104.47.73.176
X-IronPort-MID: 71861221
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:NlnHxK0pNU7maOB8N/bD5Rdwkn2cJEfYwER7XKvMYLTBsI5bp2YFx
 mJLXT2AbqyONGf1f4x0aIyw8U1SsJLTyIJgGVdvpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EU/NtTo5w7Rj2tMy2oDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /0c7KOpbgUlOpf9u7ohFANENS97BKRvreqvzXiX6aR/zmXgWl60n7BLMxtzOocVvOFqHWtJ6
 PoUbigXaQyOjP63x7T9TfRwgsMkL4/gO4Z3VnNIlGmFS6p5B8+YBfyVu7e03x9p7ixKNfLfY
 YwdaCdHZxXceRxffFwQDfrSmc/33ymhKmcC8Tp5o4IuuTX351JY+oL2PdXsJ/KWf8AEt2iX8
 zeuE2PRR0ty2Mak4TiY9nOhgMffkCW9X5gdfJWo+/gvjFCNy2g7DBwNSUD9sfS/klS5Wd9UN
 woT4CVGhao97kWvSvH0WhSqp3jCtRkZM/JLCPEz4gyJzqvS4i6aC3ICQzoHb8Yp3Oc8SCY2z
 FaPk5XsDCZ2rbyOYXuH8/GfqjbaERYSKWgOdCoVVzwv6tPooJwwph/XR9MlG6mw5uAZAhn1y
 jGO6S0h3bMaiJZb073hpA+ZxTWxupLOUwg5oB3NWX6o5R94Y4jjYJG07V/c7rBLK4PxokS9g
 UXoUvO2tIgmZaxhXgTUKAnRNNlFP8q4DQA=
IronPort-HdrOrdr: A9a23:HfjKi6kAxDeqULwbYbMYQqRkyYLpDfOHimdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcIi7SdK9qXO1z+8X3WBjB8bZYOCAghrkEGgC1/qp/9SEIUHDH4FmpM
 BdmsRFaeEYSGIK9foSgzPIX+rIouP3lpxA7N22pxgCcegpUdAY0+4TMHf4LqQCfngjOXNPLu
 v42iMonVqdUEVSSv7+KmgOXuDFqdGOvonhewQ6Cxku7xTLpS+06ZbheiLokCs2Yndq+/MP4G
 LFmwv26uGIqPeg0CLR0GfV8tB/hMbh8N1eH8aB4/JlawkEyzzYJLiJaYfy/gzdk9vfrWrCV+
 O85yvICv4DqE85uFvF5icFlTOQlgrGoEWStGNwyUGT3fARAghKRPapzLgpDSfx+g4uuspx37
 lM2H/cv51LDQnYlCC4/NTQUQp2/3DE6EbKvNRj+EC3a7FuHoO5bLZvj399AdMFBmb3+YonGO
 5hAIXV4+tXa0qTazTcsnN0yNKhU3wvFlPeK3Jy8fC9wnxThjR03kEYzMsQkjMJ8488UYBN46
 DBPr5znL9DQ8cKZeZ2BfsHQ8GwFmvRKCi8eF66MBDiDuUKKnjNo5n47PE84/yrYoUByN8olJ
 HIQDpjxBoPkoLVeLizNbFwg2HwqT+GLErQI+llluhEk6y5Qqb3OiueT11rm9e8opwkc7/mZ8
 o=
X-IronPort-AV: E=Sophos;i="5.91,247,1647316800"; 
   d="scan'208";a="71861221"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JKU3cwlVJIU6/ww7FWru0X/f1wGqV6qoi8nU/iAWK4FUAsJ/0jfmapWd7GJMztEMcwucZIFEA53xiLK96heR7m5LfRb7DxgWy+7/9cU/dxA2uvA2cu7LjufPKM9MP1xOF501qu1QW4r/VYEdktYZanwS8/tpAi07QBNDP5uc7uc3TUUAXKuQ2onG6cRDLU/sFNPPz1fyFAPkGT9GjBlGiJvFyewqvIV5NEM0wPiZfLk6sghKlLR0v78SlWTUjcXEu5UZG2hKwODskFK9TWbA4sYQB1BV+sqONrmR/ojBjU+TmREJHKDGvFA7e16eD+dKDsABEOt1rDt1hUFBNzviOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AMjGSYoSDr1II+HY6tjfoYblKWLPY8jO4mHfz7mwE80=;
 b=YkHzIeCwJZbc9b5VQkp3Y8QtDFGfMethtOqQOuo0uE03/S/9jK8cIa+ravd5rEwshaWxkEd/LO7BdGHKMw08WnbhJUuOPKQGVN7HqXlIEqRA6mvnK73iokR2kr7DC0CCq/EPJmeqZ4uIncJ6dkxlwYELsnh36TxEipK6jJdrkCjl8bGJVL/q38+FRf+4Qnb0wCoFJqQ9GvS8l12EAeAzugLMjYvQT4ZYDldXLBEKcow1QeMKpZKhDxneX5rjWpNTFHJZhjVwMBiiuu7hRKVlq3IOYPUf3Gmf+thwezJ1gLszzPjkwJ4zhd1g8FtY5SkS13omVx1owjuV93NOy2dN9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AMjGSYoSDr1II+HY6tjfoYblKWLPY8jO4mHfz7mwE80=;
 b=tNshsmzT2EUoBjf8oiQ2z37v8/HYrm4FDubhugfOZJkSlD1mUcgUt1DzeDnXOUgfqy3edMefndZWZzDdqXiOWWR4/sRHxsjPbxf/f2kJXszDcVXaJLBpLpTXgpmPde1wcO6Dgn8trZTJD6LKLw9ZbZZbZLkWTr5SB8+IeUXRJ6g=
From: =?utf-8?B?TGluIExpdSDvvIjliJjmnpfvvIk=?= <lin.liu@citrix.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <jgrall@amazon.com>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject:
 =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggdjUgMy82XSBhcm02NC9maW5kX25leHRfYml0OiBS?=
 =?utf-8?Q?emove_ext2=5Fswab()?=
Thread-Topic: [PATCH v5 3/6] arm64/find_next_bit: Remove ext2_swab()
Thread-Index: AQHYbrSR+VEcpV6Pq0W55D1/KvsQ560sjFQAgACyefA=
Date: Tue, 24 May 2022 01:35:51 +0000
Message-ID:
 <SJ0PR03MB5405AAAC3BF864797314664D9DD79@SJ0PR03MB5405.namprd03.prod.outlook.com>
References: <cover.1653314499.git.lin.liu@citrix.com>
 <fd7137e91aa6132e2b6a19c53ecce2cac0295b55.1653314499.git.lin.liu@citrix.com>
 <1075e4a2-eb7c-6441-28c4-7dbc871f844d@xen.org>
In-Reply-To: <1075e4a2-eb7c-6441-28c4-7dbc871f844d@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2f0b6972-a3fe-4171-bad1-08da3d25bcee
x-ms-traffictypediagnostic: MN2PR03MB5168:EE_
x-microsoft-antispam-prvs:
 <MN2PR03MB51685FEEED1BE9594A96E84E9DD79@MN2PR03MB5168.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 g7K0VT7h6I5SlBO7ay2y9vQXo/pdfKihGcVJjQ9sKKIy6dm6LiO9l81Ct518vUhS2wPVvJ14XBJFKaZCjFGuaq2ZyGbozlTmW0NgebCB4U/pjxXCQLDzroop9tYAi4hjuS+qJjynGY9WzHTHNZgcFEMWkjx2YpOgYKrrCqNH6XqexUQ+BKmkXBiipEvUXbLRe9C8E7vgn0P6a3wygNDfH1bnGmR5IoQYOon9BtRviCPjcsLJhgbmnYlPLbLn/8M9DCMwEnyylSk7CIPulV3tWPK3fwfDAyZFLVuc2nijudCeNSos/eYSH70mSzyC1+mL50xo8rmt7m71qOAYbnRC3aETSChs9tdB+Oz1OnNfreh2sCbH9fRyKd9XMcK5qYEkOL1M0wpNOvX8p0TA+hytzGAwk/BR07FRTOusYKQYCRQGYMaYo6pegOkFPrAaiD7B8dfiLlXzAJCALfTaLdBaSY1KPbO0f/ILRqzyK9gykuCoUeI7JBNcbJkFnzUBsb59RmV0ja8lKlLgihlVLVcxDLYwcB+rF9EbO3GCHtMxv/2EdXryDv5SX8haXFeBE3xc2f5TTtvyGGH/gae+wA6ZXRFMg4rtaBBT9G1XZ90WY5cKIrRkYiZ+vaX2tizLWezNK1O9VZLaMjeCBbuEVliAskiSZn7+wsaRFdXHGuBCNH3vxXAxYRJZgTXCWLQdsYxrZwVPGptKvzubeIMdGeVpvA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5405.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(71200400001)(2906002)(9686003)(26005)(224303003)(110136005)(82960400001)(316002)(85182001)(54906003)(38070700005)(52536014)(186003)(38100700002)(8936002)(4326008)(122000001)(33656002)(55016003)(5660300002)(7696005)(508600001)(4744005)(6506007)(86362001)(83380400001)(64756008)(76116006)(66446008)(66946007)(66476007)(66556008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SlUzckRaRDRwRnRSQ3FjR0l6dzBsRk1Ka09vdEtlL2hxblQ2TlU1TGp0MDVO?=
 =?utf-8?B?QXhDTExwTVZuTGVFRFh2VGxzanNVdEZyYXpsN0tGWjA2dXYvUGt6eE1EYnMy?=
 =?utf-8?B?UDBKNkJTMHR4SW1iT2JQeWFvbU41UGQ1dHpHdTlHaDYySG9oM0NmQTlzQi9H?=
 =?utf-8?B?RXJodzlFdlcvdm5WdU90TFcvbTJvRGVyUEx2SmsrUVJ6dUxLcFR2cTI5Vk9v?=
 =?utf-8?B?YUhVZXd2dCthZG9UeGZhY254TTBxWXpqdzh4TDViYzNSZDVuZk9CYUF0aFpE?=
 =?utf-8?B?a3RMK1BWZHRPdUFaUXZBZDk3UnFFSmRaZXZUQXI3Yk5GODJDbGdlaVhlS3BX?=
 =?utf-8?B?VGZyNjhsK0swZExnSmxxZnBUZXp3QjltUlgzUzhmMUUveENGQk0xTWVwRmsr?=
 =?utf-8?B?RzRjdGlZVnhOM1prakVNZitOMzhHR0R3TWlmTWQwVGw1bW1oM3hNdVZ1NjM4?=
 =?utf-8?B?WWhjUU50dGNhc1cwUEpXcG00MlNnYlNOQUlsa0JXbTlLWkcxTTlEMHEwN21v?=
 =?utf-8?B?Q3RYQWNYOTdKRzdpemtEL3IrTGdPb0ZkcEVzQzBXV3B2T3RPem9XWlpaRmkr?=
 =?utf-8?B?eDY1U2t5REZtM1YyMnovQ2tqckw3SDVKcktxT3RUck5lcmQ1dlNBQkRFbXhT?=
 =?utf-8?B?akJLMk1zUU9veGF2K091Y1RYWUxjYUQydk8wUnQ3Rkg4UFJkNFBWZVd4U0xN?=
 =?utf-8?B?aDZxMzRvT1NFTGlwNWhLdnkvcEV0VmxWOU13cjl0NzhsQ0pobWNuRWt2SC93?=
 =?utf-8?B?UDFRb3EyRWQ1MmlBOXNCWDVTdS9raTlXMDF2WDBPSE1mNzRBaEhIWDZLS2VK?=
 =?utf-8?B?T3hQdERGcTVCWVRGNHBNM3hXdWhPZnZKSW1lVmN2NWpnNjNUTVNnR2ZQL1Fa?=
 =?utf-8?B?TmI5c0hlVThuazgvVDZwY0p6OHNZdzJKUWxPZEwyWlNYcU5kYi82UlIyc3Zh?=
 =?utf-8?B?OTk4azMydkNGZ1JPQ2w0d29wT2pnSGYyaDBmWjkzYjduTDJhUUJkd0ZBQUdU?=
 =?utf-8?B?NUR6TUhMenhuYmtnd01hMXVFdjVvTnZ0bEFJMlV2R2IvcXpKbmlTcGFhRU1J?=
 =?utf-8?B?Z014dFV2RTBBQmZ6MG1ENmxQdktkcVZFZnJjdkZJc0ovSU1BN1BTVU5Ibldv?=
 =?utf-8?B?QXZmSUR1UjhsTU5kWjZPZzJ1VW50SjVPUXcwQ1F4OWhITkN4NFNtVjdnT1No?=
 =?utf-8?B?OUJUYWZ3eUZESkpGa1Z0TlVqRnk5R1FDNXpzYzFYVDdPcVNDYk9aM2dzU3dk?=
 =?utf-8?B?N0xYWkhBRXBkRERpd0kvR2FoL05qc0tVcERZbjNHdWEveXhNVWJFUTZGdDAx?=
 =?utf-8?B?YWtKSXlUWktFUXJHeWh3bkVjVG0ycU5oWmx5N2poSml2ZmhVQjhLaXRiOGNI?=
 =?utf-8?B?L0pMaXh4ckk1ODhRY2VzZXVYd09DblB1VnFTemU5b1pkSGNLb3JFUmp0NTNa?=
 =?utf-8?B?bGVJQWJVcFhpcUUrYmpWMG1CVzB0eC9iV1Rib2tOVGl2aHZzK0VvcFROTFUz?=
 =?utf-8?B?M2w2bGtmcEF2bE44WlhsWFduTHZBOXRhVUJjQkhPdHBvWUIzWjZFMFJHbjF2?=
 =?utf-8?B?b0NTbVdIT3pDVFh0Umw0K1ByMUdidVNmMStSQnlPdW16MTZpMmpPRDYxZHVE?=
 =?utf-8?B?RDhQZmFpUWNBOGNIRXBWUjZyL0V4djc1R0lXVGk5Vkt4cGh0cDlyTXVSUTdm?=
 =?utf-8?B?azRTQjZnUTF0VkI0RVU2NEgyQ2FWdENtUnowZmlremFlRmR0ZEYvS2M0L0VF?=
 =?utf-8?B?K05PZ2VXa0w1UlQzcnRhVEExZVh3d1ZDVHFBOG5jUi9GUWxWWmFkK0h3dkJI?=
 =?utf-8?B?ZzF6NExtY0RGUnJLdktSYlQydGllbjllWkVWNEdXN2NUQk1tWEc0cytnZlR0?=
 =?utf-8?B?OEQwcWNtcjY1MDEwM0x1dDRrLzJwSklSOUtHeWIrcFJqVjBYQWFoZFpMZVJr?=
 =?utf-8?B?RjJZYUVrdjRiK0RoT25jUkJ1NDUxZXZNSENEVXdOeFdrK2tZUlNFZmxBdExC?=
 =?utf-8?B?V1pmZUQvQnl2VDIwZGV5aHZDSXlEUzNDNFFzL0UxOVpLdnRnZ1UwdCs1QXBH?=
 =?utf-8?B?QkM2dktVdEtnYncvYXVwMUh3VW1kWlYwVmRvUmk4cWs5SlR5MElMWGFuYXJ0?=
 =?utf-8?B?Y3hMSENNSU9yRUlCM0E1RjI5U3dnSTJlazdlL2JmZy9pYXFycm83eG1ZSkNt?=
 =?utf-8?B?QVhaVEtqTjgyend4UEhYNmUra1dQcmVvTkhCc0NTR2plS3BtZHpNU1B3SDBQ?=
 =?utf-8?B?cU9yMnBRckFMcTdMdFV2NXl4cDhHR2l3cWRvWHNod2lIaEZ3S3VJaUxoeGxF?=
 =?utf-8?B?aTI3ZlpYZStHODY0aEQ2SXBxdS9NMXlNZ3h0WFFmQXdQRGtjRkUyUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5405.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f0b6972-a3fe-4171-bad1-08da3d25bcee
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2022 01:35:51.8723
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f53xjCusWAB3eFDsMffeDJiNjJh5t30TNbQ4bV31saWQ4R4gKgrd31H5rrOdHq7B5SGYQaG12sMr+tvYfhnEWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5168

DQo+PkhpLA0KDQo+Pk9uIDIzLzA1LzIwMjIgMTU6NTAsIExpbiBMaXUgd3JvdGU6DQo+ID5leHQy
IGhhcyBub3RoaW5nIHRvIGRvIHdpdGggdGhpcyBsb2dpYy4NCg0KPllvdSBoYXZlIGFnYWluIG5v
dCBhZGRyZXNzZWQgbXkgY29tbWVudC4gSWYgeW91IGRvbid0IHVuZGVyc3RhbmQgbXkgY29tbWVu
dCB0aGVuIHBsZWFzZSBhc2suDQoNCj5DaGVlcnMsDQoNCj4tLQ0KPkp1bGllbiBHcmFsbA0KDQpT
b3JyeSBJIG1pc3NlZCB0aGlzIG9uZSBhcyBJIHNhdyB0aGlzIHBhdGNoIGFscmVhZHkgZ290IGFu
IHNvbWUgdGFncywgIEkgc3VwcG9zZSB5b3VyIGNvbW1lbnQgcmVxdWlyZXMgY29tbWl0IG1lc3Nh
Z2UgdXBkYXRlLCANCldpbGwgdXBkYXRlIGl0IGlmIGEgbmV3ZXIgdmVyc2lvbiBpcyByZXF1aXJl
ZC4gDQoNCkNoZWVycywNCkxpbg0K

