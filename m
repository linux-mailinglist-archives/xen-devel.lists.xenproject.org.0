Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F594A4B2E
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 17:03:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263185.455807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEZ8g-00011v-FP; Mon, 31 Jan 2022 16:02:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263185.455807; Mon, 31 Jan 2022 16:02:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEZ8g-0000zT-C8; Mon, 31 Jan 2022 16:02:46 +0000
Received: by outflank-mailman (input) for mailman id 263185;
 Mon, 31 Jan 2022 16:02:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xJ9D=SP=citrix.com=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1nEZ8e-0000zN-9Z
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 16:02:44 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 37e29d73-82af-11ec-8eb8-a37418f5ba1a;
 Mon, 31 Jan 2022 17:02:42 +0100 (CET)
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
X-Inumbo-ID: 37e29d73-82af-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643644962;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=NeJT0svVHvHkRZA58ohgAZChpht1pjNNvlyn88wgcOY=;
  b=MJATs1dcTZFnhJdAuVOicbYBPz6YYToWw7r4myiU1/E+kqj0jazf4RgK
   4vCNsT/th7445dWXxoKRoFJ4sf+c0WlhxewHi0qZT+YoR9CZ1Whf7jIf0
   wFwW4bTvdHtepcpD0bDrGlfwlZ0KU4wIt3vQvw7dkot0uPoi2d4ETsW5i
   w=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: gDpqPWBIeIHXoxE0tHtWPj+N4EHvbS7c6LTUovmR1MoZCyMAUWRPAvPHeikrh6yc3DzljRA1DO
 SZcx+jwxr9ZrPGrJb/pR9mEbh5XXEBvhX49pLi7MmJR7eByBs4Lb3TK9Oq2JMI3eQg0RTEiYQm
 FNt0wSFoLGSDG1hBLHKHJR6FzP0inSpWxOQd/MI3fAciBhKYvqKjlM2QTwyqbYpLhdPqfnDvzI
 drb/iUuX6W8vVJHAbQKBBcPzKCgPCeZVMWXyzDvOX1Xy80m25uJZIdyK/cz9GJ5OksPDuo2N2p
 XTO1vUNq44VSYjpNbEvnfkCw
X-SBRS: 5.2
X-MesageID: 63144636
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:oIsDBKxhXvos8tgTpsZ6t+d/wCrEfRIJ4+MujC+fZmUNrF6WrkVUn
 2QYXT+EPqyNN2L0ed5zOd7goRgOuZeDzoRqQVQ5qSAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAhLeNYYH1500g7wrVg2tQAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt9tI8
 ZYds46ccig0YpSLwbwZXBB5HC4raMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVoruYqKsStGYobs3VpyzzxBvc6W5HTBa7N4Le02R9u3ZkSQaiFO
 aL1bxJdSQbQUiV/N2xMN5Ujn/WBj3r/Vjdx/Qf9Sa0fvDGIkV0ZPKLWGNbcZNGiX8hemUec4
 GXc8AzRGQoGPdaSzT6E9HOEheLVmy7/HoUIG9WQ5vNsxVGe2GEXIBkXTkeg5+m0jFakXNBSI
 FBS/TAhxYAM80isQsj4TgePineOtR4BWPJdC+Q/rgqKz8L8/AKxFmUCCDlbZ7QOtsU7WDgr3
 V+hhM7yCHpkt7j9YXCA8raZqxuiNC5TKnUNDQcGQhEC+MLLu5wog1TESdMLLUKupoSrQ3eqm
 WnM9XVgweVI5SIW60ml1Vv+unH8oIrldSEoujyQBzqh4QpYa4HwMuRE9mPnxfpHKY+YSHyIs
 34Fh9WS4YgyMH2dqMCeaL5TRe/0vp5pJBWZ2AcyRMd5q1xB7lb+Jdg43d1oGKt+3i/okxfNa
 VSbhw5e7YQ70JCCPf4uONLZ5yjHIMHd+TXZuhL8M4AmjntZLlbvEMRSiai4hTqFfK8EyvlXB
 HtjWZzwZUv28Iw+pNZMe88T0KUw2gc1zn7JSJbwwnyPiOTCPyPFFu9VbgrSP4jVCZ9oRi2Pq
 b6z0OPRk31ivBDWOHGLoeb/03hXRZTEOXwGg5MOLbPSSuaXMGogF+XQ0dscl39NxMxoehPz1
 ijlACdwkQOn7VWecFniQi09NNvHAMguxVpmbX1EFQv5gBALPNfwhJrzgrNqJ9HLAsQ5k64tJ
 xTEEu3daslypsPvompFNcel8N09JXxGR2umZkKYXdT2RLY5LyTh8d74ZAr/si4ICyu8r8wlp
 LO8kAjcRPI+q85KV646sdqjkAG8u2YzguV3UxeaK9VfYhy0ooNrNzbwnrk8JMRVcUfPwT6T1
 gC3BxYEpLaS/99poYeR3a3U/Z20F+ZeH1ZBGzWJ57iBKiSHrHGoxpVNUbjUcGmFBn/04qire
 c5c0+r4bK8chF9PvoclS+RrwKsy6sHBvbhfygg4TnzHY07yUuFrI2Wc3NkJvapIn+cLtQyzU
 0OJ299bJbTWZ5+1TA9PfFIoN73R2+sVlz/e6eUODH/7vCInrqCaVUhyPgWXjHAPJrVCL454k
 /wqv9Qb6lLjh0NyYMqGlC1d60+FMmcED/c8rpgfDYLm1lgrx1VFbcCOAyP6+sjSOdBFM01sK
 T6InqvSwb9bwxOaIXY0EHHM28tbhIgP508WnANTeQzRl4qXnOIz0T1Q7S8zH1ZcwRhw2u5uP
 nRmah9uLqKU8jY03MVOUghAwe2a6MF1LqAp92Y0qQ==
