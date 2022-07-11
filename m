Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E46B570281
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jul 2022 14:38:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.365107.595181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAsfy-0005zH-D4; Mon, 11 Jul 2022 12:38:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 365107.595181; Mon, 11 Jul 2022 12:38:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAsfy-0005ve-9u; Mon, 11 Jul 2022 12:38:10 +0000
Received: by outflank-mailman (input) for mailman id 365107;
 Mon, 11 Jul 2022 12:38:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VQZC=XQ=citrix.com=prvs=184aca51e=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1oAsfw-0005OI-Fy
 for xen-devel@lists.xenproject.org; Mon, 11 Jul 2022 12:38:08 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f5cfd01-0116-11ed-924f-1f966e50362f;
 Mon, 11 Jul 2022 14:38:06 +0200 (CEST)
Received: from mail-mw2nam12lp2040.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.40])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Jul 2022 08:38:03 -0400
Received: from DM5PR03MB3386.namprd03.prod.outlook.com (2603:10b6:4:46::36) by
 SA2PR03MB5755.namprd03.prod.outlook.com (2603:10b6:806:111::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Mon, 11 Jul
 2022 12:38:01 +0000
Received: from DM5PR03MB3386.namprd03.prod.outlook.com
 ([fe80::298d:4044:f235:c782]) by DM5PR03MB3386.namprd03.prod.outlook.com
 ([fe80::298d:4044:f235:c782%6]) with mapi id 15.20.5417.026; Mon, 11 Jul 2022
 12:38:01 +0000
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
X-Inumbo-ID: 4f5cfd01-0116-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1657543086;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=uJu8c5OJnhKP15Sn1Vm6hFvo4jwcZ86BmomBCS+edME=;
  b=aNjeB+f/LlC8i2YZ4o8BOOYSbZS1S6pgh66u2kQPpm82P+Itq+jyHKrN
   XEb1RkXhWSZCtfHloSocMf0aNrwG1E+RlbXxvGoa2Qw1RwLglOGNPuIFz
   h2OjlOu7BU1jpRA2xb6wlurHSAnrZTlbGwUeJGMDm6RVrT+v9JusTI77f
   I=;
X-IronPort-RemoteIP: 104.47.66.40
X-IronPort-MID: 75937914
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Ae326a01+VsXyRRwTfbD5RVwkn2cJEfYwER7XKvMYLTBsI5bpz0Gz
 TQXWTiEM/rbNGT0ct8iOom1o0oHvJaEztZmQFY/pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1Ek/NtTo5w7Rj2tEx2IDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1Wlb7rTy0EI5fwhc9DTD5RIQhZGpVvreqvzXiX6aR/zmXgWl61mbBLMxtzOocVvOFqHWtJ6
 PoUbigXaQyOjP63x7T9TfRwgsMkL4/gO4Z3VnNIlGmFS6p5B86dBfmSjTNb9G5YasRmP//Ya
 ow8YD5maB3GbjVEO0sNCYJ4l+Ct7pX6W2IF+QnK9PNri4TV5BBs+angKOKORu6XFNxNvXiWg
 WjZ4k2sV3n2M/Tak1Jp6EmEhOXCgCf6U4I6D6Cj+7hhh1j77nMXIA0bUx28u/bRolS5QNhFL
 EsX/AIhqKEz8AqgSdyVdx+3unmfpTYHRsFdVeY97WmlxqPK7i6DC2MDTzoHb8Yp3Oc0WDps0
 FaKltHoADVHsbuJRHbb/bCRxRuiNC5QIWIcaCssSQoe/8KlsIw1lgjITNtoDOiylNKdJN3r6
 zWDrSx7gqpJi8cOjv+/5Qqf32rqoYXVRAko4AmRRnii8g5yeI+iYcqv9ETf6vFDao2eSzFto
 UQ5piRX18hWZbnlqcBHaLxl8G2BjxpdDADhvA==
IronPort-HdrOrdr: A9a23:d72gZauAFcyCtBLM1dWh+Ere7skC2oMji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJh5o6H6BEGBKUmslqKceeEqTP2ftXrdyRGVxeZZnMbfKlzbambDH4tmuZ
 uIHJIOb+EYYWIasS++2njBLz9C+qjKzEnLv5a5854Fd2gDBM9dBkVCe3+m+yZNNWt77O8CZf
 6hD7181l+dkBosDviTNz0gZazuttfLnJXpbVotHBg88jSDijuu9frTDwWY9g12aUIA/Z4StU
 z+1yDp7KSqtP+2jjXG0XXI0phQkNz9jvNeGc23jNQPIDmEsHfoWG0hYczDgNkGmpDs1L8Yqq
 iIn/7mBbU215rlRBD3nfIq4Xim7N9h0Q6l9bbSuwqfnSWwfkNHNyMGv/MXTvKR0TtegPhslK
 1MxG6XrJxREFfJmzn8/cHBU1VwmlOzumdKq59ks5Vza/prVFZql/1pwGpFVJMbWC7q4oEuF+
 djSMna+fZNaFufK3TUpHNmztCgVmk6Wk7ueDlLhuWFlzxN2HxpxUoRw8IS2n8G6ZImUpFBo+
 DJKL5hmr1CRtIfKah9GOACS82qDXGle2OEDEuCZVD8UK0XMXPErJD6pL0z+eGxYZQNiIA/nZ
 zQOWkowFLau3iee/Fm8Kc7gywlGl/NIwgF4vsul6RRq/n7WKfhNzGFRRQnj9agys9vcfHmZw
 ==
X-IronPort-AV: E=Sophos;i="5.92,262,1650945600"; 
   d="scan'208";a="75937914"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BIKGn9dL9tntgx29ONKrJw3/3nMIXxEEWdG/c05EL2rMe34aNQHAeW0SItX39C4HQ80FEIyRMWSdJCOznA5aqBjxm/M7zqurqPgCezKTRjupId05Ldol0yhio+nXHOYmmedvet7kjhpWNvBK7rBi5FSutCq2CkP1cjBfS/GsdAqX3loN6CslJ5jGNhHX0RszT64gvOdF4NrvTatGlXrWED7tofqRwVjFlJHB4Cms3FxIGxKf1ECpx0o75DOpbP3sfUipaItkJUFHxuI2hT9mwtwGO9IN29uRU+LDwzqA2lPzZyRbu1kgCKhLAtiGu1ig8ol24+poQDZOfZp7STwfyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uJu8c5OJnhKP15Sn1Vm6hFvo4jwcZ86BmomBCS+edME=;
 b=Q3H/YibytEBStHmsM1fxw5F7BN+xlER0mk0u5hXiJHYeoI0z1qa5ZE7wxx0f3TIPNLpAKbfRcxAmk/RwLclon/WAhCJpsM+nQ8V38foPVjaXBwO7pDs4wJDGrIaO20tNJVSD0lZXFPuSTQUYzZwYWJodRaXMp1sWh6y2vxen2m0pn84edcDLBqpRgt0pwde9IRxEMCxW/3LYxeXpBChAvvqC1ZrKdRd8PEyAGJRrWg+AA3JD2Azx9bIZS/y0XDHBPJakseY4aaJKVmfYDmZanz6SI+k+bdhBDBX+LHAwlv2kBABt8QGOX2GJNEY9U4a9ekx2/kH1/uLdjuTIhfnUSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uJu8c5OJnhKP15Sn1Vm6hFvo4jwcZ86BmomBCS+edME=;
 b=ovHw2OB6NIKYFIQBoIkh20JBa1F0SwJ9khvt9VQXsfFOUvhbMxXajX7RvfkkhmrFtmO07x0ezVmBpqxBl95uMlnZSIt8Iv1ioYEN7KiP2BIdWK16VLR2DiozbuxAIki7bPdILyfezhD0t5wXeZXqEaGlVNfOFK8aAxGxFaf97Os=
From: Jane Malalane <Jane.Malalane@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>, George
 Dunlap <George.Dunlap@citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>,
	"Gross, Jurgen" <jgross@suse.com>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>,
	"Nakajima, Jun" <jun.nakajima@intel.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH RESEND v10 2/2] x86/xen: Allow per-domain usage of
 hardware virtualized APIC
