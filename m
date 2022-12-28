Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D347D6587DF
	for <lists+xen-devel@lfdr.de>; Thu, 29 Dec 2022 00:27:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.469591.728974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pAfp1-0003yn-Ov; Wed, 28 Dec 2022 23:26:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 469591.728974; Wed, 28 Dec 2022 23:26:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pAfp1-0003vs-Lv; Wed, 28 Dec 2022 23:26:55 +0000
Received: by outflank-mailman (input) for mailman id 469591;
 Wed, 28 Dec 2022 23:26:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xfAD=42=citrix.com=prvs=354503da8=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pAfp0-0003vm-1M
 for xen-devel@lists.xenproject.org; Wed, 28 Dec 2022 23:26:54 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b0a42fc-8707-11ed-91b6-6bf2151ebd3b;
 Thu, 29 Dec 2022 00:26:52 +0100 (CET)
Received: from mail-dm6nam11lp2173.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Dec 2022 18:26:47 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BY5PR03MB5029.namprd03.prod.outlook.com (2603:10b6:a03:1e2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Wed, 28 Dec
 2022 23:26:45 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5944.016; Wed, 28 Dec 2022
 23:26:45 +0000
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
X-Inumbo-ID: 1b0a42fc-8707-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1672270012;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=QtHSCxox2pSebo+U5GFg5RXuH3h2ocwnkfWBCCf4CFE=;
  b=Df1C+i/1sAyRjXGSO6GMLbPN+Nsuy5dCJl/VH2TDyI2JPVDJiY1V+gxi
   SYgyeApgH36H+mi/OB5Z1ud5IQWkFJhywPyjZKSV4UhBEkoft6KGaaIVH
   fvGFldfaYfWNJFrxKEH97hNnwN2JHwjRHE05eGv8A8VCEUW8soR6OZCYg
   s=;
X-IronPort-RemoteIP: 104.47.57.173
X-IronPort-MID: 89353970
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:2MkeaqoHyN5YtVxM9OyiTmwGe6JeBmL7ZBIvgKrLsJaIsI4StFCzt
 garIBmBP6rbZGD1LdFxYIW28BxS7JbdmN8xSApr+CBjRX9E9JuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpAFc+E0/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06W1wUmAWP6gR5gaEzSlNV/rzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAHMuQxeTje+w+umca+xUneksKuD1HoxK7xmMzRmBZRonabbqZvyToPN9gnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeeraYWOEjCJbZw9ckKwj
 2TK5WnmRDodM8SS02Gt+XOwnO7f2yj8Xer+EZXop6U32wzMngT/DjUIVUOlpb6hh3WkdOJ0A
 XNL5zopvLU9oRnDot7VGkfQTGS/lhkYVtlLEux86xyXzaHU4AGxCW0NTzoHY9sj3OcmSDpv2
 lKXktfBAT10rKbTWX+b7q2Trz65JW4SN2BqTTQfUQIP7t3noYcyphHCVNBuFOiylNKdMT7xy
 jaOsSM3r68Sk8kQ1qOwu1vAhlqErZHTQgk4zg7eRG6i40VyY4vNWmCzwV3S7PIFIIPHSFCE5
 SEAg5LHs7tICoyRniuQRulLBKuu+/uOLDzbhxhoAoUl8DOuvXWkeOi8/Q1DGaugCe5cEReBX
 aMZkVk5CEN7VJdyUZJKXg==
IronPort-HdrOrdr: A9a23:0AAiDaBd0qFHFr7lHenL55DYdb4zR+YMi2TDtnoRdfU7SKalfq
 yV8cjztiWbtN9yYh0dcLm7UcHqfZq2z/FICU17B8bAYOEg01HJEL1f
X-IronPort-AV: E=Sophos;i="5.96,282,1665460800"; 
   d="scan'208";a="89353970"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HDzhkaeANM5BV1pyl688sCKaiDK3VOUXnDQmG2PyYfo+3zCtFHjWE8pUfeIR2pV6+nkDgU775e1lpyVtA2IfpYTA8VyDbMUsV1rCN3XYrysPY09/Wti621dlrTE/2M9xPJTGRfNdWDBKhNdxcdSNDXwEzw55T2uHxPG/htP5jvA6UyRi33t5PLA79wAGK58sPDaj17gq08/YJc3pmQsd278LKkYH4nbOVh0YQTGQe5f9oFQVn2a9/72R2ARC6WJzgrYeckkZiV5nigfiyQdO+db1rXioyAIuI+KyRTda+Mn3V4GpRHPKCaJrtfhbVqMam3qqWWEPEp0Pm3C16s/mAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QtHSCxox2pSebo+U5GFg5RXuH3h2ocwnkfWBCCf4CFE=;
 b=SzCTZl4IRGJImt6xltzn0LA2/+Ple/Byh9AqYjkt2BWVG649UxtN5t512HjGydNXO9C6SlYzxCriWEVe5F3O7++UYDucTwQ+/SOsQuTKHNbNl0tzaAB9mAI0mLB7PKZjYI9fsQf96gRbjxtEfUZz0F9gBCryMRniD600IfvUdXLt+8sple+mgopnvF5c268W2gO2IhRk16AYxCnQs6Oi+E591Sb9UYS/0IolzpROISh9rpcyjJ4nEfDTFo9RhXI4MDlZczcbPK7mI/LVHVBx6asBlMba/efJ/ghAjrA67FBfrAU1NAYo9xNMwzeYWmdG8oZkZasfNIaf8PhPjahcgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QtHSCxox2pSebo+U5GFg5RXuH3h2ocwnkfWBCCf4CFE=;
 b=AD2nN6oc7UqI+HKbST1f4QZB9VFRPHnm5zw6oAgGVAmIm9pcITG1OqKc3TLQW1R1xzdnBathR1siReUwXzZZ2ujP7CYxyoQna/ZX+ndr1B/D+bZfP1PcbGRyW+HM5SrnwAM/bjKEGplFEOvgjsgpUTpLUUHyElW23ZPz8Ns04jc=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida
	<gianluca@rivosinc.com>, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH v1 3/4] automation: add python3 package for
 riscv64.dockerfile