IronPort-HdrOrdr: A9a23:2nNNhqB4Ksomz5rlHemo55DYdb4zR+YMi2TDsHoBLiC9E/bo8/
 xG+c5x6faaslossR0b9uxoW5PhfZq/z/BICOAqVN/JMTUO01HIEKhSqafk3j38C2nf24dmpM
 JdmnFFeb7N5I5B/KTH3DU=
X-IronPort-AV: E=Sophos;i="5.88,331,1635220800"; 
   d="scan'208";a="63144636"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iBCNN5iBrlKa1Rva6pF7Zf2qfM1Z6N7ZuMOnMbBfyORTV+Mn/acH7XcTHWOV9wrcnXCNm2NOMuwcCqmQt2AZXX4uZhx0kd6YLeqk4BzLPSn73KYVT0XB8+5+6/SEuHpCEqqzvcmT8J2kWxVAKBsSAvebAKBYnXIJ3f09WGjIa+tUHMbaFRt8yogrv1ha1WKLtXRwci9R8KXq+21nWRLz5e3SAlB2v+gzNlINGzqg60j6+hGtVpA1dIdGdRbs5gceQx9r3RzU8QFrcYX2YJ4syms8w4MiNC/9aCDrqdYpB1cKdh68B24mH9clOBBUJ3cxWW43BGLsL/WcnGZ55NWHww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NeJT0svVHvHkRZA58ohgAZChpht1pjNNvlyn88wgcOY=;
 b=lOMXr/aBqEUcVu6ipEHmpnda+2TUWThCUJi1oNG2RNaH82lmWHJ5QvSvNGMxik3/uZag4tJL2/2hPg97c1VNF80G0h+GywGwni7eKvqVMioxsR8OcjT4t1h4HUCCvmY/TFtS/AA74qLRw8sy5np5gV/ib610Rnp7K7KxkV7xPPJyVnRF9d12StVpqY3Vy2Y824w6N5WAcD9SWopvGV7w011PjxG35P6orGZMR3bLO6wrVnvdE6VJoXZBElHlOIgZehcAomPJpvcVIQOidiqB8gEMX+fNhg2YKq7bWlopj+IgKEoEfY+L+3+LojH2PCwVeXdBZOUp6BN+6ZuiCK9Qaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NeJT0svVHvHkRZA58ohgAZChpht1pjNNvlyn88wgcOY=;
 b=MK1Evn5q/TxpvMCNG45C481yzNFc62sCLR9JZBGbz+8GVTkEEK/zJW4UAkH/cNFWz3Hvoi8PWl4zLRschcJELZqERgJSR3ApYBwPgyCn6SRbH4y674Boo1yLKrNWbqtC4dxeX0dnX524ny6wNqcPIIlpxn4cwH3Rd/yn8hnmrPo=
