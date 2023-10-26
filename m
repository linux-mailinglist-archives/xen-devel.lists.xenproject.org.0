Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8957D840D
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 15:58:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623834.972063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qw0rw-0001Rm-Ov; Thu, 26 Oct 2023 13:57:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623834.972063; Thu, 26 Oct 2023 13:57:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qw0rw-0001Ol-Ln; Thu, 26 Oct 2023 13:57:52 +0000
Received: by outflank-mailman (input) for mailman id 623834;
 Thu, 26 Oct 2023 13:57:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Iwvv=GI=citrix.com=prvs=656fec104=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qw0rv-0001Of-1U
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 13:57:51 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4aa49a0-7407-11ee-9b0e-b553b5be7939;
 Thu, 26 Oct 2023 15:57:48 +0200 (CEST)
Received: from mail-mw2nam12lp2041.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Oct 2023 09:57:43 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by DS7PR03MB5573.namprd03.prod.outlook.com (2603:10b6:5:2d1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.16; Thu, 26 Oct
 2023 13:57:38 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::acf0:ce2b:1634:5aee]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::acf0:ce2b:1634:5aee%6]) with mapi id 15.20.6933.011; Thu, 26 Oct 2023
 13:57:38 +0000
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
X-Inumbo-ID: a4aa49a0-7407-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1698328668;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=3vxxy1VQ69tIo8KOvUpgvUDKAKDMqkUYkI/Rr5r8afY=;
  b=CAPnqo97O7fnlN+BM2nAnL1ryRgpH1G2yqWJcJ8ekBoSF/Bvs0n4NVMc
   MZT+Kod3Det32Slw2gVG1O6qW+OpxbKg7kQvwuHLOHRMk+0iKYNvZ/dB1
   UWcv7Jz92eLX1L1cO4rW5eIjET7gx/ySO2gG0Ev1YCtR7fuIoUOlF6XCk
   I=;
X-CSE-ConnectionGUID: 9Td9a5hFQoSbzgVwrdG/ww==
X-CSE-MsgGUID: Un1hOfFwSoyZvYn2qd8wog==
X-IronPort-RemoteIP: 104.47.66.41
X-IronPort-MID: 125322776
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:7qd4KaJQwgHvB5saFE+R9pQlxSXFcZb7ZxGr2PjKsXjdYENS1TVWy
 2pNC2DXPP6INmuhKtxxb4/io0tUv8DUytcxQAJlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAhk/nOHvylULKs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrYwP9TlK6q4mhB5gZgPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c4mPW0f/
 KEYBgkKVRqRiNyp2r6UDfZz05FLwMnDZOvzu1lG5BSAV7MDfsqGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/RppTSKpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+tqyjx3bWVwnylMG4UPIC+r/5NjnOM/WsCOgMnUwGirammjUHrDrqzL
 GRRoELCt5Ma9kamU938VB2Qu2Ofs1gXXN84O/037kSBx7TZ5y6dB3MYVXhRZdo+rsg0SDc2k
 FiTkLvBGjhHoLCTD3WH+d+pQSiaPCEUKSoHenUCRA5cud37+tlv11TIU8ppF7OzgpvtAzbsz
 juWrS84wbIOkcoM0Kb99lfC696xmqX0oscOzl2/dgqYAslRPuZJu6TABYDn0Mt9
IronPort-HdrOrdr: A9a23:S3/F+66yOTP2mqk5XAPXwY2BI+orL9Y04lQ7vn2ZKCYlB/Bw8v
 rE8sjzuiWVtN9vYgBdpTntAsi9qBDnhO1ICPcqTNWftWDd0QPDEGgI1/qA/9SPIVyaygZXvZ
 0QDJSXYLfLYWST5qzBjzVR3LwbreWvweSQoaP78l8odAdtbshbnnVE4sTwKDwJeOGDb6BJZK
 Z1I6B81kudkA8sH6CGL0hAZfHHu9rI0Lr+eHc9dmcawTjLtyqs9Ln5VzOF3hISOgk/vIsKwC
 z+ignk4afmlPm+xnbnpgjuxqUTosLl1txAQOqTjcQPQw+c7DqAVcBaQrifuzJwmsGDgWxa6O
 XkklMbJsFu7HGURG2vvhf3/AHl3F8VmgTf4G7du2Lnvcv6AA03ENBAg4UxSGqi13Yd
