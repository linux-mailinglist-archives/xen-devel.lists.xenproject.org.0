Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDD6637B61
	for <lists+xen-devel@lfdr.de>; Thu, 24 Nov 2022 15:24:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447964.704651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyD8i-0000h7-LV; Thu, 24 Nov 2022 14:23:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447964.704651; Thu, 24 Nov 2022 14:23:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyD8i-0000eI-IR; Thu, 24 Nov 2022 14:23:44 +0000
Received: by outflank-mailman (input) for mailman id 447964;
 Thu, 24 Nov 2022 14:23:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DMEk=3Y=citrix.com=prvs=3204ad463=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1oyD8g-0000eC-Hf
 for xen-devel@lists.xenproject.org; Thu, 24 Nov 2022 14:23:42 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9738deb6-6c03-11ed-91b6-6bf2151ebd3b;
 Thu, 24 Nov 2022 15:23:41 +0100 (CET)
Received: from mail-mw2nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Nov 2022 09:23:38 -0500
Received: from DM6PR03MB4172.namprd03.prod.outlook.com (2603:10b6:5:5c::23) by
 CO1PR03MB5921.namprd03.prod.outlook.com (2603:10b6:303:96::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5857.19; Thu, 24 Nov 2022 14:23:36 +0000
Received: from DM6PR03MB4172.namprd03.prod.outlook.com
 ([fe80::bca9:6c1e:de4c:fa22]) by DM6PR03MB4172.namprd03.prod.outlook.com
 ([fe80::bca9:6c1e:de4c:fa22%5]) with mapi id 15.20.5834.015; Thu, 24 Nov 2022
 14:23:36 +0000
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
X-Inumbo-ID: 9738deb6-6c03-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669299820;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=MLitRt+OuYVvU+Z7wTGEFQj1aYGeuFAmjUJxA23086w=;
  b=Ig2uGTW0l2SokY3M7eTouC2uYexiQZcSzmUJGcD7n0zR/kSKkOSV4UIh
   NiQon8OfYSFPZEbqkpy3QaLYnHpy/KYs7joOaJtKOoTdTNym6ZsBEO5m7
   Uvt0gNoIEhx1SWfuijs2GSzWJx+JypHKzPxAJ7Aar06e6THd63fyUOggl
   s=;
X-IronPort-RemoteIP: 104.47.55.100
X-IronPort-MID: 85919966
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:tBX7Gqki8XmNwpmaUQ225fHo5gyfJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIfUDqAPamDM2ukeIonOoq0o0kE78LdmtdnHAI4rCtgRCMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icf3grHmeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aqaVA8w5ARkP6kS5gOGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 aMbN29XXDKRvOX1+pzgdMZstOFyMvC+aevzulk4pd3YJdAPZMmbBoD1v5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVE3ieC1WDbWUoXiqcF9lUaCp
 3na/m3/RBUbMtCexhKO8262h/+JliT+MG4XPO3lp6c70QPNroAVIDwdZVjrmueCsW+jed9/F
 WI62QUs9bdnoSRHSfG4BXVUukWsrhMaHtZdDeA+wAWM0bbPpRaUAHAeSTxMY8Bgs9U5LRQm3
 0GEt8nkDjtutPuSU331y1uPhTa7OCxQKHBYYyYBFFMB+4O6+Nl1iQ/TRNF+FqLzlsfyBTz73
 zGNqm45mqkXiskIka68+Dgrng6Rm3QAdSZtji2/Y45vxl8RiFKND2Bw1WXm0A==
IronPort-HdrOrdr: A9a23:m3m406m+2fqVr995BXutPu9yPPzpDfMEiWdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcIi7SdK9qXO1z+8X3WGIVY3SETUOy1HYVr2KirGSjwEIeheOvNK1sJ
 0NT0EQMqyWMbEXt6fHCUyDYq4dKbq8ge+VbIXlvhFQpGhRAskOgTuRSDzra3GeLzM2Z6bRYa
 Dsgvav0ADQHEj/AP7aOlA1G8z44/HbnpPvZhALQzYh9Qm1lDutrJLqDhSC2R8acjVXhZMv63
 LMnQDV7riq96jT8G6c60bjq7Bt3PfxwNpKA8KBzuATNzXXkw6tIKhxRrGYuzgxgee3rHInis
 PFrRsMN9l6r1nRYma2ix3w3BSI6kdh11bSjXujxVfzq83wQzw3T+Bbg5hCTxff4008+Plhza
 NixQuixtlqJCKFuB64y8nDVhlsmEbxi2Eli/Qvg3tWVpZbQKNNrLYY4FheHP47bWDHAcEcYa
 xT5fPnlbFrmGChHjbkV65UsYWRt0EIb1O7q445y5SoOnZt7StEJgAjtbEidz87he4Aot9/lq
 T52+1T5c9zZ95TYqRnCOgbR8yrTmTLXBLXKWqXZU/qDacdJhv22tfKCCVc3pDURHUk9upEpH
 36aiIviUciP0b1TcGe1pxC9R7ABG27QDT208lbo5x0oKf1SrbnOTCKDAlGqbrqn9wPRsnAH/
 qjMpNfBPHuaWPoBIZSxgX7H51fM2MXXsEZsssyH1iOvsXIIIv3sfGzSoeaGJP9VTI/Hm/vCH
 oKWzb+YM1G80CwQ3f9xAPcXnv8E3aPia6Y0JKqitT75LJ9RbGk6DJl+GhRzvv7WQFqo+gxYF
 Z0Jq/hn+eyuXS2lFy4nVlUBg==
X-IronPort-AV: E=Sophos;i="5.96,190,1665460800"; 
   d="scan'208";a="85919966"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jxLd5Pea8YYJHmZBh3OAeag9hqgSSY/alxnYaz5JslQ3iZFr2SAaCkjV5+HnmNSxY361vqkuE7JOsjWS0W07g1fxCIbqy0B/qopqSR+ItKKk9d8FVTdPIxOaBVTZoIgkPJjOzVQWq8ceWSsWzp4pmjj+CU1NFBL6t34iNJvJvLbYi8lKFQc2QAUHA6C8ILFu+93oybU9KgsMnraQU2LyBx9hPrcE96lzZSfzeRH67j35zYyp7z1InFBorYEJfLC35nv/W8I7J9DqaNuDkOmN157yfrznJ7+1gL16b2qXN0O2/4THQNpZYmYFXojuVsD4A6Pa5umtlQ5Ufh4/h9K6lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MLitRt+OuYVvU+Z7wTGEFQj1aYGeuFAmjUJxA23086w=;
 b=hwKOYYgeHCYLdmUbGzD/T5NfsE2wFWbcsMg84peK0OIKmQAP7UIsDWFOS/PgObkMCcadisE/gbMp8VEQYYQu234i0to76feWNI5aJKz7PTwg8oBD3aEwg5jU0lGr6NoMReAuAzy+vRmiHXqim652cEAUcq5pb9jDfzt50Lsz+6VaD7j/FYlTG4VaM+8eauJ7LxE8CJhTFvcXWsRZL0BZdl2CUDmCS0EbJB7/zty7UK/WottMdiEzB1yHIs+j5aoHuLinL1BvOQypDVcfxaCB+R52jD0z4fEKyt52Os2vZCD1oPconnV3bBV01gfYzb8bGZN7HZTA+9PXMpQtxiYVjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MLitRt+OuYVvU+Z7wTGEFQj1aYGeuFAmjUJxA23086w=;
 b=WlclwvtIRagBbfdAGVLB7KInVjHebLgXIECjHUgEC7x+5UhsQAW4e5PcNZBFs3IENG4zX6RgMcTDVNPElEw4tRI1LZ7MBkSbWOcgMkUBVzYvvJwe+TnL1DB88G3cO/wgMYTzuxC2F156qUNVgXGayby7SjCW14EtZ3U89OiXOgo=
From: Christian Lindig <christian.lindig@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Edwin Torok <edvin.torok@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, David Scott <dave@recoil.org>, Rob Hoes
	<Rob.Hoes@citrix.com>
Subject: Re: [PATCH] tools/ocaml/xenctrl: OCaml 5 support, fix use-after-free
Thread-Topic: [PATCH] tools/ocaml/xenctrl: OCaml 5 support, fix use-after-free
Thread-Index: AQHY/4p+D/wPMbQAQkGOEHU/y0ZpLq5NyDSAgABOF4CAAAXGgIAAAqyAgAAC2oA=
Date: Thu, 24 Nov 2022 14:23:36 +0000
Message-ID: <212D2A4B-9921-4072-8A1A-FCB111251E49@citrix.com>
References: <20221123222517.12140-1-andrew.cooper3@citrix.com>
 <D28C9584-F900-479E-AD23-64B8CEB879B2@citrix.com>
 <a49b5770-fc6f-0044-8e03-7162996257bd@citrix.com>
 <B682A627-4DD1-4D4E-8DBE-4503B53DFC9C@citrix.com>
 <d40fb83d-309e-ed4d-8ee3-443e472bcdcf@citrix.com>
In-Reply-To: <d40fb83d-309e-ed4d-8ee3-443e472bcdcf@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR03MB4172:EE_|CO1PR03MB5921:EE_
x-ms-office365-filtering-correlation-id: e3a590b8-cb62-4fdf-4b15-08dace2779ad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 qfjBNWF6leipdqHYKdmluurDJzvBvA7Bjc02DHIO/b0qeyeGBHv2Ytt7aoSEwZyg2BZTQIXW9LLxlxH+5Ekq6iwu9XieHNwPkmyEYjtG3jC9jU76Ht9VBlNHXBxexIkvYEDuT8vnjcE9f4XjF4tIDImJ2DgiYAnONhrX1EX2R0Qd4gZBSrOZlGxOklRvLRslFN61tEV/g+hMLYiCl9ymyW5XZrqtq66iTHPQx8u3IYCIGUrVBvgVGm5S3FMMUTssTrLGFU5NlAt8X7zrXRp31E70/cORvZgh4OEOdpSTssWKEQnA39fGHnNRRWh0SkufbAnt91hO9GyxCMJh4qhzSph2nQM0i2PkDMZlGMHtqaN3fokxV2c31wb6Xgdxp/h+49ajO0zPAc9009WN5JxFT7WxuLnx86RgnShkf3LBWZ3plKHadHgWamtxYyglXxIXcsXavnM1be+m3Ie3IxeIonjMLxbCMNCUEaXqN1TYwvcf/R4qp7cdrYYqcv9OMeBLX97S5Ox5N1qm8uirIsIgKb5F0O4kCAO3Y4YghlBsJoo4czO8lbB+Fn63YUqJHXRJioQwyt4lcuhI6duryOAwqvGw03LuL/z/zq6L9n/wqq5hWE+iflbMlzuWjaMctJLRB4c+ucR7JS/HSc8m2zveYhRjv81Hqo/Cg+eMObiUYTiwwZAbUa5grzSkf4CoakF6+Bwf+RSfizh1YGk5jqQrqena1Jf2/O5hoNgt6YegCyE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB4172.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(366004)(376002)(396003)(346002)(451199015)(36756003)(2616005)(41300700001)(5660300002)(2906002)(6862004)(44832011)(8936002)(186003)(38100700002)(33656002)(86362001)(122000001)(38070700005)(82960400001)(53546011)(6506007)(6512007)(26005)(6636002)(37006003)(6486002)(316002)(107886003)(54906003)(71200400001)(91956017)(4326008)(64756008)(66446008)(478600001)(66556008)(66476007)(76116006)(66946007)(8676002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QnhLZUh1MUNKTmJ4MW40RjUwY3dIWi93azFMRzdmQmFrU2lxSThneUxMMGlO?=
 =?utf-8?B?N0hTOVQreUZ2dlVuZ1ZiVzVWdnhScFllTEhETlQrVmkzRm9YeXJGaStYNGdP?=
 =?utf-8?B?dFpjTXh1aDRoSWc1RXJiR0ZOMkltc1pzYXNaaFdyMlpVV0h6aEdFTUNaWDg0?=
 =?utf-8?B?MEdTRko4RUwvbzMzeGd3cHRGUUJ0SGpvdmxBQmRUc1NlekRCcnJrN05VZTZt?=
 =?utf-8?B?MldkWDc2T3ErM1BsVUdNWGxXVU9PVU1TRFcvTSt1bXhUS1lXZnoraVdDOURs?=
 =?utf-8?B?c091VlF0dWxHR2V4eHZyK3VoMlJncXBWMGF6SnhzbEJ3ejB0NmgvTVRjY3hZ?=
 =?utf-8?B?UTBMTDVPOXlhYUVtR2FuQ0JIbFMyN2YxZ0hHVkJRVHpkcnlUQUdLYWVWMUM2?=
 =?utf-8?B?TkQ3Z2dXNGVpYjdhRDRvSjRBdkpzbDdZTGs2RHI1ajkzTlJZRDkzYnl4QW9p?=
 =?utf-8?B?QVZ0L2l1OTVOQmVEUENpR01DSDUvTEZrQTFDWGRRZTE2eFVNbFVhNEsyWDJJ?=
 =?utf-8?B?RFFoc3dmUlI2bUZpU1JwWUxEdWNKRytISGxkOUpiV3JRbnJaVlgrWmx0MWNn?=
 =?utf-8?B?MWQ5TnhsL2tXNFVpZFZpOERhd0lCZ0dQaUdId2FjYmVWd0Z3clZZbHlaRG1J?=
 =?utf-8?B?LzlxMFBQVlQrUzdHdGh4Zkdrb3lNcFQ5dU9CcmZJdlhEV0JMeXM5SENhdnZK?=
 =?utf-8?B?NnNnSHdsaU9SeFRiTnpETlVET1k3OHJHdlJvV2crYWpmSkJqQUl6YzYxSS9W?=
 =?utf-8?B?NjdBVlF0NitsY0I5dFJCVWRpa2JlRDJJTWFaaVFubmdkb3lmZ2ZzVkxxa2tj?=
 =?utf-8?B?RWV2elp1Vk1td1lTaHE5Y1dzNTJjNk55bGVDQkQvcjBSVXZZSmcyeG1tNHVn?=
 =?utf-8?B?YmlaelF1aHBjeHJFUU93My9tQmVQbVhSdDhNNDVKSUpDVE9reTM1bGhaNlNS?=
 =?utf-8?B?NE92ZTh0RjRFOVBmMzlzZ0FNOVZuWDVvUDBnc1NaL1QyU0FNa05odUhrNk1T?=
 =?utf-8?B?VkRUaTZmbDlMQ3NEcGJXZlVnU0RFaVpwNGV3eGtBbGs3UUVVR0NJWTNSQ1RG?=
 =?utf-8?B?ZXNaUkErRjQrODBGdjQxTDFYK2xYKy9nMjRCb3ArQkpnRTBMc0ZleWtyT1k3?=
 =?utf-8?B?cy91VTd4OVpsTVpuUmZnQUJ2SWFzTEJ4VWtHRkk1TTNsT21BQjdwVHp0Y3hv?=
 =?utf-8?B?OWNDemxTemJrQjlYQTdMaHJtUGFyVkdJcW9OZFhLZUJvNEF3UFFqVlVnMXF0?=
 =?utf-8?B?UmlvYW9od1pXTzV3Z2NuaVRSRUFhTEpwOEZpUWZSckowMkpXaHRabGcwQjRQ?=
 =?utf-8?B?a21DUnRoaTFIVnNtTUZBYjN0bFlZL2xzVUJVd0RaaFEwaFdFVlhSMGJ1RXR1?=
 =?utf-8?B?N0lPVS9HamxlVUpIQUtHUFBkTElZN2ZmUkVzMEtNaVhZRFlzbVBINDhIMlQw?=
 =?utf-8?B?bEFSNTYrdFVYeFRSNzdna1hBa2Y2UyswWHdJa1dibmF1aHJET09oWWdiN29t?=
 =?utf-8?B?Rk14SmFEbXg4QVNaUzNFSGVNbnFKUUdmV1ZSZDRsYVl4NFhDdCt5WTlPNXgy?=
 =?utf-8?B?YlFYcmJBeHZWSVI1aEVPc1lIOTNHaTJoanZDdFBuTWJncm1pT2Y0Q0UzZ1ZP?=
 =?utf-8?B?TVNtTHB1ajYzd3V0R0t4aUM1RWEyYzNyM0cyVkhsOUhYWkV2UDFIOS92bGxX?=
 =?utf-8?B?dnd0azJpd1BYbmRQcVN4RTFPZFMySDd1dVRxekZrUHhLNnJPQlBSUFp1dHFl?=
 =?utf-8?B?aWRNcUIvaHdTejk0S1FrRkN1YVpZMmxjVHgweUpKcTBYRlEzYytFcWpGZS9R?=
 =?utf-8?B?aVRpb05NVDl4Wk9BVFhvY0hwOFRhSTNkY2tOSXc5WFNBdDVvZk0zb1NaRWhW?=
 =?utf-8?B?cTluWXFTY3F2Nms5NWxJWkhJMDN2RitFMXRpcG1iMWhjYUtUSHdPSXNXbmgy?=
 =?utf-8?B?ZE1DWEJQTFhSaUEveTA4YnI5Y1ZnQ0Yya3pXWUV3NzRPSUkwVldoLzB2aGNW?=
 =?utf-8?B?bVNGaFBuUlplUEhIYW1BU1ZWbVhkYzdJRHpSMlJBVXJYVjhlTWhZWHNkbmZH?=
 =?utf-8?B?VFNKcG5LYi83OW5PdXF1VXUzcWdaTEVmMDBIMllwU2ZSQlgyNEorL3JHTDBI?=
 =?utf-8?B?anJ1VW9UM2xCSHhXRkhjazFEemNOd1JoTTcrZTdaR2kvYmtjTGltOW5qLzVp?=
 =?utf-8?Q?qE9syFjVnqK48Cmrn7Q63Z4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <36ADA589759F0B4397A58C3995A6F497@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	TKEwl1gRqkxX1e+zi1G3MMTBofRWnZIeErIeuxflImX2LYRjX3cLY75ykcUoM6KrnuXa1PwgII4vvdk/SIfxxhfq0b1fEiY1M72Tcinsx788S0uW/kFSGQaAdQiobZfs0QsMDdJhXDBCRmtzcPGthqi3ucA6VREO4eLwzzR/gFKvgX/zCaUR5bIj8MZ88UpaUqkusXJCEJylonS+d4HjZc780vKk17x94qt1lyNGmKeRocaBhOnD2U+BjA/l2N929ANWa8cI4RkQ0AYjLYzgYmnYdbahRCMOQygGHyyz5JGQ0+7HAKFnAv1V8yND4QGzz1iWI+3SBacZ/SiJ7FAhTr387GlStQVaGZZM62MLm+rsEHoskrg5qI2LYVHV+YdymP8Q7rqmfwrNISBdmWInupjGolK8m2W2EOfr9T0q6tyjO3JIaQinNlhD1G/iEby0Rd6grhyohdC9PC0d9tasLzs4ooiDZWCGIPnURN/HnzseyzjI0uiW+i2eOhmCiJ+PUvpKPbm3b3zw9gbqRdmfxBSWcj7/ZoU0Gs+8cgLUwUW1WoaQsRQW0hpP9UV7V3VySwzmg2Bkgktj8QMqrMaeepXZI9TdK/qegD/kTe5DLXPFrXVRAp9pkjxRD9p2jSxKWqXoPoa3lCsRzNSVeDyOVYlTOpPs675upovaWA3pqyja8laa3z8oDhPaDhaShuFoQOCbktZJ2pEANRIpv0yWMbFzFQu42+EqRaQ1pBEPiP78EwLFC/GZzZmlMcEcQLFcHIv+gcX3tIXFjzAQRhBTcudZpB7pckwEuY90uo32nEGRxOTakR/kohmQM4KMjh7b
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4172.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3a590b8-cb62-4fdf-4b15-08dace2779ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2022 14:23:36.6324
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K0VkZ0yWFIXTt1gvVSDsAMafiaVNxFo2BJq1yG2S5sIcsQnhMlq9yzFeC9EYA9tUK+FCunzSf7Fwj1y5JCktqyPfbyKc58nsv4RWuc67z+A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5921

DQoNCj4gT24gMjQgTm92IDIwMjIsIGF0IDE0OjEzLCBBbmRyZXcgQ29vcGVyIDxBbmRyZXcuQ29v
cGVyM0BjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IE9uIDI0LzExLzIwMjIgMTQ6MDMsIEVkd2lu
IFRvcm9rIHdyb3RlOg0KPj4gDQo+Pj4gT24gMjQgTm92IDIwMjIsIGF0IDEzOjQzLCBBbmRyZXcg
Q29vcGVyIDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToNCj4+PiANCj4+PiBPbiAy
NC8xMS8yMDIyIDA5OjAzLCBFZHdpbiBUb3JvayB3cm90ZToNCj4+IFBlcmhhcHMgYSBjb21wcm9t
aXNlIGJldHdlZW4gdGhlIDIgZXh0cmVtZXMgd291bGQgYmUgZm9yIHhlbm9wc2QgdG8gb3BlbiBh
bmQgaGF2ZSBpdHMgb3duIHhlbmN0cmwgaGFuZGxlLCBldmVuIGlmIHRoYXQgbGVhZHMgdG8gc29t
ZSBjb2RlIGR1cGxpY2F0aW9uLCBpdCB3b3VsZCBhdCBsZWFzdCBub3QgcmVseSBvbiBhbiB1bmRv
Y3VtZW50ZWQgYW5kIHVuc3RhYmxlIGludGVybmFsIGRldGFpbCBvZiBhbiBhbHJlYWR5IHVuc3Rh
YmxlIEFCSS4gQW5kIHRoYXQgd291bGQgc3RpbGwgYWxsb3cgeGVub3BzZCB0byBleHRlbmQgeGVu
Y3RybCB3aXRoIGJpbmRpbmdzIHRoYXQgYXJlIG5vdCAoeWV0KSBwcmVzZW50IGluIFhlbi4NCj4+
IFdoYXQgZG8geW91IHRoaW5rPw0KPiANCj4gTWFueSBvZiB0aGVzZSBwcm9ibGVtcyB3aWxsIGRp
c2FwcGVhciB3aXRoIGEgc3RhYmxlIHRvb2xzIGludGVyZmFjZS4gDQo+IEJ1dCB5ZXMsIGluIHRo
ZSBzaG9ydCB0ZXJtLCB4Y2V4dCBvcGVuaW5nIGl0cyBvd24gaGFuZGxlIHdvdWxkDQo+IGRlZmlu
aXRlbHkgaW1wcm92ZSB0aGluZ3MgYnkga2VlcGluZyB0aGUgdHdvIHNldHMgb2YgYmluZGluZ3Mg
c2VwYXJhdGUuDQo+IA0KPiB+QW5kcmV3DQoNCkFja2VkLWJ5OiBDaHJpc3RpYW4gTGluZGlnIDxj
aHJpc3RpYW4ubGluZGlnQGNpdHJpeC5jb20+DQoNCkkgYWdyZWUgd2l0aCB0aGlzIGFwcHJvYWNo
LiBXZSB3YW50IHRvIGtlZXAgdGhlIGZyaWN0aW9uIGxvdyBidXQgbm90IGhhdmluZyB0byBjb29y
ZGluYXRlIHJlbGVhc2VzIGFuZCByZS1jb21waWxhdGlvbi4gQ2hhbmdlcyBpbiB4ZW5vcHNkIGFy
ZSBwdWJsaWMgZm9yIGFueW9uZSBjdXJpb3VzIGFuZCBjb3VsZCBiZSB1cHN0cmVhbWVkIHRvIFhl
biBsYXRlci4NCg0K4oCUIEMNCg0KQWNrZWQtYnk6IENocmlzdGlhbiBMaW5kaWcgPGNocmlzdGlh
bi5saW5kaWdAY2l0cml4LmNvbT4NCg0K