From: Jane Malalane <Jane.Malalane@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>, "Juergen
 Gross" <jgross@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "George
 Dunlap" <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/2] x86/xen: Allow per-domain usage of hardware
 virtualized APIC
Thread-Topic: [PATCH 2/2] x86/xen: Allow per-domain usage of hardware
 virtualized APIC
Thread-Index: AQHYE5eVWWLwfSz8JEi35sISHqV9YKx9DnUAgABCRgA=
Date: Mon, 31 Jan 2022 16:02:37 +0000
Message-ID: <53fa0bd8-b39d-bf22-da48-7643dc67262c@citrix.com>
References: <20220127160133.11608-1-jane.malalane@citrix.com>
 <20220127160133.11608-3-jane.malalane@citrix.com>
 <8b59b7d7-2d0a-0b8a-f936-1e537dfc4f9a@suse.com>
In-Reply-To: <8b59b7d7-2d0a-0b8a-f936-1e537dfc4f9a@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e455f458-045c-459d-0c18-08d9e4d319e7
x-ms-traffictypediagnostic: BY5PR03MB5203:EE_
x-microsoft-antispam-prvs: <BY5PR03MB52033E4C8ADED987DB9EE51681259@BY5PR03MB5203.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aLpcd0Q9skUmVVPIbTyQz17ns97RPf8Yed+Rkgo0v+EHMNUn/llgEL0Zqv/VB3GU1lulh7XFYXNIHGzrTHc4jC+L3E1yyFJ24zX7A0BLw69kw5UODjQO3ifp/3GULHVpsjkCxKVNAWKxuxGks9/6UEweQyhdjZ2808jMT4uq89dJrJiBwGc69RQCa2zOzKvKj/h5u2ddPWcVkk8sU2/LINtTksHNop9dp6oUQeUInL8U5xpspD9bk5hV3TJYH1Dw8g4Bjblfa6SYGZPHjNEjELHyzKn5bGv2ZXrmCqmP2x4uIDADwtE2y56Xf03RN/x447p95oARMv7qull6zz9ILAVjjiUqLOK/qNonmR6Yij++NBzShy8vZUWsuLdXb/xyVnNitvnSPwazdH/eiY2oU3SdHYsvWuZv8XRdCmxp7O0Y7j6aAHXG+TKsgLV+34Y8l67kwnjdFPLNvEaM4J+8J3g0DwG6cHZMxrweZvRddY2TpAqqNLPX1w90mtOyZsw3eX81KCGKV9jzpN5ANr1rVSfWcl1sabPK/pfva7aiaJEj6FsMWFpJkEsv0dlwVoXl039OkRkujz5eV/YpaFz1b/JqKKbX8jiU3MiieNwEtz1IJybYdj6OQ89RPEWFVaoNV3lLOquIJerrKqq5CyNjaA0aBvuYHlaqKhn/3OrZNO7GEq/dC8EwtQzH0ARSM8DpOLrhhltB9CSh4L5rPADhRqF9yOCFOsTOUzPKkPVeEg+s4CyxV709tJ8Mim4XQ9Xd
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR03MB3386.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(122000001)(66476007)(66556008)(31686004)(91956017)(6486002)(38070700005)(316002)(31696002)(86362001)(4326008)(36756003)(8676002)(64756008)(66446008)(76116006)(66946007)(8936002)(54906003)(6916009)(82960400001)(508600001)(71200400001)(6512007)(6506007)(186003)(26005)(5660300002)(55236004)(53546011)(2616005)(2906002)(83380400001)(45980500001)(20210929001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UmF5SFMyRzhYSWE0eVhBb0cxYWxvdFA0TUw1RmpzVVZ2eG02MWdMYlhtSlpN?=
 =?utf-8?B?MW9Nek1pYlBiajFkaDgvQnZBb2VnbDNHanBic05yQTRsS2JsMmYyMzBHcGpN?=
 =?utf-8?B?czV2b1o3bUp0Znp6R0VUTC9mdzVaVlVuOTZoSlJrV1pMM2NOY2Z1ajZQdHJx?=
 =?utf-8?B?Rk1aOW1JalBxbGVaOVdBdmdxMHlhcmZJREtIam1ITmw0NTllSUNZQXArUUdy?=
 =?utf-8?B?UXFubEFSbVZkekdlZzlDbHNxK0pYQzZkempPaVBuV0huajNYN2g2Z2FveHpI?=
 =?utf-8?B?VEFibCtFb0llK2JVc1NaazN5czk0NGZkWnJCM2w1N3VDYXJ2SU82dGdJOWFR?=
 =?utf-8?B?QnNNNTMwYnF1VWYyQzR5MlhMWFZNUlBtenVPVXVXVDlvZjhhcFJwY2V5Y1NW?=
 =?utf-8?B?M0JUaktyTXFrcFZHdWJOV1FmdkZ4Q0VMaXhueTRobWZvMmZCZzlsci9GanJZ?=
 =?utf-8?B?VmFtYjhvQ1JpVm8yS3lDTWh4TzEwRklJckRtRm1JelM1Q3ArQnNmd095aXEy?=
 =?utf-8?B?NmRWVEJ4b1NnZEV5azY0dnpNNzZFM1h2Q3AvWDZsOWFMWG1HTjdwOGRCU2FC?=
 =?utf-8?B?NlN4Sk1ZWlFRQmVZcnA4TlByK3UvVk14amZTaEtNblNpSVFZeXNTTExmSFYy?=
 =?utf-8?B?NE9WTFh6RGhuSzRxNVlra3lvdkxFQWs3ZHpTN1VQMXBGbWJ0VitlbmwzR0ln?=
 =?utf-8?B?V05qL2J2RnFTSHJpcVUxUzJJVVZCS1RDZWxtYjU2eHRaUkFYNk5wc0I4YUti?=
 =?utf-8?B?MFJVUEE4ZTNFWER0a3Z6VmtWTHpJU1lnand2YmQ1RFJNbHNtaG9QWVJ0c3pG?=
 =?utf-8?B?a1pSQ0U3R0pxUkJPWHQyeXRJcHVTUWhXakFncGZYdTh0RTc0SFBRMi9aN0Rv?=
 =?utf-8?B?Z08ycHkwRlcxcUo3N3RoZHNENzFQeFZaQ1JQRVNoVWlwNlZCZWk5aGNrQlQ0?=
 =?utf-8?B?ZE1kcmFOdWlnd1JKcmgrTmswaHlINWs2Wnc3SjBYNHhGTmJMcGhUVWNQS2VT?=
 =?utf-8?B?NS91TVpaTDRQWmNaT3dvSkZmdTQ5VmYxWk9OZE9FWmcrcUgzTlZNSVl0clQw?=
 =?utf-8?B?dTVIUzFKbGI4ZWU2dXVHQjNINzVYS1NTWWRNWk9STVdTVWFzU0Y2LzJ6YnlY?=
 =?utf-8?B?d1lZcmdkakY3aWN6Zjg5dlVjVCtVQ1lUM3lJRjMrQmhhYVlTUlcrdEVHS1pW?=
 =?utf-8?B?QzB5MjZkVXhrWXR4dkZhZWlxVHpZd2VCblV6Z25OWUwwWk16Wk1uYjJGZWY2?=
 =?utf-8?B?eFUramhnR1NHLzlpWWgxRm5rQ1hzbFNQRTRScDdxck8xcTRrSFhwNXExTmdt?=
 =?utf-8?B?eTUyNW9RU3Q5MG1NZ0lBbFpMYnpFVTFQNFJvd3lPZms0b0t6Q1JhM1hqZnlU?=
 =?utf-8?B?amJDT3BrYWtxdS9oalR0clo0RnE0Q0tkSTMxR0QybmZTYVY0U2tNbk42UEpE?=
 =?utf-8?B?a2xyOVk0NFVQQWhMeDFKZEN4Y3hmalZKemJ5T1A3WEtKbG9oYmNZM0lxTEY4?=
 =?utf-8?B?ZjllRzRwSkNHaC9TdHNkSFNyeEozS1F5QlN3RVpiMHR5dDA0QVFLUUlGdS9L?=
 =?utf-8?B?TW1ZUTc0Y2NmRUNHdUdGV0tCaEZNVkZzVlhVc3FRdjNoTkk1NFhieFo4bjNG?=
 =?utf-8?B?OFBocFQzTVR4Si9hS01IRjNPTHlScGFUalh1K2dYTFVJMDlhVU1Sc1VHRm5M?=
 =?utf-8?B?SWJsbmcvK1JrUnFEbVFVbHB1c2craU5zdkxIZ2lrM2JIY0ppejhqQ1B0RG91?=
 =?utf-8?B?SHBzVHR0NjN3alNxdTVweE1hdU5uSmR4OWpWd2VIcmFHRkZnSGJLWkZaQVY4?=
 =?utf-8?B?WHhSaHFIcU02WDA5T0dDOS85ek9oWlprMTcxV2xkU3VUS0tReEcySVFSMmxv?=
 =?utf-8?B?UWx2WlNmTHdvTVpUSnJsT2xBU0pIRzVSMFV0RHVRbnRJeFdUWG5KeGViZHFL?=
 =?utf-8?B?dHZDVnVjV0JpZXRjMW5oZUdFV1pFVkMwd0ZNeitmekJFMUtzY3ZwL1FHRWRX?=
 =?utf-8?B?TkRLazNwbXJ6cGlpMkNSdXVoTnpsUURYTXB2dEZkV21EbEM3U25DajAwUEZC?=
 =?utf-8?B?WVUwMnJ4YzY3SWtvUUR6Zk5BVHg2eUZrK3ljU256eXQvYVJvNG4vSXFuekpF?=
 =?utf-8?B?WWg2Q21YbUpIcnpGcmFYZ3pMelBsdC94TXB5L3FkeVYwbE1YdFZIR0RNSnVJ?=
 =?utf-8?B?elpNMVJJZENzelJDcDRYUGJlNHJhTTU1bDR5OVdEN2tabFJOdFB5U3ZvcHBy?=
 =?utf-8?Q?DWcxfib0tCTQDS6AedCwM2zP7a1cUwUaaxPhJkN4J0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6DCB448BD3AB6342850953FC3EFE2005@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR03MB3386.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e455f458-045c-459d-0c18-08d9e4d319e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2022 16:02:37.2503
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cbOHlTlCfCboAtN9dv05zeDcl4ONgFtE6RBN6lJx/3wfLkGQ749A/LysLGHpMen9Rvq68ZzLCihbqNdTP3pDkmXaOlvpyTjvBrJzHraW0bU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5203
X-OriginatorOrg: citrix.com

SGksDQpPbiAzMS8wMS8yMDIyIDEyOjA1LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMjcuMDEu
MjAyMiAxNzowMSwgSmFuZSBNYWxhbGFuZSB3cm90ZToNCj4+IEludHJvZHVjZSBhIG5ldyBwZXIt
ZG9tYWluIGNyZWF0aW9uIHg4NiBzcGVjaWZpYyBmbGFnIHRvDQo+PiBzZWxlY3Qgd2hldGhlciBo
YXJkd2FyZSBhc3Npc3RlZCB2aXJ0dWFsaXphdGlvbiBzaG91bGQgYmUgdXNlZCBmb3INCj4+IHh7
Mn1BUElDLg0KPj4NCj4+IEEgcGVyLWRvbWFpbiBvcHRpb24gaXMgYWRkZWQgdG8geGwgaW4gb3Jk
ZXIgdG8gc2VsZWN0IHRoZSB1c2FnZSBvZg0KPj4geHsyfUFQSUMgaGFyZHdhcmUgYXNzaXN0ZWQg
dml0dWFsaXphdGlvbiwgYXMgd2VsbCBhcyBhIGdsb2JhbA0KPj4gY29uZmlndXJhdGlvbiBvcHRp
b24uDQo+Pg0KPj4gSGF2aW5nIGFsbCBBUElDIGludGVyYWN0aW9uIGV4aXQgdG8gWGVuIGZvciBl
bXVsYXRpb24gaXMgc2xvdyBhbmQgY2FuDQo+PiBpbmR1Y2UgbXVjaCBvdmVyaGVhZC4gSGFyZHdh
cmUgY2FuIHNwZWVkIHVwIHh7Mn1BUElDIGJ5IHJ1bm5pbmcgQVBJQw0KPj4gcmVhZC93cml0ZSBh
Y2Nlc3NlcyB3aXRob3V0IHRha2luZyBhIFZNIGV4aXQuDQo+IA0KPiBUaGlzIGlzIG9kZCB0byBy
ZWFkIGZvciBhIHBhdGNoIHdoaWNoIG1ha2VzIGl0IHBvc3NpYmxlIHRvIF90dXJuIG9mZl8NCj4g
YWNjZWxlcmF0aW9uLiBJbnN0ZWFkIGl0IHdvdWxkIGJlIGludGVyZXN0aW5nIHRvIGtub3cgd2hh
dCBwcm9ibGVtcw0KPiB5b3UgaGF2ZSBlbmNvdW50ZXJlZCBtYWtpbmcgaXQgZGVzaXJhYmxlIHRv
IGhhdmUgYSB3YXkgdG8gdHVybiB0aGlzIG9mZi4NCk1ha2VzIHNlbnNlLg0KPiANCj4+IC0tLSBh
L3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jDQo+PiArKysgYi94ZW4vYXJjaC94ODYvaHZtL3Zt
eC92bXguYw0KPj4gQEAgLTMzNDIsMTYgKzMzNDIsMTkgQEAgc3RhdGljIHZvaWQgdm14X2luc3Rh
bGxfdmxhcGljX21hcHBpbmcoc3RydWN0IHZjcHUgKnYpDQo+PiAgIA0KPj4gICB2b2lkIHZteF92
bGFwaWNfbXNyX2NoYW5nZWQoc3RydWN0IHZjcHUgKnYpDQo+PiAgIHsNCj4+IC0gICAgaW50IHZp
cnR1YWxpemVfeDJhcGljX21vZGU7DQo+PiArICAgIGludCB2aXJ0dWFsaXplX3hhcGljX21vZGUs
IHZpcnR1YWxpemVfeDJhcGljX21vZGU7DQo+IA0KPiBQbGVhc2Ugc3dpdGNoIHRvIGJvb2wgYXMg
eW91IHRvdWNoIGFuZCBleHRlbmQgdGhpcy4NCj4gDQo+PiAgICAgICBzdHJ1Y3QgdmxhcGljICp2
bGFwaWMgPSB2Y3B1X3ZsYXBpYyh2KTsNCj4+ICAgICAgIHVuc2lnbmVkIGludCBtc3I7DQo+PiAg
IA0KPj4gKyAgICB2aXJ0dWFsaXplX3hhcGljX21vZGUgPSAoIGNwdV9oYXNfdm14X3ZpcnR1YWxp
emVfYXBpY19hY2Nlc3NlcyAmJg0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHYt
PmRvbWFpbi0+YXJjaC5odm0uYXNzaXN0ZWRfeGFwaWMgKTsNCj4gDQo+IFBsZWFzZSBkb24ndCBj
bG9uZSB0aGUgYmFkIHVzZSBvZiBibGFua3MgaW1tZWRpYXRlbHkgaW5zaWRlIHBhcmVudGhlc2Vz
DQo+IGhlcmU7IGluc3RlYWQsIC4uLg0KPiANCj4+ICAgICAgIHZpcnR1YWxpemVfeDJhcGljX21v
ZGUgPSAoIChjcHVfaGFzX3ZteF9hcGljX3JlZ192aXJ0IHx8DQo+PiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgY3B1X2hhc192bXhfdmlydHVhbF9pbnRyX2RlbGl2ZXJ5KSAmJg0K
Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjcHVfaGFzX3ZteF92aXJ0dWFsaXpl
X3gyYXBpY19tb2RlICk7DQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNwdV9o
YXNfdm14X3ZpcnR1YWxpemVfeDJhcGljX21vZGUgJiYNCj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdi0+ZG9tYWluLT5hcmNoLmh2bS5hc3Npc3RlZF94MmFwaWMgKTsNCj4gDQo+
IC4uLiBzaW5jZSB5b3UncmUgdG91Y2hpbmcgdGhpcyBhbnl3YXksIHBsZWFzZSBjb25zaWRlciBj
b3JyZWN0aW5nDQo+IHRoZSBzdHlsZSB2aW9sYXRpb24gaGVyZS4NCj4gDQo+IEhvd2V2ZXIgLSBk
byB5b3UgbmVlZCB0aGVzZSBleHByZXNzaW9ucyBhbnltb3JlPyBUaGUgcGVyLWRvbWFpbiBmaWVs
ZHMNCj4gY2FuIG9ubHkgYmUgc2V0IGlmIHRoZSByZXNwZWN0aXZlIENQVSBjYXBhYmlsaXRpZXMg
ZXhpdC4NCj4gDQo+PiAtLS0gYS94ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vaHZtL2RvbWFpbi5o
DQo+PiArKysgYi94ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vaHZtL2RvbWFpbi5oDQo+PiBAQCAt
MTE3LDYgKzExNywxMiBAQCBzdHJ1Y3QgaHZtX2RvbWFpbiB7DQo+PiAgIA0KPj4gICAgICAgYm9v
bCAgICAgICAgICAgICAgICAgICBpc19zM19zdXNwZW5kZWQ7DQo+PiAgIA0KPj4gKyAgICAvKiB4
QVBJQyBoYXJkd2FyZSBhc3Npc3RlZCBlbXVsYXRpb24uICovDQo+PiArICAgIGJvb2wgYXNzaXN0
ZWRfeGFwaWM7DQo+PiArDQo+PiArICAgIC8qIHgyQVBJQyBoYXJkd2FyZSBhc3Npc3RlZCBlbXVs
YXRpb24uICovDQo+PiArICAgIGJvb2wgYXNzaXN0ZWRfeDJhcGljOw0KPj4gKw0KPj4gICAgICAg
LyogaHlwZXJ2aXNvciBpbnRlcmNlcHRlZCBtc2l4IHRhYmxlICovDQo+PiAgICAgICBzdHJ1Y3Qg
bGlzdF9oZWFkICAgICAgIG1zaXh0YmxfbGlzdDsNCj4gDQo+IFBsZWFzZSBmb2xsb3cgaG93IGFk
amFjZW50IGNvZGUgcGFkcyB0eXBlcyAvIG5hbWVzIGhlcmUuDQo+IA0KPj4gLS0tIGEveGVuL2Fy
Y2gveDg2L3RyYXBzLmMNCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni90cmFwcy5jDQo+PiBAQCAtMTEx
NSw3ICsxMTE1LDggQEAgdm9pZCBjcHVpZF9oeXBlcnZpc29yX2xlYXZlcyhjb25zdCBzdHJ1Y3Qg
dmNwdSAqdiwgdWludDMyX3QgbGVhZiwNCj4+ICAgICAgICAgICBpZiAoICFpc19odm1fZG9tYWlu
KGQpIHx8IHN1YmxlYWYgIT0gMCApDQo+PiAgICAgICAgICAgICAgIGJyZWFrOw0KPj4gICANCj4+
IC0gICAgICAgIGlmICggY3B1X2hhc192bXhfYXBpY19yZWdfdmlydCApDQo+PiArICAgICAgICBp
ZiAoIGNwdV9oYXNfdm14X2FwaWNfcmVnX3ZpcnQgJiYNCj4+ICsgICAgICAgICAgICAgdi0+ZG9t
YWluLT5hcmNoLmh2bS5hc3Npc3RlZF94YXBpYyApDQo+PiAgICAgICAgICAgICAgIHJlcy0+YSB8
PSBYRU5fSFZNX0NQVUlEX0FQSUNfQUNDRVNTX1ZJUlQ7DQo+PiAgIA0KPj4gICAgICAgICAgIC8q
DQo+PiBAQCAtMTEyNiw3ICsxMTI3LDggQEAgdm9pZCBjcHVpZF9oeXBlcnZpc29yX2xlYXZlcyhj
b25zdCBzdHJ1Y3QgdmNwdSAqdiwgdWludDMyX3QgbGVhZiwNCj4+ICAgICAgICAgICAgKi8NCj4+
ICAgICAgICAgICBpZiAoIGNwdV9oYXNfdm14X3ZpcnR1YWxpemVfeDJhcGljX21vZGUgJiYNCj4+
ICAgICAgICAgICAgICAgIGNwdV9oYXNfdm14X2FwaWNfcmVnX3ZpcnQgJiYNCj4+IC0gICAgICAg
ICAgICAgY3B1X2hhc192bXhfdmlydHVhbF9pbnRyX2RlbGl2ZXJ5ICkNCj4+ICsgICAgICAgICAg
ICAgY3B1X2hhc192bXhfdmlydHVhbF9pbnRyX2RlbGl2ZXJ5ICYmDQo+PiArICAgICAgICAgICAg
IHYtPmRvbWFpbi0+YXJjaC5odm0uYXNzaXN0ZWRfeDJhcGljICkNCj4+ICAgICAgICAgICAgICAg
cmVzLT5hIHw9IFhFTl9IVk1fQ1BVSURfWDJBUElDX1ZJUlQ7DQo+IA0KPiBTYW1lIHJlbWFyayBh
cyBhYm92ZSAtIGNhbid0IHlvdSBub3cgdXNlIF9qdXN0XyB0aGUgcGVyLWRvbWFpbiBmaWVsZD8N
Cj4gSW4gdGhpcyBsYXR0ZXIgb2YgdGhlIHR3byBjYXNlcyB0aGlzIHdvdWxkIHRoZW4gYWxzbyBt
ZWFuIGJyaW5naW5nDQo+IHRoZSBDUFUgZmVhdHVyZSBjaGVja3MgaW4gbGluZSB3aXRoIHdoYXQg
dm14X3ZsYXBpY19tc3JfY2hhbmdlZCgpDQo+IGRvZXMgKGFzIGFsc28gcG9pbnRlZCBvdXQgZm9y
IHBhdGNoIDEpLiBBbGJlaXQgaXQgbWlnaHQgYmUgYmVzdCB0bw0KPiBoYXZlIGEgcHJlcmVxIHBh
dGNoIGZpeGluZyB0aGUgaXNzdWUsIHdoaWNoIGNvdWxkIHRoZW4gYmUgYmFja3BvcnRlZC4NCklu
ZGVlZCwgdGhhdCB3b3VsZCBiZSBiZXR0ZXIuDQpIZXJlIEkgdGhpbmsgdGhlIGNob2ljZSBoYXMg
YmVlbiB0byBvbmx5IGFubm91bmNlIGhhcndkYXJlIGFzc2lzdGVkIA0KeDJhcGljIHN1cHBvcnQg
aW4gQ1BVSUQgaWYgYm90aCByZWFkIGFuZCB3cml0ZSBhY2Nlc3NlcyBhcmUgdmlydHVhbGl6ZWQu
IA0KSSBjb3VsZCBlaXRoZXIga2VlcCB0aGUgeDJhcGljX2F2YWlsYWJsZSBjaGVjayBpbiBQYXRj
aCAxIGFzIGlzIGFuZCB1c2UgDQp0aGUgcGVyLWRvbWFpbiBmaWVsZCBoZXJlLCBhbmQga2VlcCB2
bXhfdmxhcGljX21zcl9jaGFuZ2VkIGFzIGlzIG9yIHZ2Lg0KPiANCj4gSmFuDQo+IA0KPiANClRo
YW5rIHlvdSwNCg0KSmFuZS4=