X-Talos-CUID: =?us-ascii?q?9a23=3ARfoRfmu4Q08zqCBrxgd1IegP6It0TnGMxSrQDXa?=
 =?us-ascii?q?/Mmx7R4OKU1O/v7x7xp8=3D?=
X-Talos-MUID: 9a23:HNxFMQs3uenJ+i/jh82nuTc7NOBmzbuVD1E/j6QA4dCIZTN3NGLI
X-IronPort-AV: E=Sophos;i="6.03,253,1694750400"; 
   d="scan'208";a="125322776"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kbYlhVWBZKs5Uf8xg9JgHYRe/CUGl+qX/iBKHCotgsb9OXuCnw62I61MmfJXSrEzlibPcvCfbht+7juihErXpMvo/bzlCXrGz1HXJoUwgNkE7QEkWPOkW3qtpsA2jSxy5fk8WnCFx8xyH1wLnP0ZK029HS923gWbcr+WSblHkopKYe16uQXRbFmpUbhjYDmwoH/UWbPJzcoQEQLvvZiYikHpbNpInfeUnFvOQ9bum5FaGfNVAN5wlbHMHS/yLKAEKR6/N1bu6Le6ZO4gdIdEgnldCe062OZ+yhgmuLv0dlwa3JCrzu29nagjNIU/Pg/JBQRapQMiW5BkplkeH4LooA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m4aiLF328sgtZU4YVFFM0iAfIXlfGqbGAOhC/j0tCd0=;
 b=LTho1iPEC6O2GcwTArnMg6pKob4+Vos5R/fth1pdeIQ/bWvcjzC5kwS6alG/fSiSXhdz80ybIVwVGk2Pw5ybIDBm0dUCSnVsMgQSmsqur06d4Xh+IYPbAkrqDVLpj4Z9ukM/zT2urABFRmAYuo3SPkuvOG3ZmWAMbJx6mCgYmlLC2M+99F5PKvTeRpAHOGIZz7bP+4JDXHNrcGYJRPcOysccYhaysQRrt9kIIagW0IlmmvjdONRia5gPZ8YmVfGD8mo0B2TvyEkovQnHvx1Zx0Fjt76iNvOVz1Lt2rdid49Wwy2d9PlD2pWzZUjcwW08t3b8gdm7GDqAj+YCHA+5qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m4aiLF328sgtZU4YVFFM0iAfIXlfGqbGAOhC/j0tCd0=;
 b=B0i67rpbfN4RpTxnV+C5d3NdMHms8IFprJ5RqUT0HuXKnNmyS1wVUCquuHi9lUv/tXi3lx4lBbYZHxQOZsklEbz2b7EpOkSVkkz9O0ufPsPxMSj/bVY1e7cmt2J9gDNUT8jmYbMzJ4MO5b4SY4+BMrkJab6QQBFj2pweX88ckjc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 26 Oct 2023 15:57:34 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 5/7] x86: detect PIT aliasing on ports other than 0x4[0-3]
Message-ID: <ZTpwTrLU4d90lWYm@macbook>
References: <95129c04-f37c-9e26-e65d-786a1db2f003@suse.com>
 <042f76dd-d189-c40a-baec-68ded32aa797@suse.com>
 <ZTo-tpk64ew4rk1o@macbook>
 <6c3a4243-fef4-129c-8f58-7bc009f886b6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6c3a4243-fef4-129c-8f58-7bc009f886b6@suse.com>
