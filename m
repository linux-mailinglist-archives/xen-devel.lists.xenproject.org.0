Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C027B026C
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 13:08:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608900.947698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlSPD-0008Fy-Se; Wed, 27 Sep 2023 11:08:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608900.947698; Wed, 27 Sep 2023 11:08:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlSPD-0008Cl-Py; Wed, 27 Sep 2023 11:08:35 +0000
Received: by outflank-mailman (input) for mailman id 608900;
 Wed, 27 Sep 2023 11:08:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WUTS=FL=citrix.com=prvs=6275c33bf=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qlSPB-0008BM-Vw
 for xen-devel@lists.xenproject.org; Wed, 27 Sep 2023 11:08:34 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f69b4eb-5d26-11ee-9b0d-b553b5be7939;
 Wed, 27 Sep 2023 13:08:30 +0200 (CEST)
Received: from mail-co1nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Sep 2023 07:08:26 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB7079.namprd03.prod.outlook.com (2603:10b6:a03:4e1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Wed, 27 Sep
 2023 11:08:21 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::86fe:5402:9485:35c3]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::86fe:5402:9485:35c3%5]) with mapi id 15.20.6813.024; Wed, 27 Sep 2023
 11:08:21 +0000
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
X-Inumbo-ID: 2f69b4eb-5d26-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1695812910;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=QD8teE9Vh7HY/QgJM6Plt1u2fYuVZ/GzUXLK5nc5C6M=;
  b=N8IvZTc0Pj2T+xELIspJ5ehZD7q8zyA96spKxrZ26lTwQL/+MBhunDcn
   ZKWmb5LeHMVV15AAf+v3SD68Kp89GFpqgjfPxTDpISp0f1YaLgK4y7MGu
   rMBGfrJlsZ7zAxDVDM7FL8m5szWjz4h6sJ4cYBR3c9LHaRqJxVIkoMFKT
   E=;
X-CSE-ConnectionGUID: NAuFwzPTTGS70CJij2vaUg==
X-CSE-MsgGUID: WtCXMLw7SyuHLc73kgxNWQ==
X-IronPort-RemoteIP: 104.47.56.171
X-IronPort-MID: 124363902
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:KP7JQaqVEp3sN8ShRkJUK3uwHsReBmL9ZBIvgKrLsJaIsI4StFCzt
 garIBnVPfzbYGr8LYwgPoiz80JSvZbVzoRjSgo9rHw9En4W8puZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbOCYmYpA1Y8FE/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GhwUmAWP6gR5wePzSZNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXABYkcz6cldqK/J2AFbFHpMUhdtfiAYxK7xmMzRmBZRonabbqZvyToPR/hXI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jearaYWMEjCJbZw9ckKwv
 GXJ8n6/GhgHHNee1SCE4jSngeqncSbTAdhOT+Pjp6Yw6LGV7lMPIy0zcUTkmuikqmq1BIlcJ
 FwyxRN7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq19KqQrD60ETgYKykFfyBsZRAe/9DprYU3jxTOZtVuCqi4ipvyAz6Y6
 y+OhDgzgfMUl8Fj/7my+Fncqy6vopXPQR844kPcWWfN0+9iTIusZojt4l+C6/9Fdd+dVgPY4
 yFCnNWC5ucTC53LjDaKXOgGALCu4bCCLSHYhllsWZIm8lxB5kKeQGyZ2xkmTG8BDyrOUWWBj
 JP70e+J2KJuAQ==
IronPort-HdrOrdr: A9a23:mXwVjqqCuNgAXS8th73rWEsaV5oReYIsimQD101hICG9E/bo9P
 xG+c5x6faaslossR0b9uxoW5PhfZq/z/BICOAqVN/JMTUO01HIEGgN1/qE/xTQXwH46+5Bxe
 NBXsFFebvN5IFB/KPHCd+DYrIdKXK8gcKVuds=