Thread-Topic: [PATCH RESEND v10 2/2] x86/xen: Allow per-domain usage of
 hardware virtualized APIC
Thread-Index: AQHYi8Ac3FlD8zBv9U62svKKFrIqXq1nSpWAgAAsEQCAEWpoAIAAB0qAgABGQoA=
Date: Mon, 11 Jul 2022 12:38:01 +0000
Message-ID: <b475447c-a24e-f33d-7079-1713767a51d2@citrix.com>
References: <20220629135534.19923-1-jane.malalane@citrix.com>
 <20220629135534.19923-3-jane.malalane@citrix.com>
 <BN9PR11MB5276AC94021EA92C539D5F078CBA9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <a878aadf-5bc9-184b-d3f8-4e43ffc64262@suse.com>
 <6b01e02b-ba44-5f8d-f766-ac889c28d662@citrix.com>
 <64e06bd5-7919-7235-600f-b9b0e59ef66f@suse.com>
In-Reply-To: <64e06bd5-7919-7235-600f-b9b0e59ef66f@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b8af6df9-5c77-4ee0-8210-08da633a3199
x-ms-traffictypediagnostic: SA2PR03MB5755:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 dG6HinZm8rTUaRPEIH+ayF/SL4teufaGTqOzB7qoyJju6X5g4JdgBNE1224K1A3ZoR31o8pCAcubgM/kA3Ck5gvDmQ0HJX4fEyoKawxtVsu2ULmiu2i2Vn/22lx1K1BOvV1JEVMM6cl43VFJ/7DdlqIMmsGjSJYU2am5YqW0739XrUcua6dn51Sk6RG6NvVdhK01EWJGdkyNxv0aHbKuF2F5di+jlw/LuFBPxqBfuJOlamrBRJYUGGMaFfTIiEUhI3nHpuhBCdn3KELqS6g/Se3n5ZjGqYXRJ1JoY7X9FLLOh7+7zWAe/eiya+6dbSL7hXukEPAqvu6EclHX7D6a5LS79OJhlAPM3qzZGXz/NrT2ekBK3dttgIAEcuzHdmkBxGEnarGl/WZR4r9LCn0FXbCkqAHtmgsPFcPEwRiY9qoXyOVRMFroHORBp9c+np1O2GIjkzSJRWRZIesE7GiMReOkjc5PeaTHOvbcGXeoaw4DccHEq4KIMfCliUq6rR8yLfdeGt5eUkL1FIxEDdDVvYbWOYqXnecNhqVdMQ1aasAYk38HFgy62v4deyxfDrDwrLRdXmZV0aQuKzruz1ffzsTYpoMXxf7tKn7gnGOjGPvE2ZO/U5G7MuzIt+oy6mtN5p7N68NAbXxljIUu6aWdpNnM1XoJbhvJ1BowvrxN6DiGRI3FFY+phOqFSPe3BjSds58hrvYS7ioVVt/xpISMJ36ZETyqzNTacet4qbGXpxDp71aL/5QAVbjB1/VXdhrRUPtKftWizA4dxWEap0fhCBAbeiDkCOfaCnCDn4QpKnTIMQeJqoWVgvO7gYBU4jlXQm68JsbyxIgKraHdJwPc2rWYhE1XtXNER05GczH4pi4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR03MB3386.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(376002)(366004)(136003)(39860400002)(83380400001)(316002)(66946007)(66446008)(54906003)(91956017)(66556008)(6506007)(8676002)(66476007)(64756008)(76116006)(4326008)(26005)(6916009)(186003)(53546011)(2616005)(38070700005)(5660300002)(86362001)(31696002)(71200400001)(6512007)(8936002)(41300700001)(2906002)(6486002)(478600001)(82960400001)(36756003)(38100700002)(122000001)(31686004)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QlZudFg2ZUtndVp6OGd1V2YwS0JNb3hPWjZqMk9tcTd0ZVlyQitOSmE2b0Zv?=
 =?utf-8?B?N2ZGNkxCS1JVZjFKR3k2TysyVko0cmhHNG4wSVgzV2tjd2xzOGJZVkJBQk9J?=
 =?utf-8?B?NkllamlKTWtOU0thczFLTWNnb0F3cFJiaDNYS3BSV2F1OWVDeFMrWUpYbU1J?=
 =?utf-8?B?SjI4VWlJSkg4TmMzTVVzQ3FXN0I0Rk5WcjBuWXBtMk91VjQzRmFxT3hwQTFC?=
 =?utf-8?B?Wmd6a3pVNy96OUVpcXZaNml2RW94Y2RaY055OTdHb0FWbGRSRlBWWHZNRCtX?=
 =?utf-8?B?bFhoanhLVmtvMEI1aXhCMXZUN0RKSW1GNjAzaG9oNE5sQmpvRUNhbGZRRlhC?=
 =?utf-8?B?SjByc2VuT01JZDkvdFhlb3ljU1J1eElXQ3A4MnFnaUZyTkR5VGhQT3RhaXA0?=
 =?utf-8?B?YXFlQnNYM3NuSkd1UWZQVzhvcUk0cnl1OW5WSVp6aW1WckY5cExVa21pdDZE?=
 =?utf-8?B?RjUwVmk2aXg1UUJ2UzRqa0JxOW9iWk1zV3pYMUZMdUFHaTJmeVBDTC81K2hW?=
 =?utf-8?B?b2VBZzk3TGNNQzFsK3hMZVZHa29ySTF3U2dwdUg0b2RFRVc2QUZldFAzWFpj?=
 =?utf-8?B?OGRuUHlrSzJyZEx2ZmtZV25lemF3RkFySlRIcTBuS0VPSWc4Z0ZoVTZuYWY0?=
 =?utf-8?B?YjNUcFNuL1lSRzRDeVlaNE0rYmxOT3h5ZFpaaSthbTkrdndQWHcwOGtnTE9r?=
 =?utf-8?B?RkxpOGVLbEZ6YVl2TUJEZWl1NUErbnl2VXpkRXlkSG1BNGxJK3krTTdmMG5C?=
 =?utf-8?B?bW1JYlNxRlB2cG5kOGlqVm54SUlNZWFoMzBIbDFodkIrYWtHdFowMmpIUUsr?=
 =?utf-8?B?bmhkYk1CMTlkcmgxVU1lZlFEQmdobnJpbjFheUY5a283WEFOSENpSFluVzJB?=
 =?utf-8?B?YWZLMnNLWC9INU5OcWdjN2dHUU1lMTFGbmNQM0hodVVTNWltczM1TVZDVHhJ?=
 =?utf-8?B?Nno0bTZRWkpUcllSOExLUVpQYmxQcktGWS9ieHlvNmtSbzhDT09CQ2xKRERS?=
 =?utf-8?B?cVdsVGFXZVRLaWNUWVo4d1FWdEJGVEdWdGYzdngxS1Yza0tZWUxXUlpBVWRN?=
 =?utf-8?B?R2ZlZDFiQTZNdzJKeDkxQ1VsY05qRU1yR2xWK2ZGdldoZ2pIMFRLV1ZRUGVr?=
 =?utf-8?B?SWVMVFdIc1ZRMnlLQ1FSQkwwNnhzNWd5dFY5SGJvOEoxYW5rdG5qVlFYTURY?=
 =?utf-8?B?d1dMTFF3NlBiTVNQYUpwKzgzVHI5OW5xUU9mUElNUnVlL1V3N3c3Z3JUWmRm?=
 =?utf-8?B?QWhkUURvdU5MWGVUWG50M2wycjVUWGZKclh5Y1QydHdLOGtSU2lUWHY2Ry9G?=
 =?utf-8?B?V0pUeXl5ZUZrYlJicEE2R2RKa2cwRGprTER1ZThaTnB2SmxkVUl3aGR1dWpR?=
 =?utf-8?B?K25VUnNhdGFnUGM1VkFpV1MyMUtpZjhrd0FkOHlSR2c3T2EyNnZZZ0ErUXRX?=
 =?utf-8?B?bWxxa1IwS05GQk81Sk44WFBYazFyZzJUamZEbmNTcE9IV0pkVzRZa2hLdk1r?=
 =?utf-8?B?UFovVFBTdk5GSThFNkFvVzdxdVVNa3JKaCszZUVsSCt5OFlYdUI3b3ZFZDVh?=
 =?utf-8?B?bkl0VXA1K1RIRk9CMTB3b005R0Erbzc3cXZCMElScVdBMlRyejZlK1kvY2NE?=
 =?utf-8?B?Z1hQeTNRaFZ3SXZEaHdHMGhiRGhmYUFabDhRT3pwQ2IzWDE1dytQTERtM21M?=
 =?utf-8?B?anVsOWN4Nzdib1hXN1FPS3dkUUpKb2YxeVJzMDByWkdSdWZlWFpQa2V0VHFD?=
 =?utf-8?B?amtJdlhHSU5aSFpGSUhwWnVsQjQ5aThBZ1BRdFB6VGZQYVd5MlVaSm81czc5?=
 =?utf-8?B?VFZZRzdwQ0pMWU5JOTFmeVo4aUowUmJjNFVkd2VnYk9CT05nejJrSEpFYjly?=
 =?utf-8?B?Q2tYSmF3VklUNThuU1N1SERtK285QWtyYUpZRWdnTWxUV1ZCWTFkQUY3VHJh?=
 =?utf-8?B?Vm0zUWpIb0JBNmxHbGRUU2FhbXNjMWxIYnlsbnhHeFFobzhwME5ya05TdW1C?=
 =?utf-8?B?SXA5NTVvUUxlemhkY2lBNWh1SWZ1RXRqeHdBVnU0WWxaWDRTdGtSZEZLaUZt?=
 =?utf-8?B?OFBlcFFHUXl5SHpXYTBHVmxXcSsxOTFDQ3BiMjF0S3FaVXJRK3ZNNWcxQzlC?=
 =?utf-8?B?aUtmTjhkQi9UWmQ2alhmQnduZlRaaW5sVm90dEtNYTdRSUYxQkhFVE95M3FK?=
 =?utf-8?B?MFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <171FF0D5EB95514DB9F9E0464F882BE0@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR03MB3386.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8af6df9-5c77-4ee0-8210-08da633a3199
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2022 12:38:01.7118
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8la4bzYEpf34nrDNq3hhU4PbS7HXrMFddWwy3HRklhCsg+cgPCeCv/9mI+Bz6b79fPp65N5v5ecDP7d31xQUP9jFqTPBrh1C4Bkz3u1se2U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5755