X-ClientProxiedBy: MR1P264CA0135.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:51::12) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|DS7PR03MB5573:EE_
X-MS-Office365-Filtering-Correlation-Id: e02359f6-583c-4948-2a3f-08dbd62b838f
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nFghqYjteUy/VGoBkTfn/Oivww0j1aTjahd4BlMQt8EiN2RZtNXaaPjad3thTI+oA/wKGcsVD5kNv/MY1Q7P2Py1DbqYO3JOvC6dmuWW4LNWnwUPKBgAL1G81bbYHNYqQ0l6SozkHGR8IHH6ByWl0SLaaYQHEWVoBr2M+EL1BjQtdSSTl2osX4rZ+d2mf83/plfFAg9+S3sKI+e2c7oaTjgJhu6OINQFH0KAk7XQPhAElqdnU1FvJGQFT9xfIcnxkZ9CXFWxZyatj85o94BVkP6DE4TojXAuVfR60X1/g/Sda87swI90ogcYhjrBiap9YL2a4muhBOQVa+qZAFRGS5gUSg6cg0/DUt+09+HnTEYzOENg898E0qI/0VPN5NLe7zQ0kqt0u45VRR/cxrl5L1OYEA8n8hjee4sEWhZzI8wcMDyc70z8YW3qMGHx/3QlT9wtfiJV83NDGF+Q579PUJznt9ZB8rtPynBB2LHaUkw5869j6MHwupyktvemRhwHxOW71pbQqQTeABPV1ukc7Hxx3fW4507MZgdtfsOEcmLQu5oA0z7QmOH6a90PgPMS
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(366004)(396003)(376002)(136003)(39860400002)(346002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(478600001)(6486002)(26005)(82960400001)(6666004)(53546011)(6506007)(33716001)(9686003)(6512007)(6916009)(54906003)(66556008)(66476007)(66946007)(38100700002)(316002)(83380400001)(8676002)(8936002)(5660300002)(2906002)(4326008)(41300700001)(85182001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QnRIRndPci9aL2tjSm8wN3lmYWFZOURtQ1N1L0JlTjVqNWZic0lqS1F5SnRj?=
 =?utf-8?B?U2VFbWNhY0s1UnQ3ZzRlOU5hN2FENGtwWGNIMElhQjhLcS9RNGdRZnZZRWN1?=
 =?utf-8?B?bjJhYkNCWXFnbUJwTkVuTWJyK1dmVFJad3hEUVlhNDNUazQ3QUYwZVJjbXh6?=
 =?utf-8?B?K2J2Y3ZUZ2tBUFJxejJzc1p0ZUlFS1g3SGNHcjNNeWIxclk0ZEV2TEFpMStI?=
 =?utf-8?B?VW5SSVc1RU5zV1F2M3dTWDFmRkYwdHZXWFdnYWFuWWVCRC83VHZFbG1sYjk0?=
 =?utf-8?B?aU5SdDJHT1VUd3ZtaWE4VXF3WEtrTnQvU0pRTnBJYmlmbDMreGdUZlQzOGtR?=
 =?utf-8?B?NXcrSk9JYlhkdnR4L3BhcmN1UlNBWEwyb1JDazZRNk5qZWhCSG1xb3A1UTlQ?=
 =?utf-8?B?aHFPdlVhMDBDNi9WU2FObmtKNnZWcE82bHFqUmhKVGplWGM0a0kzMllwTVpM?=
 =?utf-8?B?UTgzbVZQcW5lOGt3OXdaTlk5UXJzOGtocDNPQkJ2UC9DeTB5MEpNOEJXR1VD?=
 =?utf-8?B?OWY0d2dHd1hnNGxuV0lXbWtlUG9kNnlpTlJKa1NlYWJpSi9PQ2hjSnAyUVp2?=
 =?utf-8?B?ZHNqekZLSHJZSDY0cVh2MU50L1RWSGJwOGFVZnFRMGd0MzBaY3dkMEI0YVo5?=
 =?utf-8?B?ak9OY3NLQ1c0NEd1c2FTd0VsMHR1VTlMbXRSMEpOaTFzekcrVmxKelFIeThX?=
 =?utf-8?B?YUtSVkIwQkl1K1FseHJFZVROTitCMTVraVRVSU5EWWRxU0J6dFFwMWhZZlY3?=
 =?utf-8?B?cGQrYjJERVVlZkhUVWE3RVBJVVozQ2VwWGo4MjFDbUtxMUdDZG0wSnlxT1I5?=
 =?utf-8?B?dXNSNDVwYkRqenBHYk81UHJNVHZDdWt6TWdSWTROUktreC9zMDljY2JhK2pV?=
 =?utf-8?B?SDJJYTJOMzdzRlJhV1hrS3dyMDZJMCt3UlM5d3A3SXpkd1JIODFQaytpUGww?=
 =?utf-8?B?dmhNNHdlakJLaUh1VUloSFJ1aWsrd1d2SGF2ZUlyWjR1VTZFUHluakE4OGF2?=
 =?utf-8?B?cXZjcEdSSFRoUVIrc0pqZjgySTZodUFwQzRYaW1tZ3lObDY0M2N0bkpBNjJR?=
 =?utf-8?B?TW5uNVlDNnRkTFJNenhFenNISmlzZVd3eU5ZZE94azdyaWZDTmU4NCtrZjB4?=
 =?utf-8?B?bVA4RUNDQmh2ZXhPc0NkMFU2a2NBaEk4R0ZEZ2IwdWk5TmxlOTFXQjBDa1V1?=
 =?utf-8?B?eTZac0owRlFmWmk5MTd1NWpnTHJuT08yOEpLczlqajZLQ1NpZ2ZjSjc3NTll?=
 =?utf-8?B?Z2lCaUFCL0JGSVZ1WlhqSFQxaHEvcGNjS01nMXBBRmwzY0VEaFVIU0dyVE5B?=
 =?utf-8?B?L3BLS0xjNk4ybUxsOFU4OFh5RHBaODBaNjRtdWhsKzFZZUdaOTVQU3hyQmJu?=
 =?utf-8?B?NG5jWVdybzdySWV0bHZmNC9QbWpBSkMrb3FxUUhDM0psejVOZHZoSUNGbGJp?=
 =?utf-8?B?QU9Yekd4bXl6dUtJNnc4OHpScjloVlJ4UHlxNDBQUEVmSnl5ZEpkWStBMDZu?=
 =?utf-8?B?dWYzYnUzekJraE9BVXBNb0RXY2MvaVI1emFYWXJPRzZhbWpibUxHeUw2VWZZ?=
 =?utf-8?B?M1haWnMwODR6OHNsL2tBeTFNTGRKVlBkcldvM1Urek1TSHg0cC85SlVLelZO?=
 =?utf-8?B?UWFQeVBtODY3ZlBOSkNQMmZGWjBXTy9memhDeHByVThCN1pmRTAzUlRZaW0x?=
 =?utf-8?B?U1M5SzBTZU5GWFFYR1MyeFV1Uk4rMUQvV3N6ZUg2am9JZU5SWXExdGFsZzlT?=
 =?utf-8?B?N1lrQlByd24wSXh6ZHJZZDE5azJld0EyUVhuYVh6aUVmang1Y0lEWmVVYWFi?=
 =?utf-8?B?MnJJYnh0UVRtcThmeWFjM1NYdWNFQ1ZDbS9BUS9rVFVDcHVtWXI2eHdRTHh6?=
 =?utf-8?B?M3FvU1c0Vm1RdEUyYWMzNEc4dHBISk9TOTZMZS9YYmpKeU1GZ0c0bDdKZ0N5?=
 =?utf-8?B?dzVYZnhCbTJ6amJ2YmR1NU1aZDl6YlZSbWFtZG50U3BJT0dJYnpQbVpLcGJX?=
 =?utf-8?B?S1lKSE11eDNtZmZjcVBRNVVwbW1ab1NkOEJsd3B3VVRVb21WbUFqMC9jY0Nq?=
 =?utf-8?B?YmliZ0lKQnJVcitsdEEvWlBJbVVzZktPSlpCdTB3MW5VekZlOW1pZkhyRHAv?=
 =?utf-8?Q?+ZT8l08pdkyC2L8wsWlFkjlby?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1fygwM9+xXIqXauABNrlIBnm/W5DVwA/ZfYJfsXxAVnWJzwWfQWaCC2q/IJonsoYPZjvHkK0MwqK1GQ12GpuS4nheDcn9QFCmZhzD9EWWmEWanPF0GJ2XxuMZgKdOUDt71f7Jf/lLCBWBsBkIr2RapEip12kqXgLDEPBQnWn1I87GdJSKQoze1zIIH9jwQpoZmYSPmUXmK9gK1a8RJ9TKdX6nkV62UFAkYFaSHkcwYpuumQ2PveaZiD+nG2W2GE21SV9l4ZX+njnTgfGrBBumftrs9Rcof+cHLoRW2aCoAuq8k4q7SG2NAREIakmUHH76o13E8vvCtXk4NnNAy4GhDRLPMQk9pGo83Pddg1rztcF3syLehnfjwYqBMw4IYxuteLwABpktGmNnfUYOnVOORPfrW4FCLqaHoKGVCx7VnAqqdDGSz75bB7LMZ3KEr3pzldloRHimVJeZuWnb337I3ycTl6aS0yLTgL5ft/79QuvSuUWZL2YX+rfl6rSbMbW0LiZx5HV5sosQBYecybS6I0Ss8L+ronOpPHS6ZujM0IXNVX+vrM7vi9xLMyuh4KHoOSKBis213j6mFBlqGlAmGiWesQPfiOCID4RZq4wQoADDq01YjPV0t+hHOsa3aoh9koqO78tmrSpg5AQjt3AGGFbofp49QdUfRVCkeguzJxhEkEUBWXyBGJuV0PDOKyoA8V6AoJOTxXIR+plJ3+MuiFZf2/dZQkRnPCcKmMUOdTvdXZDElubiho+vYgJP3hvt0SN2UEplcNLhCp0tPwBgy09pP15zAPZXvLjRB175YUpKuBeH9ACd4QQuB66sKPcAJLuhbyJ4fL2zJJMnfk1Ig==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e02359f6-583c-4948-2a3f-08dbd62b838f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 13:57:38.6213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qs4v1knJycyxQ6VYE/f4qzqeDDz+agTJf8FhKOy5yJBlj9CggpEdvrI/EgbFSZ2+vAfoWk7zzq7pIzqE1aawrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5573

On Thu, Oct 26, 2023 at 02:31:27PM +0200, Jan Beulich wrote:
> On 26.10.2023 12:25, Roger Pau Monné wrote:
> > On Thu, May 11, 2023 at 02:07:12PM +0200, Jan Beulich wrote:
> >> ... in order to also deny Dom0 access through the alias ports. Without
> >> this it is only giving the impression of denying access to PIT. Unlike
> >> for CMOS/RTC, do detection pretty early, to avoid disturbing normal
> >> operation later on (even if typically we won't use much of the PIT).
> >>
> >> Like for CMOS/RTC a fundamental assumption of the probing is that reads
> >> from the probed alias port won't have side effects (beyond such that PIT
> >> reads have anyway) in case it does not alias the PIT's.
> >>
> >> At to the port 0x61 accesses: Unlike other accesses we do, this masks
> >> off the top four bits (in addition to the bottom two ones), following
> >> Intel chipset documentation saying that these (read-only) bits should
> >> only be written with zero.
> > 
> > As said in previous patches, I think this is likely too much risk for
> > little benefit.  I understand the desire to uniformly deny access to
> > any ports that allow interaction with devices in use by Xen (or not
> > allowed to be used by dom0), but there's certainly a risk in
> > configuring such devices in the way that we do by finding a register
> > that can be read and written to.
> > 
> > I think if anything this alias detection should have a command line
> > option in order to disable it.
> 
> Well, we could have command line options (for each of the RTC/CMOS,
> PIC, and PIT probing allowing the alias masks to be specified (so we
> don't need to probe). A value of 1 would uniformly mean "no probing,
> no aliases" (as all three decode the low bit, so aliasing can happen
> there). We could further make the default of these variables (yes/no,
> no actual mask values of course) controllable by a Kconfig setting.

If you want to make this more fine grained, or even allow the user to
provide custom masks that's all fine, but there's already
dom0_ioports_disable that allows disabling a list of IO port ranges.

What I would require is a way to avoid all the probing, so that we
could return to the previous behavior.

> >> --- a/xen/arch/x86/time.c
> >> +++ b/xen/arch/x86/time.c
> >> @@ -425,6 +425,69 @@ static struct platform_timesource __init
> >>      .resume = resume_pit,
> >>  };
> >>  
> >> +unsigned int __initdata pit_alias_mask;
> >> +
> >> +static void __init probe_pit_alias(void)
> >> +{
> >> +    unsigned int mask = 0x1c;
> >> +    uint8_t val = 0;
> >> +
> >> +    /*
> >> +     * Use channel 2 in mode 0 for probing.  In this mode even a non-initial
> >> +     * count is loaded independent of counting being / becoming enabled.  Thus
> >> +     * we have a 16-bit value fully under our control, to write and then check
> >> +     * whether we can also read it back unaltered.
> >> +     */
> >> +
> >> +    /* Turn off speaker output and disable channel 2 counting. */
> >> +    outb(inb(0x61) & 0x0c, 0x61);
> >> +
> >> +    outb((2 << 6) | (3 << 4) | (0 << 1), PIT_MODE); /* Mode 0, LSB/MSB. */
> >> +
> >> +    do {
> >> +        uint8_t val2;
> >> +        unsigned int offs;
> >> +
> >> +        outb(val, PIT_CH2);
> >> +        outb(val ^ 0xff, PIT_CH2);
> >> +
> >> +        /* Wait for the Null Count bit to clear. */
> >> +        do {
> >> +            /* Latch status. */
> >> +            outb((3 << 6) | (1 << 5) | (1 << 3), PIT_MODE);
> >> +
> >> +            /* Try to make sure we're actually having a PIT here. */
> >> +            val2 = inb(PIT_CH2);
> >> +            if ( (val2 & ~(3 << 6)) != ((3 << 4) | (0 << 1)) )
> >> +                return;
> >> +        } while ( val2 & (1 << 6) );
> > 
> > We should have some kind of timeout here, just in case...
> 
> Hmm, I indeed did consider the need for a timeout here. With what
> we've done up to here we already assume a functioning PIT, verifying
> simply as we go. The issue with truly using some form of timeout is
> the determination of how long to wait at most.

I would likely make it based on iterations, could you get some figures
on how many iterations it takes for the bit to be clear?

I would think something like 1000 should be enough, but really have no
idea.

> >> +
> >> +        /*
> >> +         * Try to further make sure we're actually having a PIT here.
> >> +         *
> >> +         * NB: Deliberately |, not ||, as we always want both reads.
> >> +         */
> >> +        val2 = inb(PIT_CH2);
> >> +        if ( (val2 ^ val) | (inb(PIT_CH2) ^ val ^ 0xff) )
> >> +            return;
> >> +
> >> +        for ( offs = mask & -mask; offs <= mask; offs <<= 1 )
> >> +        {
> >> +            if ( !(mask & offs) )
> >> +                continue;
> >> +            val2 = inb(PIT_CH2 + offs);
> >> +            if ( (val2 ^ val) | (inb(PIT_CH2 + offs) ^ val ^ 0xff) )
> >> +                mask &= ~offs;
> >> +        }
> >> +    } while ( mask && (val += 0x0b) );  /* Arbitrary uneven number. */
> >> +
> >> +    if ( mask )
> >> +    {
> >> +        dprintk(XENLOG_INFO, "PIT aliasing mask: %02x\n", mask);
> >> +        pit_alias_mask = mask;
> >> +    }
> > 
> > Is it fine to leave counting disabled for channel 2?
> > 
> > Shouldn't we restore the previous gate value?
> 
> See init_pit(), which also doesn't restore anything. The system is under
> our control, and we have no other use for channel 2. (I really had
> restore logic here initially, but then dropped it for said reason.)

It might be used by a PV dom0 (see hwdom_pit_access()), so I wonder
whether we should try to hand off as Xen found it.

Thanks, Roger.