X-Talos-CUID: 9a23:ucjW8mA49g9kD/T6Ew9O6WALCPgZTlLmky/7AU66U3hgdbLAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3AWuQleg6IiKjl2l39r1eyhAUnxoxX/4+eLWQSzq4?=
 =?us-ascii?q?XpumgPnMrODiNqguOF9o=3D?=
X-IronPort-AV: E=Sophos;i="6.03,179,1694750400"; 
   d="scan'208";a="124363902"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=inCnb4Gr2TNvH0rL6Uz571/l8+dStlzuUYvjregxJwOTsX2WhWCfFsOHJzr4pJBwN9P2S4trx03NNTzn2AjX7V/NukWLyOENMj1fKaLOmQCraW5IfUSVguyKWa4bsffPVGCc3Hb8tAqCuZn0My8kdfnAGH9/XdenetY4NupZoboGlavwHELpOdzE3aM3j1IaVcWazYOR7uWw4X9T0qCVo1I1lAGJnqBLgRerVlKEVk4rzPjzhM37LlO6s3Cr72/7gIg2z7uFY31bYL2+fnHLOIwjafQJmMx/qAE3Ti0/uUiyeydx1v1wL4qZMbwI5cTVOSunC1vZffww4tqUvnu7HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j+ZR/0E4qwmZNPPg8n8gf8LwEnSkB4rEcp2LSW9abDg=;
 b=TshSEMQ9cgHOHgfI32suyJovjVao3a10ep5WdeT2NW7Zmy44z9oAERpVW3Ad0D/ovGad6fG2I7YJd4vQu3I5438Knpb88R+BPSmZ+3JQgiAX1H3aP7P7cVGUzdRj7Lnq10QhP9gJx+Pj2z2OD3VzVto+9eDEYdQVrICilfchCiXePb9Jvn+lcFBVLZMKYWkPva5nhe8ubRtZKWUR5u0g9yZx0YQjirRCGkqaRHFHAoI0tINNRlO4TjNSP534y7HL8HOrzciW0eX1+roWZrtxUWCmCjU9TaUuO9XvcfRCla6APDmuadqvBn4s6DMAesMwWZYXcMWnZqOcuUQjZH4yxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j+ZR/0E4qwmZNPPg8n8gf8LwEnSkB4rEcp2LSW9abDg=;
 b=E2uN4JrSiAk2KrCROO9CqufXWAzVJQ1cWkegOu3kDeApOPy8qvvKXFJ6iEXOKxkD0Pzhbt6QuW/7xgDfwvcMK2wysMrjAGaTXf4+BRCBmnlm0L0SlOTYHt04rHXAvSnaiv3nJrX4jrMwSHhpmwVccgoECgIcOHQd+xhhyt5G3Vk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 27 Sep 2023 13:08:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH v3 4/8] x86/mem-sharing: copy GADDR based shared guest
 areas
Message-ID: <ZRQNHyggOFD1FuMD@MacBookPdeRoger>
References: <472f8314-9ad7-523a-32dc-d5c2138c2c8c@suse.com>
 <a79d2a8b-6d6e-bd31-b079-a30b555e5fd0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a79d2a8b-6d6e-bd31-b079-a30b555e5fd0@suse.com>
