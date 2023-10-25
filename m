Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E797D6D09
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 15:23:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622876.970097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvdqD-0006l7-L1; Wed, 25 Oct 2023 13:22:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622876.970097; Wed, 25 Oct 2023 13:22:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvdqD-0006j1-IE; Wed, 25 Oct 2023 13:22:33 +0000
Received: by outflank-mailman (input) for mailman id 622876;
 Wed, 25 Oct 2023 13:22:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bQ/a=GH=citrix.com=prvs=655ba0516=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qvdqC-0006iv-41
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 13:22:32 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b1c4ef7-7339-11ee-9b0e-b553b5be7939;
 Wed, 25 Oct 2023 15:22:29 +0200 (CEST)
Received: from mail-co1nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Oct 2023 09:22:18 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by BY1PR03MB7261.namprd03.prod.outlook.com (2603:10b6:a03:526::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Wed, 25 Oct
 2023 13:22:14 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::acf0:ce2b:1634:5aee]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::acf0:ce2b:1634:5aee%6]) with mapi id 15.20.6933.011; Wed, 25 Oct 2023
 13:22:14 +0000
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
X-Inumbo-ID: 8b1c4ef7-7339-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1698240149;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=jDUbkLbKFt7OLMkjnslttMSBEP8saK75K99jTJn/OlQ=;
  b=CHGFHo6iyWaX7cqtD0VFp+verGrhJYmwwQQUF09cuz2hItiyFrLsjJZU
   u9hAMGmWM4BiT1EyF/GDwE34ywr0EGrQEgqUjPy/5ctJP5y2IYLYKydST
   ZEa1CCOw5vnV7X3IOYE59qJapvtBN43w4pw7mUOxU0iArHBQ4gyS8hA5M
   w=;
X-CSE-ConnectionGUID: KJOUgo4gT5eaQ4Ayi0hDIQ==
X-CSE-MsgGUID: dQq7nw1DRE+HcZdQPD3Iqw==
X-IronPort-RemoteIP: 104.47.56.169
X-IronPort-MID: 127045909
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:AZcPq6qzeo2EoZ+sLMy1DGRHrapeBmI5ZBIvgKrLsJaIsI4StFCzt
 garIBnTPKuPMWPze91zaoS1/B5X6JXQyNY1TQM/+H03RSob8JuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbOCYmYpA1Y8FE/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GhwUmAWP6gR5waGzSRNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXABMvSS2MgL65/O+2Q9Awr9UidMnHHbpK7xmMzRmBZRonabbqZvyToPR/hXI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jearaYSEEjCJbZw9ckKwv
 GXJ8n6/GhgHHNee1SCE4jSngeqncSbTAdhNTOHlp6Y76LGV7mAqEUIQSgKXm9T6qkWMV+tnB
 xc14zV7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq16bO8vT60fy8PIgc/iTQsSAIE55zop9g1hxeWF9J7Svfr35vyBC36x
 C2MoG4mnbIPgMUX1qK9u1fanzaroZuPRQkwjunKYl+YAspCTNbNT+SVBZLzt6kowFqxJrVZg
 EU5pg==
IronPort-HdrOrdr: A9a23:GvBLl6CDnGvO3s7lHejLsseALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPH/P5wr5lktQ/OxoHJPwOU80kqQFmrX5XI3SJTUO3VHFEGgM1+vfKlHbak7DH6tmpN
 1dmstFeaLN5DpB/KHHCWCDer5PoeVvsprY49s2p00dMT2CAJsQizuRZDzrcHGfE2J9dOcE/d
 enl4N6T33KQwVlUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyR+49bLgFBCc/xEGFxdC260r/2
 TpmxHwovzLiYD39jbsk0voq7hGktrozdVOQOSKl8guMz3pziq4eYh7XLWGnTYt5MWi8kwjnt
 Xgqwope+5z93TSVGeopgaF4Xir7B8er1vZjXOIi3rqpsL0ABo8Fsp6nIpcNj/U8VApst1Q2L
 9CmzvxjesdMTrw2ADGo/TYXRBjkUS55VIkjO4olnRaFa8TcqVYo4Az9F5cVL0AACX5woY6F/
 QGNrCV2N9mNXehK1zJtGhmx9KhGlw1Axe9W0AH/veY1jBH9UoJu3cw9Yg6pDMt5Zg9Q55L66
 DvKaJzjoxDSccQcOZUGPoBadHfMB2NfTv8dEapZXj3HqAOPHzA77Tt5q8u2e2scJsUiLMvhZ
 X6Vk9Cv2JaQTOhNSS35uwJzvnxehT+Ydy0ofsuoqSR+4eMC4YDCBfzCGzHyKCb0rEi6s6yYY
 fHBHsZOY6lEYLUI/c44+TPYegtFZAgarxlhj8aYSP4niuZEPydisXrNNDuGZHKLREIHkvCP1
 prZkmAGCwH1DHmZkPF