Thread-Topic: [XEN PATCH v1 3/4] automation: add python3 package for
 riscv64.dockerfile
Thread-Index: AQHZFsAO4W4uDI5cTkyDumFs2/flgK6D+jEA
Date: Wed, 28 Dec 2022 23:26:45 +0000
Message-ID: <24efc48f-5149-b055-7178-d21dae999f02@citrix.com>
References: <cover.1671789736.git.oleksii.kurochko@gmail.com>
 <55e2c865a0c2ab3ef405c427c0b1bcaf0abff2ab.1671789736.git.oleksii.kurochko@gmail.com>
In-Reply-To:
 <55e2c865a0c2ab3ef405c427c0b1bcaf0abff2ab.1671789736.git.oleksii.kurochko@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|BY5PR03MB5029:EE_
x-ms-office365-filtering-correlation-id: c7e0a599-16c3-41e9-90e9-08dae92afc18
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 qhYfYToLqhMdfUJ7pra7i46mrkd6QPNKZH3VqgAexhmR74MNXctwJy7np8OmE4FKoefriGQyMxtHCpm3NOI+i0E60Q1zo6UNNmi0fqvfp4udcjhgAZMDfh5vTqifUpLyFbx6vp2gl42aeJ2FxN/mvBDdA6zFoUADij6LB8HzoivVXO37rzquoE26E3598hM2EBgKGdIwhwTGi9o2LmW6OIhwDQ4SHVFf09Cvvg6jGkBwucxhIMsttvd/NhC/ozTu5ySdzl6y2mXwQBvPCL9HQV5QuUn+fyXckeOGHpGCBOYPSbNWFGvJ/XzxCJXA9QdpGfhG4JxZzvVsHG6PnDt76wrAXDqYjMfyfNogX/uKVFtywbsa5chPAJZoN9x8Q5IS22Fh03PMFvPyvX59UFPHnS61TKDRLuaGeChmH4nBfWa2zHw2dYO39SZFXNcpQFFm2eQfoEpfNqlftQVPSuKFSwvTWLEXW/q20f4rZPMxlOnxWc2QvCWyZeREMZL2awUCwRM/vCjSP77R56cUifv0QP/56AZghn8+7Cbjqafohx5cUjK4+Y00WOGBNnGA9eRz682u133UtjiHm6eMeZVpcO3yr75mUYCpHycGdDLTQrBaWYs5AEEZumoBkn/ATpYWK0+LRD8gKG4ZgUBeSudqS2EvUonBXPxgiyvykWoGBp3gLOCkkvyOJmek7Ys2zNiw5tgBrhNnCZm2bFWtk0z75GulrsBpHHgb89I3JUh5ZTiaMwLuKXUe0MBHeXTv28lW2lHQ4ENejpFHlr8AiPCV2w==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(39860400002)(136003)(346002)(366004)(451199015)(2906002)(4744005)(54906003)(110136005)(5660300002)(8936002)(2616005)(76116006)(38070700005)(41300700001)(122000001)(6486002)(478600001)(31686004)(26005)(53546011)(186003)(71200400001)(91956017)(8676002)(4326008)(64756008)(38100700002)(36756003)(66946007)(66556008)(66476007)(66446008)(316002)(86362001)(6512007)(6506007)(31696002)(82960400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T2dvYnQxL3BiZHBVeWxnSnl2a2orakwwbnk5QlM5cE1JR2d2VDZHOGxEWUR0?=
 =?utf-8?B?WmVSQy9DaE4xdjJ1WGVoUnhOR1VUZjY4RHBPejFockExa1J2Y0pzRlIwMUVj?=
 =?utf-8?B?S3o4Q3JxZTBuMDhra25CRkNjaTVua0M5amRneDFXdE5yS1Y0aGxjVmlCbUYy?=
 =?utf-8?B?SCt3dzFMSU5XUmdGSjBEbVM1clVOVnZmQ280dHA5VTc1VkZ3eFlkbjFYVDNl?=
 =?utf-8?B?NWNaalVhQlliQ1VvWS90Ri9kYWpmeVhSaW1UVGRhNkxpeTRQYStrUU9EeWVW?=
 =?utf-8?B?bk4rUmxjRWY3YnJOMGxvY3ZPT1hHZ3VVRzZRWG1sMmNoa201TjBQbW9lSGhW?=
 =?utf-8?B?OVg3RVFvQ0t4eE9iT3d0Z0ZldmNmS0d4N0tlTWpwZXNGM281am9CRUZCT0xT?=
 =?utf-8?B?M1g5N0kxTU93MkdodldPNnZNejJ6d3MvaFhNZEkyR1VzR0VsVDhrYjJVaUw3?=
 =?utf-8?B?dmw2VnVLT3puL1d5QnhLWlhseDhOOFlKN1psem9GalpOM2lUVS9ZREptUC9N?=
 =?utf-8?B?cGFFSkFuUnczd0UxRG9DUW9QeFdsWnZNMmNkbVE3ZUFQMkZhbHdRVmdZeTBU?=
 =?utf-8?B?bnljUDNFWHhyVVpFWXBuZmczNHlhb2VzZXBwMXJqbk1ROUtsMUFKVTZQWG8x?=
 =?utf-8?B?YmUzRUJjYnZOZ2xrdnNucG0zU1Q5T1BXYTZtM2FOaHRvWEp1Y01pbmtTQnlX?=
 =?utf-8?B?Zmxqd082eE4wNkhvRVAzOHhlb3FYS2RFLzNZUUNLVVpQelRUTm9YRXZwZkF2?=
 =?utf-8?B?dTRSUnVLbGVPUys0Y21xRTdjWU05RGVCVDVwM0FPQm5Eak9XSDdaMnVvUW8z?=
 =?utf-8?B?WTZYVE93eDQzb0VKUUhoUDc0T3hkeHprb1oyNlBvU1IyT1BQODRzYkN5aDdT?=
 =?utf-8?B?ak11NmE5NWpxS1F4Z3lRSk80d2hCOWg5SnRXdFR0eGs4a2lNRWh6VXNheHo3?=
 =?utf-8?B?VFlJeHRtMVNNUm83VElZS2Y1Nlh4eHd4SVIzWjJwSGRjSm9yRVlhbE1TbnA2?=
 =?utf-8?B?cWlmaS9sMlRIUGg3L0NlYUtzcmhyeUhMRjFCai9DQlFQTk53THM3U2IrVDRr?=
 =?utf-8?B?M3FlNHpQNlFtOUgvZVBpSXZ3bU05L1kwQkR2cUhLdzBkdHZhc2tZVlNCWmpW?=
 =?utf-8?B?STZzNVg3ZWo0M2J3NUtGNHNSdktJMW5KcThZVW5TVU5hSWdDRmRpcnp5dkJ6?=
 =?utf-8?B?WTQ2U2xPNGV5VGw0ZnhpZXlseDNCanRXdWY0bURvMnJWbUV2a3puQm16QUNF?=
 =?utf-8?B?UlJWSzdnUlZobTlnc0daNEthcDdLMnV0MzNSWUQ4aTNSOVVrenVsR1pXdlBN?=
 =?utf-8?B?bXlNMVVEcUpEWExnZVg3aTZpcUhQaEhZb1A1dlhsOUFBb1VVK05tbjRnZlFH?=
 =?utf-8?B?ZGZBZDlBRzhyckdDbWFPSzJiM0hQZFRKTktRN3VYdldwaXo2d3ZiREJKUTFO?=
 =?utf-8?B?QUNMbUZLRDE0bFFvZHB1QkY5S2pGaHNxSEVMUGhHMlV3cGdjVE9wK1FYd08z?=
 =?utf-8?B?aHNhOG9vUmNUdEJuTEdNT3ZBMUhxeW9md1dDSjdyeis1TjdleVB1SjJuOE1O?=
 =?utf-8?B?T2psSlFtd0FIQitub2RHUnp2NXU5ODZOM2U1N0M3VXFDcHZKUkRhdnFEOEZi?=
 =?utf-8?B?SnhVNndmVUJxcEp5YWFxQnB1dWd4R2h0R0ViZ0g5cWRMNzdtTWJEa2tVVE5j?=
 =?utf-8?B?Q3ByeTJUUlZaODFuQTNaazBoSHhmcEhjTmt4N2RIdFBLQ0lhd3VOeEFXWi84?=
 =?utf-8?B?akxZQjFEdVVsRnlVOGUvMHFkODJKa3FFNkpwbkUxODhhcTFVK2JudWxYbVcy?=
 =?utf-8?B?RjMzSHRvT1c4d3NKRnI4czdabFpMTlVhUTVldTg3bjlXdFdYNmp6S0xuc0Fx?=
 =?utf-8?B?OWwzeEdSTGs2ZUk0ZnV2aE1qRjlqdi9UOGJhZkEyb2pDQWtIWkNhc1hVclll?=
 =?utf-8?B?Wlo5cTBaSHVxNEVocStjVGRTREZEeC9VTXNBczhKVVBiRk1RMDVtWDhDUU5h?=
 =?utf-8?B?aEZtRmh2WHk3dHVOdEZCZUhZekx4RHBqYTRiN0tEUVdacm54U1RycGZGNVVt?=
 =?utf-8?B?N25YdzZwVFVYQWxkbVphcjQrUjV0NXhLUjd4WXcyeWU1K1JXYk5SZFE1Rnh2?=
 =?utf-8?Q?+ZLCwpAwJUVBUkqNnXTFjDyr7?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7F616586066CC94B9110C54D0F6D841D@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7e0a599-16c3-41e9-90e9-08dae92afc18
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Dec 2022 23:26:45.3244
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k27itoTWl/j26xBWUdZCw8/1QwS2+id74HSXD+4W+g3OCzmtHgTsoNwAaQA6ZanzM9vQ4SrNUkc0eoB5XeLbkl/LJIXCsOYCiZ35nspigu4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5029

T24gMjMvMTIvMjAyMiAxMToxNiBhbSwgT2xla3NpaSBLdXJvY2hrbyB3cm90ZToNCj4gUHlodG9u
MyBwYWNrYWdlIGlzIHJlcXVpdGVkIGJ5IGF1dG9tYXRpb24vc2NyaXB0cy9idWlsZA0KPiBzY3Jp
cHQgc28gaXQgc2hvdWQgYmUgaW5zdGFsbGVkIHRvIHJpc2N2NjQgZG9ja2VyIGltYWdlDQoNCklz
IGl0P8KgIFRoaXMgc2VyaWVzIHJ1bnMgZmluZSB3aXRob3V0IGl0Lg0KDQpXaGVuIHdlIGdldCBh
cm91bmQgdG8gY29tcGlsaW5nIHVzZXJzcGFjZSwgdGhlbiB3ZSBkbyBuZWVkIGEgcHl0aG9uDQpp
bnRlcnByZXRlciBmb3IgdGhlIGJ1aWxkLCBidXQgd2UgbmVlZCBhIGxvYWQgb2Ygb3RoZXIgdGhp
bmdzIHRvby4NCg0KfkFuZHJldw0K

