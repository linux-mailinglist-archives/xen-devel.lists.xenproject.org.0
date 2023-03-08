Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 336196B0CF5
	for <lists+xen-devel@lfdr.de>; Wed,  8 Mar 2023 16:37:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508093.782382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZvr5-0003Zr-W1; Wed, 08 Mar 2023 15:37:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508093.782382; Wed, 08 Mar 2023 15:37:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZvr5-0003Xg-S5; Wed, 08 Mar 2023 15:37:27 +0000
Received: by outflank-mailman (input) for mailman id 508093;
 Wed, 08 Mar 2023 15:37:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LRan=7A=citrix.com=prvs=4248fdc31=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pZvr4-0003Ww-QA
 for xen-devel@lists.xenproject.org; Wed, 08 Mar 2023 15:37:26 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c111e42-bdc7-11ed-956e-85ef70e17bfa;
 Wed, 08 Mar 2023 16:37:21 +0100 (CET)
Received: from mail-dm6nam12lp2177.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 08 Mar 2023 10:37:09 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM4PR03MB6911.namprd03.prod.outlook.com (2603:10b6:8:46::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Wed, 8 Mar
 2023 15:37:07 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6156.029; Wed, 8 Mar 2023
 15:37:07 +0000
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
X-Inumbo-ID: 1c111e42-bdc7-11ed-956e-85ef70e17bfa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678289841;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=LulsZTPaF4KZeJYSQCbkAASAOwMrbCZ0daiD4c2A9Oc=;
  b=Yq6aW8n0nzEZvki1cxPnmKbkvqvjNwY/UHWMjlcNeL43Qnea8MgKGpDs
   9ETjgTFzZMBkFT4rG+YyDTMlp4XYY53MRaYnfuPS+zt9xTBEVg7V+dc/d
   olGXrYwAhWMF85LsHza64ftxg9m5ejEIh1f9pxzk5UDuW911A+BLeqCWK
   I=;
X-IronPort-RemoteIP: 104.47.59.177
X-IronPort-MID: 99396908
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:2GNt6KssvJCfi/a73KSm25QeYufnVElfMUV32f8akzHdYApBsoF/q
 tZmKTuGPKyOMGKgfIwnbIu18BkBv8WAnYRmHAA+qytkFCoT+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Fv0gnRkPaoQ5ASGxyFOZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwNzMIaSqci7uN8rOBQ/txhfx8LNLmBdZK0p1g5Wmx4fcOZ7nmGv+PyfoGmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osgf60b4W9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOzpra800QXDroAVID0HbECnoqWIs2Cjd9xaG
 kYq6jF2vYFnoSRHSfG4BXVUukWssx4RXplAHusS7VyVjKHT5m6xFmUCCzJMdtEinMs3XiAxk
 E+EmcvzAj5iu6HTTmiSnop4thu3MCkRaGMHOykNSFJf58G5+d5syBXSUtxkDai5yMXvHi39y
 CyLqy54gKgPickM1OOw+lWvby+Qm6UlhzUdvm3/Nl9JJCsgDGJ5T+REMWTm0Ms=
IronPort-HdrOrdr: A9a23:bRFhhKxQHQApRgXobm58KrPx/uskLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9xYgBHpTnkAsW9qBznhPpICOUqTNWftWrdyQiVxeNZnPLfKlTbckWQmI5gPM
 9bAtBD4bbLfD9HZKjBkWyF+uIbsaK6Ge2T9JTj5kYoaTsvR7Br7g9/BAreOkpqRDNeDZ58MJ
 aH/MJIqxepZHxSN62Adww4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/NxSDxB8RXx5G3L9n22
 nYlA7S4LmlrpiAu23h/l6Wy64TtMrqy9NFCsDJos8JKg/0ggLtX4hlU63qhkFKnAn6gmxKrP
 D85zMbe+hj4XLYeW+45TH33RP77Too43j+jXeFnHrKu6XCNXgHIvsEobgcXgrS6kImst05+r
 lMxXilu51eCg6FtDjh5uLPSwphmiOP0DEfeNYo/jFiuLYlGfZsRM0kjTVo+a47bVXHAVUcYa
 FT5MK13ocoTbrVVQGUgoBV+q3RYp0CJGb6fqE8gL3u79F3pgEJ86JK/r1uop5HzuNId6V5
X-IronPort-AV: E=Sophos;i="5.98,244,1673931600"; 
   d="scan'208";a="99396908"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PFQAmNkyyx6/NreOYZ1ZWPfKTRpW7CqtwaXg3ycVaUndb7qcPNpovKdwbYwkRIkSmnc3Na0UIGz+n6ukCgKwpPoWolPCzCOoySOH0roVAqlM02O7optbNOe8shM/8VoaCY7iKT4sEjSv0UwIU2Vey9afIjsp/8LhEN6qE9f28Ke8y5vx0NHNFR3cGJbQTQrEmAxzkdaqKK00BmC9o1iTaILeKy5ZXfMbA7nc1k48BcHRI2D7jn3JOVw0zhFUiU3MFEddhPJGIShPR4jhdBDU6R8X+QpuzDlejimIZg2Ow8OG6ji/8JzPTdaS8LkwM7Vcvb8UE66W853vEonavJIcHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=orSWNB9CiE0Q0bjex6syvaCLMk/962wjKO6oqtxQuQE=;
 b=lx2OERj0eyHot3ivgQB9gVFq6SvLQ5Ce4AjUachkqbqjaH7jVBCKUDtASTBX+stFiizmkSQWWnIsOBqxFEiZWvm0tm31Ig1zNAza2WGb6+Fm9uGtOji9eq9KoIJ+5+GZyzTXDFkrhy6kddW2UhOn6pDKVEhayrOMEupzziPhmtMRbcRODOwI0LcSDrWp2PCnOoR0jVMV6k7V0AaZX5kgz8do8UNJSQCZVTwkJ6c2GpPRDPrUw6XEBTSyLpWk9850oOMsfec8avY7hejvrQ4u2JoZFi1+yYCLvhRJqGBak98kl984vfIhYrU3cekgUnjGJ55axyGdfcMAE5IKmicSwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=orSWNB9CiE0Q0bjex6syvaCLMk/962wjKO6oqtxQuQE=;
 b=fXnDHud81XfHJPI8vIJs61OIXzvmeniN38aXRpGy3EZoe2+p07N40DtqSimS/XJ/6kJ4D9z/bHMhUMThSyUpHTN2+RSQc67RfAFY+OP6NCI31HbkzJCZSUJXLWEorQzscBAeLICwmrym76iXG+g29lQTy+Jdr7NWVv/4Av1OZ+4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <071fded2-10fd-dfb2-a814-99d68acb922a@citrix.com>
Date: Wed, 8 Mar 2023 15:37:02 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [BUG] x2apic broken with current AMD hardware
Content-Language: en-GB
To: Elliott Mitchell <ehem+xen@m5p.com>, xen-devel@lists.xenproject.org
References: <ZAiobgH4L0OAS6XP@mattapan.m5p.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <ZAiobgH4L0OAS6XP@mattapan.m5p.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0158.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::19) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DM4PR03MB6911:EE_
X-MS-Office365-Filtering-Correlation-Id: efbc6df7-7a77-4837-84ab-08db1feaf990
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	teTsyjokHRh/Xo6HBM0x+IXAwZJgyAdwI9g81RGPlhJTQicZvLhCdyFY1gBqStaoUZP61lAno1c0tBeDtek0ecBIhSRMr4v9DNTRSkNxR23txe6n/JhMPYnwZBBaXaf9ruT3tLAO43ONb0fL7RBBFi5dw/GSTnxIMq0jQRuNpN/B4UD9p9eU/jUQohVeA3FDtdwK0FCYi8IF0OMkwUy6QOFZROGFpjtES+DxBlSK9zpSMgfg4UzM28CxCfPUuUyEyF3+jJ5pMHb9bPwPsOo0fwqWuPVkE51xEGrd0hG34QXYey/WnSSEXaNrjvP/0Ur4v5YiOoASh4cH7AmBwoqefbxHfsqfEHM492pQ/vFPDXAPYuPdxfodRM1L7labjQD+fQu7zp12vSZK3hchjt1Gm2yvGEjh429f3OyuHvRIhO7JVDg8NmiJRrBqlPD73w35ZuobSGw78xeaHoxLueO9LANqOsiq9FTxzMMt2LtMTgM+EcBqDqBXr0ON+RO2NPFHuNjwjdjvkLUSPxzygj6LEQfYh/amsPayeTkWlSD9qnPINveOCgpbGTadPjcF8WrI9EanCdToTl8KoO5icxqWLV31G6JxgnuyP82WRJpUNfCCJqox5q6en9OI8T/5dhYAxZSW8+xtq8ZM9sEHUa0THewLeTuun2l0JQ1YIs25bH27QYQV20NWr4fBDyxlk9zt/7d9ltXGBONkOJ1cSlGemtWWrjEaIUwlvMTipVh3V6c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(366004)(346002)(376002)(39860400002)(451199018)(6486002)(26005)(6506007)(966005)(53546011)(6512007)(6666004)(36756003)(31696002)(38100700002)(86362001)(2616005)(82960400001)(186003)(66946007)(66556008)(66476007)(41300700001)(8676002)(2906002)(31686004)(5660300002)(8936002)(478600001)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MFNZYmplR3NnMzYrK1p1QStYOC9UaGVOajR3ekVZSmJmUnh0bUZXQ0s4SjA4?=
 =?utf-8?B?bDF3MHh4VDZuRzJOcmc4eXlBc081aDBHM1gyazJ1Qk16d2MyS3M4VVhad1hx?=
 =?utf-8?B?NTlJcHJyY3h0VTFFTGRkYTZmcEtxU1FHRktQNVRSVGlsZW91ZmZrTGZDOGx0?=
 =?utf-8?B?aitsZ1Zobm1MZkRLeVQxMVRjK2dzU1NTNVQvR0NoSU5vemZkSkNoY0VNbDVa?=
 =?utf-8?B?enp5czBTT0E0QTJZQ3VCbGpvbHhqMTBJcmRFTy91YzRoNmhIVmJaNlpPbllM?=
 =?utf-8?B?aUV4YVpxOHgxRElGS2FKVmZ6M21RcThRMHVIWHNkc2lLUERHRjR4UXdrL3Nq?=
 =?utf-8?B?WkpBcXJOdENBdVZlMXV4cHBYMmJiRS9qM3kweTlJRFo2a3E3UWYrcnJkLy92?=
 =?utf-8?B?bnMyU0lIM1VodjNhQkZxWW4xQzkxV3ZSVVJVb2ZPQkM1MS9DcXYwWFluSzNZ?=
 =?utf-8?B?ay9NYld4VTVaakxUNmhlOXNzYlF4aHJFQkxKeTlKcitRcWxDRytuN01XQ3BP?=
 =?utf-8?B?dWdpdDgzQkN5NEFlYWFNdXpIQlBWU1pMV29ZTGhET2hNRENKeUVQYlV4Z2Yr?=
 =?utf-8?B?ZG9WOEVZRGhpTklLOWFLaTYzZFllWWZVYURhK3hndElKaURHSjI4K0tJMlF1?=
 =?utf-8?B?L0hKUE40K2xZNnovU3RsdEt6M0lEcUlyRUZuSG85clZYR0ExazExeEpZV1RU?=
 =?utf-8?B?MWdHTUxWTDMwdkFSbVd4aFhqZnVNa2x0aWpjTXVZQlRKT2g2VVZXQ1hVd2VO?=
 =?utf-8?B?RE5uVWdWN3VxNUFFbnppR1RrejErV2dSRnNUdmhsa1VxdkgzZVE2aG5UOENq?=
 =?utf-8?B?dEJkVVZXUlBESEt2bm9YNHRBeHRHT3RMZXJ2SkhQUE8vWkhkNnpNZFZLb2Q5?=
 =?utf-8?B?bmVXaWdKTjVKcHNaUityczU0MExvaEVVSWZYY3RUcHlLTEhqZ1ZKTWdvYmZN?=
 =?utf-8?B?cmJiMVBId1pZVzR2WU5mUjZUNUhSQno2ZVJUYTZwb1YrVHpKeGNQbFdCaGxm?=
 =?utf-8?B?SG9ybThCbHFSMGlMSVdLWXNBWE1VaWR6TGUyY3JhaVpXcHdBN3lpQ1FoK080?=
 =?utf-8?B?UWp3dEIvTnJXaVN1ejZZeUZNM3lUQWc2bnRYSE04VGtXNzdzK2xDTjFzeUwv?=
 =?utf-8?B?ZCtNY2ZlZFpFT2lhcDFFTUY5VmZJL0F5NTJOb1B3aisrbXEyMnNRRUs4VmFx?=
 =?utf-8?B?Z0gyRTUxL2NNNG5YelczbHAwVCtFd0IydXY3dnVKdFZXYnJiczFsbG55RktH?=
 =?utf-8?B?RnowK3NGOGxIaXFibUl4VGpDVVNXSTFEdTVMVkJDM0FDcFNETGh6VU1ic3Zw?=
 =?utf-8?B?S2FNZVg5KzArdGFxaGpnTFloVjdrU3RGaTVpR2tlWkhQK3RwMGU4WFpxUHZm?=
 =?utf-8?B?VklsaWpQUURoaFV1TkdrU0Rjc25DTFJQa09mNUtCNUl1UnZkK0tMRDU2VERD?=
 =?utf-8?B?bnVjVmQvdjRzUERHWC94bW1CZDExMUxXNGdwY2RCUmFDTDJmS2ZYMHA3cnhW?=
 =?utf-8?B?eDdpUGNHKzBzTXZleHU4dDhib012YkxRdUROK2pjRjRRVThsSTl5bVA2bmtT?=
 =?utf-8?B?QVRubVpBWFN1ZGI3RDBMVEJURXBqTDJmczBIRzhKU244U3dOQkppVmcyb0gy?=
 =?utf-8?B?WXZKV0NXSWxGd0UyZHBSdGlVTTBTN3hQR1duMTMzSlZwdjRGNWRQMzd5dlA1?=
 =?utf-8?B?S2ZHZ3Q2alZFNHUyZDFzT0VjK3R1Rlo5NkwyaVY1eWJ3WHQrcGhXZjI0Q280?=
 =?utf-8?B?NVp4V29ZUGNVQWNEejB1VkhLWGp2WWg1OWV1YkYwLytVZVkyaVpTd1cvNktp?=
 =?utf-8?B?WWJLcUE3RlMxQWkzaUE1QmRXaDJ2M2k1Z0N3dmZpcS8xM2tpYUszUTVtZ3o1?=
 =?utf-8?B?Q3JxRGpybmZVYWozZXg4NGtmdUUzK2ZoYVlocmkyWEd6aXpyNlVIU29hdEdB?=
 =?utf-8?B?L3hDM1RNV1hLemNCWGVqaStvVzZsVDFSQzBRdWZ5bHdzdmhzcmJpdEo4NmZh?=
 =?utf-8?B?UVJBQm9BMHB4UVdHL3hoSnE0bCtMNFY4Z3NtNVRuMHZtSkErZXZIYnZhQ1ZJ?=
 =?utf-8?B?ZGwxZWJZaXg3YzBLMUJDcFpPTWRKN3lHN2ljd013OW5yby8zZDMzRmFIWmFT?=
 =?utf-8?B?TkNWS25VMHVNTEMxUFM0eVNtc1piQXNTOExuNXc2djc0VEhUdk93ejhtVU01?=
 =?utf-8?B?dUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	X0sclEuEq1K/Daww3XWqu8a+bOr9+8yEVMKj71VIm/tjfYo5aPvG6r6sx+P1afJcXPus5NEG+Gfrq/m4Ujzw8H3vWYxI+vIb9KEtpvOusmkVwVNJ4+RL4AVP5NB76W5RLppPe5gRrw/ueMop1+B6qKVg53EQ1cTV/r97YaqkeS9A+n6WSoobB2+q6yahGYPm1FsgXoiQmIDtY0Nfhd0XUYxgHitVsnp9v1LvjIUkRy7mp8Oj1SJe20WUpOtCEMP/w5iy2eMvwWZ/NwIDwgeibCiXFlXBdy/e7IrNzmbOxHpusGtpoTuZNNdFUKKZntDBhSN1YY2QVeyG9QqqYUil2DqCAMSWMka7n9MYAcwjGtBIRPs0s4puiOmKb+fsALCOEmvuynO+iiqkkSdfieA1jhzmxQRqW/cPpnWyFNg+jZbqOiB+roW2MgYAtYdjKDIk9tws9Q9afsa9JZUOePrctKlTd7DccjpHTtm27T0MvGHReTR0i1CBSc2NZRkZ0WBQvIFnwrzrPVNDFbVHc/e1c5W1tT8Kw7VDqO8oG30h/i2V2a4+fHfPmvsK7xryZ8Re890KkeF3SxzvNQ428xWYPyzhTpk8almuczhB5DHCNBl/FovSUi8E3x4c5U5Oa8XdcsiHVkA/qPeKe3euVQC0Rz8rvIN7LqBi/UOYNb9GVphxLJlzZ8B6D+jKVDztEm5iMOMb01GRKJi0fC0dI8IwYDf2jN5dpy5mhbpq6UDXPuCF+djHk+GBILH8BS7SDTXLCUOM3odMofa+d261ZbTf3DAPvT6iXN2vpvsot+WMzho=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efbc6df7-7a77-4837-84ab-08db1feaf990
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 15:37:07.5831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aCZpeYA56TQ7sKmMwo3ay4VMs6t/qVrZjFYjW8ohaGl9GB0XGieepqPQROahACwVj5jf28TJi3S6zXuoXpe0A/ubXuV5M4LIw4RipFDXQF8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6911

On 08/03/2023 3:23 pm, Elliott Mitchell wrote:
> Mostly SSIA.  As originally identified by "Neowutran", appears Xen's
> x2apic wrapper implementation fails with current generation AMD hardware
> (Ryzen 7xxx/Zen 4).  This can be worked around by passing "x2apic=false"
> on Xen's command-line, though I'm wondering about the performance impact.
>
> There hasn't been much activity on xen-devel WRT x2apic, so a patch which
> fixed this may have flown under the radar.  Most testing has also been
> somewhat removed from HEAD.
>
> Thanks to "Neowutran" for falling on this grenade and making it easier
> for the followers.  Pointer to first report:
> https://forum.qubes-os.org/t/ryzen-7000-serie/14538

I'm sorry, but this is unactionable.

That thread is a mess of many different bugs, most entirely unrelated to
Xen in the slightest, and there is conflicting information on whether
the x2apic=false heuristic is even relevant.

There may be a Xen issue hiding in there, but my divination skill level
is unequal to the task...

~Andrew