T24gMTEvMDcvMjAyMiAwOToyNiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDExLjA3LjIwMjIg
MTA6MDAsIEphbmUgTWFsYWxhbmUgd3JvdGU6DQo+PiBPbiAzMC8wNi8yMDIyIDA3OjAzLCBKYW4g
QmV1bGljaCB3cm90ZToNCj4+PiBPbiAzMC4wNi4yMDIyIDA1OjI1LCBUaWFuLCBLZXZpbiB3cm90
ZToNCj4+Pj4+IEZyb206IEphbmUgTWFsYWxhbmUgPGphbmUubWFsYWxhbmVAY2l0cml4LmNvbT4N
Cj4+Pj4+IFNlbnQ6IFdlZG5lc2RheSwgSnVuZSAyOSwgMjAyMiA5OjU2IFBNDQo+Pj4+Pg0KPj4+
Pj4gSW50cm9kdWNlIGEgbmV3IHBlci1kb21haW4gY3JlYXRpb24geDg2IHNwZWNpZmljIGZsYWcg
dG8NCj4+Pj4+IHNlbGVjdCB3aGV0aGVyIGhhcmR3YXJlIGFzc2lzdGVkIHZpcnR1YWxpemF0aW9u
IHNob3VsZCBiZSB1c2VkIGZvcg0KPj4+Pj4geHsyfUFQSUMuDQo+Pj4+Pg0KPj4+Pj4gQSBwZXIt
ZG9tYWluIG9wdGlvbiBpcyBhZGRlZCB0byB4bCBpbiBvcmRlciB0byBzZWxlY3QgdGhlIHVzYWdl
IG9mDQo+Pj4+PiB4ezJ9QVBJQyBoYXJkd2FyZSBhc3Npc3RlZCB2aXJ0dWFsaXphdGlvbiwgYXMg
d2VsbCBhcyBhIGdsb2JhbA0KPj4+Pj4gY29uZmlndXJhdGlvbiBvcHRpb24uDQo+Pj4+Pg0KPj4+
Pj4gSGF2aW5nIGFsbCBBUElDIGludGVyYWN0aW9uIGV4aXQgdG8gWGVuIGZvciBlbXVsYXRpb24g
aXMgc2xvdyBhbmQgY2FuDQo+Pj4+PiBpbmR1Y2UgbXVjaCBvdmVyaGVhZC4gSGFyZHdhcmUgY2Fu
IHNwZWVkIHVwIHh7Mn1BUElDIGJ5IGRlY29kaW5nIHRoZQ0KPj4+Pj4gQVBJQyBhY2Nlc3MgYW5k
IHByb3ZpZGluZyBhIFZNIGV4aXQgd2l0aCBhIG1vcmUgc3BlY2lmaWMgZXhpdCByZWFzb24NCj4+
Pj4+IHRoYW4gYSByZWd1bGFyIEVQVCBmYXVsdCBvciBieSBhbHRvZ2V0aGVyIGF2b2lkaW5nIGEg
Vk0gZXhpdC4NCj4+Pj4NCj4+Pj4gQWJvdmUgaXMgb2J2aW91cyBhbmQgY291bGQgYmUgcmVtb3Zl
ZC4NCj4+Pj4NCj4+Pj4gSSB0aGluayB0aGUga2V5IGlzIGp1c3QgdGhlIG5leHQgcGFyYWdyYXBo
IGZvciB3aHkgd2UNCj4+Pj4gd2FudCB0aGlzIHBlci1kb21haW4gY29udHJvbC4NCj4+Pg0KPj4+
IEluZGVlZCwgYnV0IHRoZSBwYXJhZ3JhcGggYWJvdmUgc2V0cyB0aGUgY29udGV4dC4gSXQgbWln
aHQgYmUgcG9zc2libGUNCj4+PiB0byBzaG9ydGVuIGl0LCBidXQgLi4uDQo+Pj4NCj4+Pj4gQXBh
cnQgZnJvbSB0aGF0Og0KPj4+Pg0KPj4+PiBSZXZpZXdlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4u
dGlhbkBpbnRlbC5jb20+DQo+Pj4+DQo+Pj4+Pg0KPj4+Pj4gT24gdGhlIG90aGVyIGhhbmQsIGJl
aW5nIGFibGUgdG8gZGlzYWJsZSB4ezJ9QVBJQyBoYXJkd2FyZSBhc3Npc3RlZA0KPj4+Pj4gdmly
dHVhbGl6YXRpb24gY2FuIGJlIHVzZWZ1bCBmb3IgdGVzdGluZyBhbmQgZGVidWdnaW5nIHB1cnBv
c2VzLg0KPj4+DQo+Pj4gLi4uIEkgdGhpbmsgaXQgaXMgZGVzaXJhYmxlIGZvciB0aGlzIHNlbnRl
bmNlIHRvIHN0YXJ0IHdpdGggIk90b2giIG9yDQo+Pj4gYWxpa2UuDQo+Pj4NCj4+PiBKYW5IZWxs
byBKYW4sDQo+Pg0KPj4gSW4gdGhlIHByZXZpb3VzIGVtYWlsLCBJIHdhcyByZWZlcnJpbmcgdG8g
dGhpcyBkaXNjdXNzaW9uIGFib3V0IHRoZQ0KPj4gY29tbWl0IG1lc3NhZ2UuIEkgaGF2ZW4ndCBz
ZW50IG91dCBhIHYxMSBiZWNhdXNlIHRoZXJlIHdhcyBubyBjaGFuZ2UNCj4+IG90aGVyIHRoYW4g
dGhpcyBvbmUgc3VnZ2VzdGVkLiBXaGF0IEkgc2FpZCBlYXJsaWVyIHdhcyB0aGF0IEkgdGhvdWdo
dA0KPj4gdGhlICJIYXZpbmcgYWxsIEFQSUMgaW50ZXJhY3Rpb24gZXhpdCB0byBYZW4gZm9yIGVt
dWxhdGlvbiBpcyBzbG93Li4uIg0KPj4gcGFyYWdyYXBoIHByb3ZpZGVkIGNvbnRleHQgZm9yIHdo
YXQgSSBzYXkgYWZ0ZXIgYnV0IEkgYW0gaGFwcHkgdG8gcmVtb3ZlIGl0Lg0KPiANCj4gSSdkIGJl
IGZpbmUgZm9yIGl0IHRvIGJlIGtlcHQgYXMgeW91IGhhZCBpdCwgYnV0IHlvdSByZWFsbHkgc2hv
dWxkIGhhdmUNCj4gc2VudCBvdXQgYm90aCBwYXRjaGVzLiBUaGVyZSBhcmUgcmFyZSBjYXNlcyB3
aGVyZSBzZW5kaW5nIG91dCBpbmRpdmlkdWFsDQo+IHVwZGF0ZXMgd2l0aGluIGEgc2VyaWVzIGlz
IHJlYXNvbmFibGUgKGUuZy4gdG8gYXZvaWQgc3BhbW1pbmcgdGhlIGxpc3QNCj4gd2l0aCBhIGxh
cmdlIGFtb3VudCBvZiB1bmNoYW5nZWQgcGF0Y2hlcyksIGJ1dCBJIHRoaW5rIGhlcmUgeW91IHdh
bnQgdG8NCj4gbWFrZSB0aGluZ3MgZWFzeSBmb3IgY29tbWl0dGVycyBhbmQgbm90IGhhdmUgdGhl
bSBodW50IGRvd24gdGhlIGVhcmxpZXINCj4gdmVyc2lvbi4NCg0KQXBvbG9naWVzLCBtYWtlcyBz
ZW5zZS4NCg0KVGhhbmtzLA0KDQpKYW5lLg==