X-Talos-CUID: 9a23:ZYDc8WHMBK7mAS2EqmJE1mkpFcd5fUGAwX7pf2apCD5pZJysHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3A6jCf4gwwfzHHYh2ZDj42V/7/l9KaqKiXER8Ljsw?=
 =?us-ascii?q?qgeTHFSdCNw6loG+WW5Byfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.03,250,1694750400"; 
   d="scan'208";a="127045909"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dOlLVIS7yHgBbbT3MIxxpyY92wTsmOvZ2H3GuSTre8qEBkaJhGFIaNg+Mt2yi4W/dH3ZvWfDuJb6AqUN9B030tZHoY8wD6ohAG0pEwkLqKeu/PUZGHBcCgJPZURQxgqlFLQ6wgB/UVDqcBMxTl9CtebIUJlh5cmctlt0DHrK75xEngv/Mq7nc2+/K9PogNFXAImJWTRcHMym4CvrYdtvJ+0eZdVHspGZulLE5tOCHXlKxg4dl22gvzvfNrgisAlsblsOUs76MfgDmvrW2J8TFrTUkQk23dRrRPjUDc3UffUxkBewFE5ybBtZRtJE2KGtyT+Taagipv3d/AotzoYf8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gT/ZLanBKKH3NG5ArGpysXypruNCCVuHf+jpYnEd68w=;
 b=Ae5em29QljA3eplDB9w6wc/Vfl5X2kgJzFAttHGNEE5jV3iLpZ+oA04Mc7ydpOaU4y4rDywp0RTQiQayJIiE2nFZn3hCzWRZxmKgluz0cchW+LumOvBGOIxFwurk0BTOnhZnqSrPCjEdWFzDziu3pCKmkAFZ4F3gyA4t03iAMtpkNblrp2F/l2gjw2ZxQCKVUq7KNNS2pamu4Z14O1L/1FLFKl4hk1nhEIxq/yUhjvTK0QZfRDNbOWRTzA3dxBrZ9yeegiUM44otc2gahTbQqL15iGnruKE7wNVslJSTrE//LoXDj0YVH6y4/b429QmHa54EjHvepQib1rCa1LPBkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gT/ZLanBKKH3NG5ArGpysXypruNCCVuHf+jpYnEd68w=;
 b=thy8krdZZif4lTfGJJ18Ni/WVlaSA87HwBJ01fZW71dBHRzL/Or9xzZu/zYSjjgJNWI77WG/niGOXikKuuTiFMZfe2jGcn7eOe62Cmack251WcdXP42dZH2HbTMRsB+2c1rhPrOTkUk0QVd7L0EWbAEvpVUVR96SjJU2f1FKl4s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 25 Oct 2023 15:22:09 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 3/7] x86/PVH: deny Dom0 access to the ISA DMA controller
Message-ID: <ZTkWgWkGANAnA8Tg@macbook>
References: <95129c04-f37c-9e26-e65d-786a1db2f003@suse.com>
 <f0c67b05-c4d8-c588-d2de-e98dc819491c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f0c67b05-c4d8-c588-d2de-e98dc819491c@suse.com>
