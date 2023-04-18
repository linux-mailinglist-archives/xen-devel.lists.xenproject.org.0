Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B576E6862
	for <lists+xen-devel@lfdr.de>; Tue, 18 Apr 2023 17:37:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522974.812667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ponNd-0005nF-Q4; Tue, 18 Apr 2023 15:36:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522974.812667; Tue, 18 Apr 2023 15:36:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ponNd-0005jr-MV; Tue, 18 Apr 2023 15:36:29 +0000
Received: by outflank-mailman (input) for mailman id 522974;
 Tue, 18 Apr 2023 15:36:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bqrX=AJ=citrix.com=prvs=465e465d1=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1ponNc-0005jl-9r
 for xen-devel@lists.xenproject.org; Tue, 18 Apr 2023 15:36:28 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6a639db-ddfe-11ed-8611-37d641c3527e;
 Tue, 18 Apr 2023 17:36:25 +0200 (CEST)
Received: from mail-mw2nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.109])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Apr 2023 11:36:23 -0400
Received: from DM6PR03MB5372.namprd03.prod.outlook.com (2603:10b6:5:24f::15)
 by DS7PR03MB5544.namprd03.prod.outlook.com (2603:10b6:5:2d3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 15:36:21 +0000
Received: from DM6PR03MB5372.namprd03.prod.outlook.com
 ([fe80::f4f8:2c53:17cd:f3cb]) by DM6PR03MB5372.namprd03.prod.outlook.com
 ([fe80::f4f8:2c53:17cd:f3cb%4]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 15:36:21 +0000
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
X-Inumbo-ID: c6a639db-ddfe-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681832185;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ycA6Nr7hkSnlbY67HxQ6qmBFbGODReNlBXl6mfGY1QE=;
  b=iik+VTHdqJvPnS9SlrmqlEzupBeekrJegOn/HoCXeTT92J+o4LIZi9LE
   WNL6Gb5HCBejGrroEGb/MWVoXuzldWqk51Y00Jn6a6XkyZgeSa4DsxR5J
   j3ylKtcQunE2GiaIXfK9lYUS92U1SrTuRhot8t1dQ4NId/z5uV2rQDvfX
   Y=;
X-IronPort-RemoteIP: 104.47.55.109
X-IronPort-MID: 108416973
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:3FJjzqvPFfA8zleixr/UC1fofefnVGdfMUV32f8akzHdYApBsoF/q
 tZmKTzUPPfcYDGgfN10bN6z8x8BvJXVy941TAo5qS1nQS9D+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Vv0gnRkPaoQ5AOHxyFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwETcJYBC5qMGM26uXTcUygscGIM/FFdZK0p1g5Wmx4fcOZ7nmGv2PwOACmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osjf60aIu9lt+iHK25mm6Co
 XnduWDwDRwAK9WbzRKO8262h/+JliT+MG4XPOTgpqIz3gzMnQT/DjVVcWGar/2+g3T9WulmD
 nw6+CYf9ag9oRnDot7VGkfQTGS/lhwWVsdUEuY6wBqQ0aeS6AGcbkAHSThbYdBgq84yRhQtz
 FaCm96vDjtq2JWFRHTY+rqKoDeaPSkOMXREdSICVREC4dTovMc0lB2nczp4OKu8j9mwHC6qx
 TmP9XA6n+9K1Z9N0Lin91fahT7qvoLOUgM++gTQWCSi8x99Y4mmIYev7DA38Mp9EWpQdXHZ1
 FBspiRUxLlm4U2l/MBVfNgwIQ==
IronPort-HdrOrdr: A9a23:NvhnAaphgSosUffZMXRApz0aV5oFeYIsimQD101hICG9E/b2qy
 nKpp8mPHDP+VEssR0b+OxoQZPwJE80lqQa3WBuB8bHYOC8ghrKEGgK1+KLqVCNJ8SZzJ866U
 4KSchD4bPLfCNHZO/BkWuFOudl7N6b8L25wcfypk0dNz2CspsQljuR3DzranFLeA==
X-Talos-CUID: 9a23:fBrBsWxvirpQYgHPJguKBgUtHcQrckfy703LOmO/JThtS5iZT3G5rfY=
X-Talos-MUID: =?us-ascii?q?9a23=3A5MVcbg98yCEAklHpnXLCasOQf4RM2YWgDEcEq9Y?=
 =?us-ascii?q?HgPChBQJyNwbFjDviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.99,207,1677560400"; 
   d="scan'208";a="108416973"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gDy0nJ0hcTcBrzvr8nqABC5Af7HYjbxpguIol8KdFZmYAG3ntroxbGZgiba2eexyyEmCEnaEmwQa6yl8kb3kna95Pu/5FuJ3vuu3wRy7wnOGcAglgIrpv/HNCOMuAjjF81SS0C9CAEgYwjHHYI4h63UXx7c1JvE0n3K+Sw8R/YUu0BGZKcANEtSZ4i88ZVFtdPZiFdOqWF4kH4LOlo/6iLqoEIvJzGBaKlJ+4HIZUTTHjHkR3+/zi5n/17EbfzycKGvIe/hDlYVkl6b23bVHHdpCumEHQTWqWDfqwmwrNsuhxP4OFclW7XwoObf7YhNKQ1PCpOShg692fzJL7480iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ycA6Nr7hkSnlbY67HxQ6qmBFbGODReNlBXl6mfGY1QE=;
 b=J1Mc07dzeoM0o3FA+KXZAMxy5csM7u2flElNTK2nCcaBZijFzRbIyTF0raX3QxYc25mmL7rOCdvM7uSrLl0UVS4Yu/qoh1rzX9FfXSK8vGlDHqAS7IWnM0LYPszFSrQjYvo/6cmzuWLy1fVJZ/Etb2fjXx2RCqp81uSuGxD0yRtbzWN9hdSPiJJi3untmMauRrsq7+WMl45zB/JYdGqxsuZBm2dm+awOrm8km6OfraLU/sWs7+SVIyypDRqbSeYF1iUeYrHQMrT/KCtsGlmv4hizs6SJRZ4LttvGvdo+aIFEleQj6S+vpVEsYXT5CxZ1WVOvlOJr3d0CLqGqwfV1Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ycA6Nr7hkSnlbY67HxQ6qmBFbGODReNlBXl6mfGY1QE=;
 b=VM19t8F56YqcMeTMCqz9bR6G7P25NFNnGLwLWuh7OSD8F424MVa2iqo0nOlPAyubTVoFi/5hIE8DWLXHvQw3xTYBGlRrg5J7o+KxwdmXqMrGQAIP71mc0bpFA1aLwy4nh9c8kaEWU4tWs0iww/q0Fgms3Ko36roRJNMDsPaR1oI=
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen/livepatch: Fix secure_payload() in non-debug builds
Thread-Topic: [PATCH] xen/livepatch: Fix secure_payload() in non-debug builds
Thread-Index: AQHZcRMmMLpASuHOmkGih8/02E4a3a8vUDkAgAHj1ME=
Date: Tue, 18 Apr 2023 15:36:21 +0000
Message-ID:
 <DM6PR03MB5372AD212F31482D7B451ABFF09D9@DM6PR03MB5372.namprd03.prod.outlook.com>
References: <20230417095815.3734434-1-andrew.cooper3@citrix.com>
 <2b8c7abe-9bc5-cd8f-b650-1de0205c4ee9@suse.com>
In-Reply-To: <2b8c7abe-9bc5-cd8f-b650-1de0205c4ee9@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR03MB5372:EE_|DS7PR03MB5544:EE_
x-ms-office365-filtering-correlation-id: 8d1f73b3-dcf2-4920-c220-08db4022a92f
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 dZGRbnulJkAyR8s+vAiWUa/3+KPjioLA5XRFV5B0hTNkR81H1KE54Gq9yo9dIaRPkde2ijX7aT7YAjim9cskFr9ndMSnHKuh4WA+mZ5BVEE8JI6WUFCNBOK61/1o/5pJIx/ccMv75QoRf4NN+zkMnb3nB7o7JPECyIMTm8yjArtVGfPCdNlMQIjATYw0i9Oy0wFDw8NaCYsVf6q2dq8ILVgCjaGzXZ+9uBEf6og5Meb4tXYfL1almIa/1DJLOpUC9fspR7Bw93cyGrTe0q0DGu1QxCh0nrmnZ7i00IWXoPt2PqFx/GfZNgGwjSlJr5LoXEIOKiKpnw53yEXTueSfOTL+mz9tWuVhI+4X7spJLM8A2Ps7swkXvWXas06oeD2OQBG8ahpTANPcU5r2yYKM7fnWEAmnM+RyfkU6aL8YiS+KjXTEDk/EfZDShri3fqiBgulcKw4d/dQfVeuGhgdGyfR2aXxn863prkxEjRm4TpVr9B32QcKxaNG5YisF8bnpNu2V/x8Ar9ijJhK4o/fpWHZIZsakr5wjhugwJ2ma60dHEEF32b+S7zuVXQDIuKyJYil3pwjT9mVrQJ2k2DIyYPCEK9eTCOg1LoCqEKHxBW6kgmh9v5+qOlFj9D5WkhZK
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5372.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(346002)(366004)(136003)(396003)(451199021)(66556008)(64756008)(66476007)(4326008)(66946007)(2906002)(4744005)(66446008)(5660300002)(52536014)(44832011)(8676002)(8936002)(55016003)(316002)(41300700001)(76116006)(91956017)(54906003)(478600001)(33656002)(110136005)(7696005)(6636002)(71200400001)(186003)(122000001)(86362001)(6506007)(82960400001)(26005)(53546011)(9686003)(38070700005)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ydN5C7IQOAi30b1brlbadB1V3e5kDv1CngE1S/jeBj5lqmv+JHepMeTSyx?=
 =?iso-8859-1?Q?CyDyhmkX/h3xTqXtt/TiORrMH45Ig8cllad3AqiA7wxsKOlBr9fjgi4oCq?=
 =?iso-8859-1?Q?gWcwA2l+Epa6b6WoWXB4vFj4wLGnDinrwGIjxvhCIaRFYGtpDMlc5twQZs?=
 =?iso-8859-1?Q?lcNcj5p35W/hv0Zg2vCp0dMjbIcrb69LvNsfbo1nptcf+KOov2zlh8mhgR?=
 =?iso-8859-1?Q?AtKDz1x3LnhxD044i1tHIOHBUMRVK1yF3s1mv5SMPKVw65eqean5n6T+wI?=
 =?iso-8859-1?Q?aIdIW3I/G7e5hBzb1ypw9upfODFcRzFE3FdrL9AKxrif3O1q7/Oo9dqrHg?=
 =?iso-8859-1?Q?XJhUTU2oj6m4G240d5xnUlyX2BjkIHh5KN7Xhh1RWwVT1iPfdOhUHWJB9P?=
 =?iso-8859-1?Q?pn8kA2f1+GTUXJqgPrk9bYe+8mudZCW0B+NuvbjR8w9KH7n+YN2XGxhppr?=
 =?iso-8859-1?Q?FLkcitcQ+Eu+ixrxlAzA0IVDrQWaczi5DcEFwGKBMA439krtAK/2NfD+z3?=
 =?iso-8859-1?Q?3D2hJ36qDUZW0w18cwMdXPokQyU6cW6+K3/ITfL4i5EPxMAWOeG3aJKGhC?=
 =?iso-8859-1?Q?ChlLzu4OeDIqtHn2k8AH8v+RFwONYGmO1jyjepiTz/MhAlxvuFM3I1j8GM?=
 =?iso-8859-1?Q?VeM/IUOgvQfqhev3YoICb+EGm27HpD47IMF+XPjTguynkeksMXL0/Hb43A?=
 =?iso-8859-1?Q?0LgRR0xW9fNDm85Z+1h8ivFXxEaiYfCqCfQW2iXWmJN4MKxooiAOo8ZOG2?=
 =?iso-8859-1?Q?HptCMLKBi1kxHhdOf/iNXRgU1cxkn01HT6XVPV217WPEZYaNnMZL6HtCID?=
 =?iso-8859-1?Q?LsyiZfU70jXCdwU4awZVUVALNGNpUYU7qaXMSUV7Ifu+b9Ykv9v7GDtsev?=
 =?iso-8859-1?Q?AfCHbn0VyhHDta9E1LHp9+8q5Ts4dlfggNveWdKk/KeZ0AuYFXDAdrfkp4?=
 =?iso-8859-1?Q?3YewgwxQgWFdfDQcS7U/1vACseQ62MCgYZRFy7j0VpYSahtUXSDaoRYJH5?=
 =?iso-8859-1?Q?x1I9FjpF4dD/nHthIwlQCAZiYqji8vE1cPsDPIpnI5DbqNZe6kh6mdwfST?=
 =?iso-8859-1?Q?MOGdEvZF69+wWhdVPyf9y0F4FOItsSilleaO9VgUF9yq4tw4mIoDembJlt?=
 =?iso-8859-1?Q?7tCwleexUwn05/wcUKkndo/kCNDLanZ1yNWhe6wrDh7BuCZP6aspZN4KEy?=
 =?iso-8859-1?Q?ineC1Kj4rB3FqHucRSeEhW0+mUJ21O8Yefeh3JaGFRGlbCncJ5Gq2L943K?=
 =?iso-8859-1?Q?zycawWUE1qNIOpqLYeF1I3jNedh3be12+1scVrD7zfbbP2SEs+S45FfVxm?=
 =?iso-8859-1?Q?GpkEkOwJeRCYPTn3O9yvJDhyLUSeGAd0EGa22eeUvBQN4tpqoGXDHQcqIm?=
 =?iso-8859-1?Q?XW4jkWjeeWKrLxnLnuTmVCPntxx7V7IQvuBBM+BpZj2KqcPr4FO6VSAG2+?=
 =?iso-8859-1?Q?XYdXSK/4CEbhAXUyesjd3mNXr55Ym7+hg7IgOilz4vKkvUZpwsWcxTTMdb?=
 =?iso-8859-1?Q?yFbpF4zTNbY1dekDLsN1/IsSQH8dkPggyLOfQ3nMSpxyHbT53QJtXGVar+?=
 =?iso-8859-1?Q?NY38VAzUcaO8/+7MsAdJCap7xkxSsIexwtVNi0sMaiUUHbjNi318gM/eQC?=
 =?iso-8859-1?Q?VgHdtoLeKnSqqvnIn9yjdnAGkBt2ytSr/t?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	W+mi46lz9vmIocoG9aJJIJ+W5Q34BjZsYajrsRBdnPxa0T0HJnRwR9tLW5WN0sScdexv6jopSKUQ3n8KbpHi5jTa1qeTQDz/v3HPMpavCZbu65/AFpsUOegfxQBcjJbq4E+B3BgmiTNnsQJOsFK//QSZmtL5ajYseOeXH2tFBHo/9l+xZN2BgdJBvzdLkTt9mkoGAKNZ0MviZaIdHKNAgtu2HL8RTHb3PYnygHPHih7uWNkoMV6E2W2j0SpfcHFl3FocMkpkYa7KoZDFRR6x5bhIu0LCr9X/gExXDkdUpCmYan1Uo4Hy247vXKGGpc+4pq4U8NeLyUUpoKhHX6rH0ybyNspShFM8LSqG5BR9hnmmAvqXvs5+LfYaeeolBxCxXN5nxDjBioylX/70scRtfVKdJl1wJUfroGnYHDPiIcuuwjQc6ZNbaUMRzbd7tS0iZtTCENfVSjd8l6R7sbyx2t7J+NxdSJQGWy/e5DdB35ILP1KlfCvusfzejh+Zh5j292wVjacqXhZ4jJg5zuC/WuMI7SSivI9BUCdsT5ZDdBpZZ6A2oo+VG+5vYJfEwgW1iuqbs82LofpgIc8ZyRfq5BhtXu4qyyBsgURT4Q3vgE6ve84+M54tOGAOJGGFXwRQztUPtQTTdgmtUczDCCid6GbOoQodSbn+TNTpZZxX8FQC1EA7xyBbzWUprwxyQ9/BTiAVIGxKg/YrIRv/tic5yCryMfEPQ/1S708Zu707J3r/LGvsJ/a+yw5IQMDSjbh7ie+noB80hrZW1hn4blY/Hoesmae8/fR85oDbUU69q03z7h8yUxgEp5wlisEfteqK2nZdtNKE+TPug6IkTEQAeg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5372.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d1f73b3-dcf2-4920-c220-08db4022a92f
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2023 15:36:21.4468
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DfLR0HyCvTtDHoSPmryi2LjOdwOB1/jqonq61wQypMnYty5Frcm44li+hbkYz9hKqfWeKGGEwPOZ3zK3mUIHmadXnrDbFP8s9ioat4QPD48=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5544

> From: Jan Beulich <jbeulich@suse.com>=0A=
> Sent: Monday, April 17, 2023 11:41 AM=0A=
> To: Andrew Cooper <Andrew.Cooper3@citrix.com>=0A=
> Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>; Ross Lagerwall <ross.=
lagerwall@citrix.com>; Xen-devel <xen-devel@lists.xenproject.org>=0A=
> Subject: Re: [PATCH] xen/livepatch: Fix secure_payload() in non-debug bui=
lds =0A=
> =A0=0A=
> On 17.04.2023 11:58, Andrew Cooper wrote:=0A=
> > The ro_pages + rw_pages + text_pages !=3D payload->pages check is not s=
omething=0A=
> > which is reasonable to skip at runtime.=A0 Rewrite it to not be an ASSE=
RT().=0A=
> =0A=
> Isn't this merely a sanity check? IOW isn't returning -EINVAL in this cas=
e=0A=
> misleading, as to calling "invalid input" what really is an internal erro=
r=0A=
> in Xen? But anyway, I guess I'll leave this to the maintainers.=0A=
> =0A=
=0A=
Yes, it looks like it is just a sanity check of the payload->pages=0A=
calculation in move_payload(). Since it is not dependent on the=0A=
payload, I think ASSERT() is correct.=0A=
=0A=
Ross=