X-ClientProxiedBy: LO4P123CA0524.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::9) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB7079:EE_
X-MS-Office365-Filtering-Correlation-Id: ac47cc56-d0e0-471a-cfe9-08dbbf4a0f88
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hUiyfrnAlkAT/yehtVX1wQ2FONGJy6HtVIa9lj9QWIzDwYEO9GTba+yylZrqHdNXcuBiOb1rBQN+4XWR2B0bK3SPzZRXenUg8CLBBgXGbOInEFuWL2ytMy+mI2AKjYBX93iGXkbRdAeUdrvmLtmo/HXbJunOLvFE1zSfaCtr2QTTPyeojPMY88Al7i9EIkcTfoETSYwohjO0Ky1r+fsD6ZKt3LWV7O4ehQqQPVjRWAWxuEoQp8pAJXZurJ+oFMCaIToYmzPLDzMVmULAD4jCHQJ6j9lN/mqCPt/X937xH88LfdouRmjjRM53PQotdwLN5Kac/Ilf/RgLDOZ/6uvtX0dm7Yhihxa70Hn5ed277jeQCli7Bnpf54A7ACZM9GxupilsETXRE0ZAXUUFOdWSIyPWLWDCp/wpP67dTyBNvd+bYdn2vbXkIOG8UU6of5J5cyOXy9JE7QmhicMhcqGZ5I6NREXrSJmkM9wrsUGwsrdiekb2Ss96zcqbhITHu2s1xYYxh1uIOMdZLLvFbcy92aRtMZM2Ner3zJMW9Ce9Bh4127iETEVvfPoVBaYa26aJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(376002)(366004)(136003)(39860400002)(346002)(396003)(230922051799003)(451199024)(186009)(1800799009)(83380400001)(85182001)(82960400001)(26005)(86362001)(6666004)(6916009)(6506007)(6486002)(316002)(41300700001)(478600001)(6512007)(9686003)(54906003)(66946007)(66556008)(66476007)(8676002)(4326008)(38100700002)(8936002)(33716001)(2906002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WVF0Lzl6bHRJeERHdmVCOVNjam9Od0dUeUdkM2NLSkRJZzdGVGoxR3RFV2FG?=
 =?utf-8?B?SjExd1lvTzV0T0dCaEtRbnNxREhUaFVWWXpZV29hd1d2RngycnplY2JNMGFX?=
 =?utf-8?B?YkUrNjBZVzdRVlYxOTJGOEZiSTh4cTZVOUJwaTdnRnhHeHl3TU84QUJrTEZE?=
 =?utf-8?B?SDFSaVpnZk1xUFJZRmJYbG40RSsxeUlRSFY2VE13MktGY0dzL2E5UHBqOU5U?=
 =?utf-8?B?R3hYV25GS1JFQ2FYU20zMUh3WUZLaXYybGwzNHlLZUFVMTdBTUowTGgra2VY?=
 =?utf-8?B?SHZrSzU4WWlQWGE2MUw1Nk9BL3JWdmVFVUdvSmo0SURUcVpkZzRQSnd5VkpW?=
 =?utf-8?B?VVU1Rlg0RWxUNXhuYXRIbllYT0VKU0dkaGhra3hRV1YrSzNGUDdiTUFPWGYz?=
 =?utf-8?B?bjZwMXVlbkxGY2dXUmp3S09NU1dnWmQxRkZ6ekhBaFFNMGxkVUlDeVJ6b0hi?=
 =?utf-8?B?cTBIT3YrNlJKcFJyeWF5VTJTbFM0YlNuRlNWV1gzZnhEZWFYWlpPdjRmNXZm?=
 =?utf-8?B?Z3BSNnd0TWhqTnYvMTBEbnpyS3BocVhDbFFuTlpQRE1VVVN3VFZPWkZPRkdq?=
 =?utf-8?B?cVIwdVB5NUpzNDdYQU0rMWVMZ3daQlFuSGo3SVZ6YjI4RFFmcFZ0eC9Bb1N5?=
 =?utf-8?B?MFg4RFBDbUNQQlhCN0VOSmNRVkpzRkJOYmhMVkUyKzNrQURHSGRzTUV3SU9B?=
 =?utf-8?B?WWRYQ09JZDVGdWJaRldsUWlqWVNPRlJzRnAxemFsZkZobGVBSDI5c1pHT0sy?=
 =?utf-8?B?SFNlZTZSakhJNXZ4RXVuZHZ1RGNMbXhPZFlPTjdDekg5NUI1OGQzOGIwR1E5?=
 =?utf-8?B?dTczM3hKWDIzUTY3N2xoc21uOHlJd2dXVGFJYlFYT3JBZkk5M3ZuYVQ1Q05N?=
 =?utf-8?B?T3hCQXBFT2lzU0svV3JhSFcyTkZtK2xSMkpBSU91Yy9SdW1XY0V3bFROK0tz?=
 =?utf-8?B?b256SHZRbjdKTG8xTWh2VExpeVdwYXNNTGlGTTJjREZWc01NQlNEZ1RxTDhJ?=
 =?utf-8?B?K01pNUsySm9FUU00MWYvNHlzdkx6azZQQTNaUHhxdXNCWGRoTk9mWW5JaG5l?=
 =?utf-8?B?MmRMWW50aFNWenl2WGMzVHkramNiZ2RtdnkwYWo4T0xTMlVkUXJTenBuUTJ0?=
 =?utf-8?B?L0hLbHptMWpOZTFlOHZ3bGxRY1A5TXZwWXBHQk5ldVpqWjR2RXFxRTJldmRa?=
 =?utf-8?B?Nk16bnR2d3d5Q1hVSHB1Snh5dCtpWjVmMzJXOWNBaGhTQWpNRXZOQm1LeHNE?=
 =?utf-8?B?SVJGeXZ4a2FtOXg3MUNUZmxxYUZBeFMzWnNiNCtSc09FTmxsNVU0NWMyb2M2?=
 =?utf-8?B?anhPU1JTSjlwYktLa1JTK1gzMTFmQ01DTzlhSjk3cHh0Yi9IaVVxOUFDV3J3?=
 =?utf-8?B?eHRFZXV6UUdBT2U0c3NxcFRJeHBUQ01vRE1sWUwvUUFhU1NXRVlLaVo0dE1B?=
 =?utf-8?B?bk45NVE3d01UV2FDcUFHWTBLNDNuckxHMU93bDYwMU9CSk5lZzlCNGJCVVIy?=
 =?utf-8?B?YmhnV0Uva2JwSmZTaWJ3Skt4QWI4S1hrdXRMTXRxZWhoeXUrbDBOaGFrcmN3?=
 =?utf-8?B?UXZsNWxuSGNOSmliYlVxeTZoZEZSdUtkTDFqUFZ5UnF4TnhYWloxSTBtSnN5?=
 =?utf-8?B?bUtHVmI0RThaNGJUQ0JQWWxnak1RUFBoOXJRSVpMMS9hT3lFRVpPOWlJbExr?=
 =?utf-8?B?WjQwZ0s2aEVGSmprZk9lQXBjaytoTlRBNmQ4dzRHMXRYOU01VkFmbXIwbWYw?=
 =?utf-8?B?a1MzTlhTTUtNN0NLZng0eUllazZJYnJaSzdhRHRTTzRkTEc1THJJZGV1TUFq?=
 =?utf-8?B?SlVOcldVS29CSWsvWUcxMFpqTDZtMEFSVGxrUGRwKy9Ed2VmandXSXQwNXU5?=
 =?utf-8?B?NGpaM1JYb3RLVEwwM1VvRHFtNDZ5NGVxUWZiQUVXK25SVnpnVDdBRWNvTTdw?=
 =?utf-8?B?V3A2UWt4VGdKdVNFdTVWbFFodWN1OW91VEpkNW9BbHZyUCt1ZGFadmE2RWxT?=
 =?utf-8?B?STZZSU9lRHlVamlObHVvOEpidm5TQkg0bUY1Uzl0aGxuYmZ3REZGdjhPRWZj?=
 =?utf-8?B?b1Z2S0czdjhpN0lCZEp6eEYzbkJBZWNVVGo2MFBncVIvTU9jUUw4QnVqVGYz?=
 =?utf-8?B?TGViTmNKbG0vUFZGRkNMeWhzSjFPaEIvYjhuNDJDVmN1UllsWFhOY0ZIOFEx?=
 =?utf-8?B?elE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xF+zT2MDvLH7PG+wRZoIld+Mh56C8TB+xV6tlDSBEkjlJPSY8zDEUagBQjjttWVQ6yaW5CzQfkvOOpfrV5Q05CLf8v9OY7Kig0CJ15fTLH5/a1LpbnDzqLOHKHtfRfvGD8mpEn/gB0ye4BuvEMFrEZE2p1JY0yHYrhZLC5PW2v6ge4ZwIfwFgVFjrxPDAA49Xep2KmjTs2uvqie1YXwBZJTW7abnYn7auy1J1BDhzYBBZqfBFC0KZhpcorS7qA+KOTwF4w0CMGXnj+iCYjEA7kpFvPASvSOiuSAvpj+FmSoaAKyipWQPCNvCyuz26yvxAvbXMHPIpmaXmWO14645DaKgCvNMbHF2PFHMZ1JEQcuyy9+mGQV9Okui5nVCm8IoVlLlBXcE4LSmfYvidVGoXSpLVc906F4nzl2QjckwfyWmNzz7yGHidt3j/9Sb8UjtfZJMx6+itgi5O4XZ7Ih8XGjLYnkrnQMEHixzrs9YZ5jn9tnhkxTY3DfxYjbM1Hr7tkRn2Mc5HCxzACWR/milnc+MYVbeRlQD6elQWgW7TbArcMxSGhbyfp0DPoWRVTFOWkxUCaQCIv4ntzL+tKTE6a3rpvR02ITih7cdWd0I0DeoBgGvVoZ4HhQslj+Qej+fazVGI5dMQJid04xgK0dBFEOw6/PgrYJwy3JV05HodkU2UG3mQ77RSoL6pev2yEx4oyDwb9MDY8XIY+PVwodP6iuXWadVXsj1GTBbW1ubOgAu/XDOl/By8xoXhCx4E2nZZ/ertYWBMjX+wvmRHeXJm7D2pTdFYbTCq/dJTy/GUbjHEIXPiezoc7n85p7ZUwTbiIUyZ6BevvqnecxEhHhBLFaQcuw063myu8TM3atV+o2qAmx+CwaVtWGTGtdKQ7LPCvvcyDYA7oksZDkD0YSV/g==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac47cc56-d0e0-471a-cfe9-08dbbf4a0f88
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 11:08:21.4653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lO78nLJKEP++2+ulYbBYnqtJT9GkZuSy9FF9nBm0qSbz5y7dvWVpTS/dVBcK8YPvQYXn7pFF3MPs7Zrvd+4UFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB7079

On Wed, May 03, 2023 at 05:56:46PM +0200, Jan Beulich wrote:
> In preparation of the introduction of new vCPU operations allowing to
> register the respective areas (one of the two is x86-specific) by
> guest-physical address, add the necessary fork handling (with the
> backing function yet to be filled in).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Given the very limited and specific usage of the current Xen forking
code, do we really need to bother about copying such areas?

IOW: I doubt that not updating the runstate/time areas will make any
difference to the forking code ATM.

> ---
> v3: Extend comment.
> 
> --- a/xen/arch/x86/mm/mem_sharing.c
> +++ b/xen/arch/x86/mm/mem_sharing.c
> @@ -1641,6 +1641,68 @@ static void copy_vcpu_nonreg_state(struc
>      hvm_set_nonreg_state(cd_vcpu, &nrs);
>  }
>  
> +static int copy_guest_area(struct guest_area *cd_area,
> +                           const struct guest_area *d_area,
> +                           struct vcpu *cd_vcpu,
> +                           const struct domain *d)
> +{
> +    mfn_t d_mfn, cd_mfn;
> +
> +    if ( !d_area->pg )
> +        return 0;
> +
> +    d_mfn = page_to_mfn(d_area->pg);
> +
> +    /* Allocate & map a page for the area if it hasn't been already. */
> +    if ( !cd_area->pg )
> +    {
> +        gfn_t gfn = mfn_to_gfn(d, d_mfn);
> +        struct p2m_domain *p2m = p2m_get_hostp2m(cd_vcpu->domain);
> +        p2m_type_t p2mt;
> +        p2m_access_t p2ma;
> +        unsigned int offset;
> +        int ret;
> +
> +        cd_mfn = p2m->get_entry(p2m, gfn, &p2mt, &p2ma, 0, NULL, NULL);
> +        if ( mfn_eq(cd_mfn, INVALID_MFN) )
> +        {
> +            struct page_info *pg = alloc_domheap_page(cd_vcpu->domain, 0);
> +
> +            if ( !pg )
> +                return -ENOMEM;
> +
> +            cd_mfn = page_to_mfn(pg);
> +            set_gpfn_from_mfn(mfn_x(cd_mfn), gfn_x(gfn));
> +
> +            ret = p2m->set_entry(p2m, gfn, cd_mfn, PAGE_ORDER_4K, p2m_ram_rw,
> +                                 p2m->default_access, -1);
> +            if ( ret )
> +                return ret;
> +        }
> +        else if ( p2mt != p2m_ram_rw )
> +            return -EBUSY;

Shouldn't the populate of the underlying gfn in the fork case
be done by map_guest_area itself?

What if a forked guest attempts to register a new runstate/time info
against an address not yet populated?

> +        /*
> +         * Map the into the guest. For simplicity specify the entire range up
> +         * to the end of the page: All the function uses it for is to check
> +         * that the range doesn't cross page boundaries. Having the area mapped
> +         * in the original domain implies that it fits there and therefore will
> +         * also fit in the clone.
> +         */
> +        offset = PAGE_OFFSET(d_area->map);
> +        ret = map_guest_area(cd_vcpu, gfn_to_gaddr(gfn) + offset,
> +                             PAGE_SIZE - offset, cd_area, NULL);
> +        if ( ret )
> +            return ret;
> +    }
> +    else
> +        cd_mfn = page_to_mfn(cd_area->pg);
> +
> +    copy_domain_page(cd_mfn, d_mfn);
> +
> +    return 0;
> +}
> +
>  static int copy_vpmu(struct vcpu *d_vcpu, struct vcpu *cd_vcpu)
>  {
>      struct vpmu_struct *d_vpmu = vcpu_vpmu(d_vcpu);
> @@ -1733,6 +1795,16 @@ static int copy_vcpu_settings(struct dom
>              copy_domain_page(new_vcpu_info_mfn, vcpu_info_mfn);
>          }
>  
> +        /* Same for the (physically registered) runstate and time info areas. */
> +        ret = copy_guest_area(&cd_vcpu->runstate_guest_area,
> +                              &d_vcpu->runstate_guest_area, cd_vcpu, d);
> +        if ( ret )
> +            return ret;
> +        ret = copy_guest_area(&cd_vcpu->arch.time_guest_area,
> +                              &d_vcpu->arch.time_guest_area, cd_vcpu, d);
> +        if ( ret )
> +            return ret;
> +
>          ret = copy_vpmu(d_vcpu, cd_vcpu);
>          if ( ret )
>              return ret;
> @@ -1974,7 +2046,10 @@ int mem_sharing_fork_reset(struct domain
>  
>   state:
>      if ( reset_state )
> +    {
>          rc = copy_settings(d, pd);
> +        /* TBD: What to do here with -ERESTART? */
> +    }
>  
>      domain_unpause(d);
>  
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -1572,6 +1572,13 @@ void unmap_vcpu_info(struct vcpu *v)
>      put_page_and_type(mfn_to_page(mfn));
>  }
>  
> +int map_guest_area(struct vcpu *v, paddr_t gaddr, unsigned int size,
> +                   struct guest_area *area,
> +                   void (*populate)(void *dst, struct vcpu *v))

Oh, the prototype for this is added in patch 1, almost missed it.

Why not also add this dummy implementation in patch 1 then?

Thanks, Roger.