X-ClientProxiedBy: MRXP264CA0043.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::31) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|BY1PR03MB7261:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b00d7f0-d06a-45da-c114-08dbd55d66bb
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GYB1BKXNQU12R+3C44GyQ7h4d401nV5RIKtc5Kw8oH/9iiEIDgcUqdwXX6TmiZdYZGVG54B+JQKbjxCaQsDwoxvwILkzEOOhO+BBWcSCbL1TwCzS9NATmSvVSHF3CuDOXob4wdQdsDZlSDUkY8LXhJEhZNXVMDoWh9NFYdQDXNShNYWsGcFeqLclhrvC3Pq5t28hbkxX7VrodFdpVXX1rJLtDHOQdqHEwVUTqadrOT7FJNIXP+dEkvXoVuZ+qiKBVoNDus8Jq8ZgYlR5czS9bvlQJ/lFC3bxz/RWu7JZ4aNXRrUgO3IMNJm+vehlA/0qoRHKt3idZaX7pVvrVaMJ6m02Vi+X1iuGjnUbk53fSOmOhkuUBFcyLL0pIUe+6N6cXaAgqY8yoK2n4aJYjtAkBzVmS0ferlgYsSj352zd4s9fZb0NNP1nLZtHK6FC496EFetD465OtT6qg4A+cmPHLAGtohTOQGlRSd4pKqwVCiFIznzh3TbT7I+e9RYdmWmecnb9hUrViz4NnUWRRHpa+XVpXF2IgSv4EYtlw1epE+TyeT2J1/4H1IRL2nffNOov
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(366004)(346002)(136003)(396003)(376002)(39860400002)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(85182001)(6512007)(54906003)(66946007)(66476007)(66556008)(38100700002)(6916009)(316002)(86362001)(82960400001)(83380400001)(26005)(6506007)(6666004)(4744005)(41300700001)(9686003)(6486002)(8936002)(2906002)(5660300002)(478600001)(33716001)(8676002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dVVyVWRzMzAzUnI3eE91NWlRckhiTGRZdXZTWWZlaTYrcmRJWDZLRmRQaG9k?=
 =?utf-8?B?aVg0Y1JhbHV2d20raWFkeitheWZWU2FGUzRvN3N2SHdINzdJMjdXL1BJOEx0?=
 =?utf-8?B?dHRCa0oyajI3RVlLZVR1NW10eXhLU2licnRjazdQdldKVng4REZvYzV0c1dj?=
 =?utf-8?B?Y29FTDFKMWZZeDVIcjRMN0djVWlMbFl1ejNIZEU5MFFTd0lSQWllTDFUbzlQ?=
 =?utf-8?B?d2FqakpPOTZqbzMvUWE1Y3dVaEpnU1FHV0x2amdreGJvZmNocWgvK1VhL2ZX?=
 =?utf-8?B?eFNaZWxPVFRvdFBMSnVOQmdXYzZOcit2TUtCREhrbHBzdXdtQThKK0dNbHNS?=
 =?utf-8?B?eVBZZUE1elhYMDI2YmVYUTlKck12enlYTEpIUzRscHRRMU90djUwcVgycWk1?=
 =?utf-8?B?L1J4MXlDUmtSSnlxWnlpTkswSG54M1h0Ukd5QU0yOFE2VEJJaUl3NC91QzBD?=
 =?utf-8?B?VldsaU4zZUhsSytZc21FcURJWEdaUUx0emJqVEE1WHdkMTVkdFB0Tm1jYXgv?=
 =?utf-8?B?a2QrVERnR3A2RzR6Q3lra2hIV3g0RmJGWVNwTlVHczl4TzRMSnVHTzZsNm5D?=
 =?utf-8?B?ZWdONjd6aGdNdE4yT0tKSFpHdW43Zitnd1VpMXVpZUJDOGtFV05RT21Fc2ZN?=
 =?utf-8?B?ZmUrSXlYeGxhZUEzY3dyZGhVbE9lNVd3NkJrVDVraHZpblpmVEZIWW9WS0Ex?=
 =?utf-8?B?TGlPUkxaOGVHK0ZWLzhyalVmWDQxY0F0L2RLSU4xTUROZzhWYkRIdWQxajNz?=
 =?utf-8?B?MWdoVWRWOWlGVlFldlhoMWNhZUxhYitTVGdhWWZFdFVORWg1cmhzMTdUUzZQ?=
 =?utf-8?B?RGlYN3VZVlZIR3dSWnF4ZFFNN0g0aG9QQ1hLL0Vlbzd0VXNSUW9lamRUdVdr?=
 =?utf-8?B?OUhJN2dqRGpTcWhyRmNPRWhod1RYOW5hUkxFbXM4WmJCeWplWWV4eVp2OWh4?=
 =?utf-8?B?ejdyb2trV3MzRk5RbWsrS3dURmFCdlp1ZnlyaGxMd3ZPOVMwSHg5bG5ZSk1T?=
 =?utf-8?B?anBFZjF4SjZJeTdjdkNCWVFKNFlPQ255Y2VBUkxPb0J1MWY3dHczVDZyR2U0?=
 =?utf-8?B?SXF1SWZFQTF1NTNVaVJWRXJraWVjZktoUHNUcFNUcDdSWTZ5T0lCRWtXaXpi?=
 =?utf-8?B?Ykc3cE9oUThaWVQrblJxVXBsUzRZUXNyTXdNK093cVBocHJhUlNyOFRYckgv?=
 =?utf-8?B?bXVyVDU0Z0RkRW9Lank4OUJwK2c0QUxzU0J3UUtnR2xVbHVpd1ZYMitGaGRq?=
 =?utf-8?B?N0hKTU8zMCtPb29VMFlXbWc3cTU2aVZGUDB0MEhSNk9aT2tvTFZXdmo3M2FZ?=
 =?utf-8?B?WitDRGFRVDJ2ZnEyRXhaUnFIVHB5blB4NEUvWHM2RHhFVzA1L0NBNzZEdGFs?=
 =?utf-8?B?SnJzTGpYQkhSenNQeVNua1JHeDR2eStNcVJGTmN3S0xIOWJ0S1VKLzVQZVFz?=
 =?utf-8?B?RnIwbmcwK2pVTE13L3dqWTJnNmM1cXBSR1Q3QUZJbW0xUUpzWC8rMk9nU29L?=
 =?utf-8?B?V2hYVkp0VnlHTEFEOUtPWnVoZzgvVWtWNGlacDQyZGxvS3Z3Y0wrRjM4K0lw?=
 =?utf-8?B?cHhHSHFwc1BzY1NNWSt5UWxGTjFHNHYrTDBleFZpVzk5dXlYY29qWFVsaGlP?=
 =?utf-8?B?a0VhN2wzTmJnUndaWjA1QXhOVkJlVCtrRGtwRUcxYU5KU3RaT1UrQkEyTHQy?=
 =?utf-8?B?UkRoV0swRXJTY0w0WnY2TmkwY1JvN0xQZnRPRisvUDljelNTT2dYUGxzMGFY?=
 =?utf-8?B?dEY2aUhjWG9PU2d1TjVvbW5Gb1UwUnhkSHFyWWZHTGV6TzN0d0VkVktkekhv?=
 =?utf-8?B?RStFL1hSZzRHMFBVUGx5WmpaK2ZaU1JxbGxTd3dNU0xjNTllTjhGWkpFRWZk?=
 =?utf-8?B?ZW01L0EyQ3kxVFJZR2JGbk5SRTkxQ09WNUwzSVZ6VmEweVVPWEVDMzNtZnlL?=
 =?utf-8?B?cWlaMkdDWkdIdlc2cXZUQ3FBQ1FaOGR4NFlpaWZtMUtFL044bWgvcVV1aktY?=
 =?utf-8?B?NzRWTk1rY3crc3p4REhqRmNENXUrUEFpSm4xcnJDY1NhSEs3Nk1EYjFKZGw1?=
 =?utf-8?B?bkJwblJTem51V1dPVFlicUIwMWYyYW1kN1BlYjRla1pJSnU4UFNXc3oyYW1o?=
 =?utf-8?B?UitycjdUUWY5YWJNQU9JYWR6NGdnaFhOdVNqYURqQnV6ZTlXdk1pQ0F0YXBv?=
 =?utf-8?B?eFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	iNfKxZrVZt61QlzIb2swTfyLP0KJKe8xKInAE4o1RMZ569tJzdfnKU+0+LCIMh8I+a803sMhtGZSsmgLflieeU3hDTLUPESymUkmkzKZMMo+uOMMY8kWTyW66TlKD6gpaM9J9QRmOfHhh7lFQ6fQN99+MqY/6C0oP5lJTlbZMicTBzjZ/bSfnnYsLSgn0fZ3WvHq7AUqtp0PuFTwekjU3abWYCeE+pVwcrP7wSUc9x5ADy5rHSOPjvtg5kPUzVr0H0Ta4AjD8Njf2gyH8uldXJuLNkFMhfXsjkEEsL3eL3eZKwrN1CsaTASOpSBOj/e8yYTUp+X0JoTuMbK70RsKeevrkUg7p249fi1CZSqmsp46pFocNWkhJkwuWCGA1lbXO+IrPX8kyimZ+visfcjqa7UMgpANVZm3EUBP+lhXdrkyFsXiqbbLBQOoWbFECysb2LfayYNWz3B7Hn3ELg3NPj64M3eWcBVO8eKwvC60TrW3WRePX1tkfmt8VI63carKNR2n0h362RW+kdpqS/15VWV/eu2bt96tuotwwkulIwgTMKWyH8vhbHpYYaKrs5AyMHcoH0EVq01XZYjU7xHaFttzaY7BneK7mb/Kg2cBuOMtIfSmyYk41MBDuzz/rjPxusy896DQ8KUk0LJ0Pd8uMcbSn3WS/PVuyFzqmOXjfGtS8JDRpB6iVyYtc1mnBwkP5gwvYamHlgHYrYl1mVI9Svf9XJdTfdE6D0NOxPY1HXlVZiJNq6IaBHqfsnX4oavAP4ADC7UYpAUMXSGArpqDkkdUcPp8yexJ1A2h3gFkp5ohIBMikrcJLD0vL4n3CiWTSxjnxRCMMw+GAIYUCfvv2w==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b00d7f0-d06a-45da-c114-08dbd55d66bb
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 13:22:13.9245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QbZSDhlqSKAU392p0AMMj+A626ISQJx1Ae9TYBvhQL0DjMYg0xkHOjpwwreTEcmvMBWcfoL4MXditARXhOfOkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7261

On Thu, May 11, 2023 at 02:06:25PM +0200, Jan Beulich wrote:
> Unlike PV, a PVH Dom0 has no sensible way of driving the address and
> page registers correctly, as it would need to translate guest physical
> addresses to host ones. Rather than allowing data corruption to occur
> from e.g. the use of a legacy floppy drive, disallow access altogether.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

