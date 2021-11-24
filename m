Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DA245BDAE
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 13:37:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230405.398291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mprWB-0007ce-GI; Wed, 24 Nov 2021 12:36:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230405.398291; Wed, 24 Nov 2021 12:36:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mprWB-0007aG-Co; Wed, 24 Nov 2021 12:36:55 +0000
Received: by outflank-mailman (input) for mailman id 230405;
 Wed, 24 Nov 2021 12:36:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gGpx=QL=epam.com=prvs=1962e93d75=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mprW9-0007DN-8h
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 12:36:53 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 325300ec-4d23-11ec-a9d2-d9f7a1cc8784;
 Wed, 24 Nov 2021 13:36:51 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AOBT1BU016750;
 Wed, 24 Nov 2021 12:36:49 GMT
Received: from eur01-he1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2050.outbound.protection.outlook.com [104.47.0.50])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3chhcws4nb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Nov 2021 12:36:48 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM4PR0301MB2194.eurprd03.prod.outlook.com (2603:10a6:200:50::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.19; Wed, 24 Nov
 2021 12:36:45 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%8]) with mapi id 15.20.4713.026; Wed, 24 Nov 2021
 12:36:45 +0000
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
X-Inumbo-ID: 325300ec-4d23-11ec-a9d2-d9f7a1cc8784
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fKq0apiR+qrT03aBvmG+3v+siGfn367sKRXc0wwR2rNwmwV+yZmKb5hrHQlTtNwOUQSyrw1x9qXLPYKjYtwj4/0FanGpMIx61A2IFCY7NWR21ZRihMyjcigm4kixAn8n+nyC1zxgiZ9ijhNIoLsBeKs2fsoTyeINGp2JKVMqV8287BbRpRmrJNxz8nQ/xg9otfNF5IFmqkVC7KU4o5mAAQhKi1mJSBtSXC3YE+Tx6Q3iLBxqr4oOECBNxOR4+Feej6mxMRdeNd0F8tIQrlMRaJ/FDquynEhCrdoz53wqCSu3A+wYTSRYrznJkjxHJ+FT+jv4DyUOLIxKcxf9QTJyfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uxy+iibRgZJsxD2FBuwLmyLiiHsB1y7yvYpDYa6T/JU=;
 b=hgWEkuBcOShVTDpw80QlOod09yhqF279/IreCNVHy2pX9DfmgwMO/UaR6rnbJqZlKuakW1LaoAONTkMIEGK/bO32NxNjl1f91/yHVRZY3a03FZ9DYPKN39q7yX0IrkhIMCvk7VAwDIM1TUFHFtnz73XbbSbGvC8Z9DmIjFepVuXPC9r/F1Rc8BP5fzLA/QcKp0VqDPw1wRvxF5pXR4EJxUa5E3Q4GV6w9gi5u07E3s4s5GmzaR1oy6cCTVSGzs8BAYiTWMuho8h6uqwH0qa61sknHA+nUNzYXM+J/11By55rFEJRjZxrOwz169EMUXuVzo95ZHY4vIC7s+OqbDwi4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uxy+iibRgZJsxD2FBuwLmyLiiHsB1y7yvYpDYa6T/JU=;
 b=nXaeqC88imFi3ytCyr+kGTZRwjCsg0E0NGtRi5JhjL/Ca5+DrxUBOAF37BYpkDSooIGV58t0pEdiQ9ZOgQKu6qwqCNIxY1jLraTH5ydGoiee8KYEYEQYab1415sWRzr7Y5z/Q/tJ2zylLoYOMsVCl4LJVWHTt1fGwuRCKRxB+VqGamzdoyG2Q9ckKjjuxHgotHlTZglkQ9JRKUy1jOkQhcuVkcR0c67ebW+NIFd98DAZBCBz3eO7VpL3TBGqQVDE0r9AhzUGwo0LPB1eaNUqBLsT8bSX8dO/ipg3CKfzJmFLR192E0o+ybFNxwuQKmtxHFKdTcLNVdA1cQcj09ILLg==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
        "paul@xen.org"
	<paul@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        Jan Beulich <jbeulich@suse.com>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v4 05/11] vpci/header: implement guest BAR register
 handlers
Thread-Topic: [PATCH v4 05/11] vpci/header: implement guest BAR register
 handlers
Thread-Index: 
 AQHX0hJK3jTao+VT7Ua3mM5UrGfltKwK1UUAgAADYYCAAAeUgIAAApWAgAAAtgCAAAGSgIAAAk+AgAZuEACAAWUGAIAAAT8A
Date: Wed, 24 Nov 2021 12:36:45 +0000
Message-ID: <338425ac-e2c7-4de5-16ad-7b4e15084382@epam.com>
References: <20211105065629.940943-1-andr2000@gmail.com>
 <20211105065629.940943-6-andr2000@gmail.com>
 <6aa1a947-cfc8-ec05-e5a5-151d36fc432c@suse.com>
 <713a0443-b2a4-3c29-7072-ba18970fe6f9@epam.com>
 <44a22c22-62aa-d04f-cc43-d7a64cedbe15@suse.com>
 <6c61bd19-228a-fc12-eb64-00c8c5340292@epam.com>
 <ed2a6b5c-6e3a-07ca-a2f0-532a0de10329@suse.com>
 <c3b58e3c-9644-6e74-5ca1-25df33028b71@epam.com>
 <bab431c0-c4b4-09e4-cc3e-32ec8b3f5c7e@suse.com>
 <3192ef9d-c014-df72-91c9-13386bb584e7@epam.com>
 <YZ4w0AoZ6Af/Dnl5@Air-de-Roger>
In-Reply-To: <YZ4w0AoZ6Af/Dnl5@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: edcb555f-5b46-4762-de0e-08d9af4713ac
x-ms-traffictypediagnostic: AM4PR0301MB2194:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM4PR0301MB21944848E59E15D6B2F818B9E7619@AM4PR0301MB2194.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 JSKOxQQ1+oDPor0YpUjGzsT3JHsu4Y50T5bDkyWeQ40u9PQq5AOwvO0TKfh/qQyTa7Ky/vN7d1LZarmli1UTeCj10PsmyASp/qbQ5v1Gmt+zM9DMI8TCwLr7quEVIi5t/D2BK2BtS3c2GBxHKwpMv1E8+2dbZH3sxiRTgCSy1xNk1XBwn1oLPsTvel0fdyC7l61n2/vNKjIBs9CfQx3NmkLTLxqwWfpKuCXMyJgwLaeSALCbFGHxvhnAS4F3uSGnEy75MdoaY3LDnFryLBTxNyHY0Ul+F2T+Z7kt4kIxDbgQFoAPricRHm8GAOCJde8ZYSeotP0rztmgPdUhcwUN/U/3/2bM8i1e0cAr8mx98hJx9dt323V7BwOqIblZ9BjXp743hTvafhNKMCob+O0c6JJ34lMO8zs/RdZHbfWkxy1EYTvGYaJPkCDy+5UJT9PI/rKMmMCTEs8q5uL1aOfHsxCgzYAof7u2QeLE+t0JE2qy+Eh3v4SCxkLccg7Kjdin70rtgOwvSJjJUV8ZoDGoP4AJ0dVWhxxvlbC+AeLlJmLiOu8ZlTw1U3xE5+Updcu782YODtLMZUCifcqqDeHte5ME8HB3Y83f57PAz4EDLGV8/M6LCgimeest3AyOuVmEXLRMkHmPQ2TOxS5dUoEvZLzsnvsSiYN0NjbwW+ctTwM2XS3nK0ez2PCPbi+BGBVdOv7aTWDrt4ypeam985vnvlkQif+gZasrRoES7DexpOuPDe/lmioy46zL/wZvAWXx
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2616005)(508600001)(4326008)(107886003)(26005)(8936002)(31696002)(6512007)(71200400001)(38070700005)(86362001)(6506007)(53546011)(5660300002)(2906002)(8676002)(186003)(316002)(122000001)(76116006)(54906003)(6916009)(6486002)(66946007)(66446008)(64756008)(66556008)(66476007)(91956017)(31686004)(7416002)(38100700002)(36756003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZE0yOUZSRmNnUzdUUGRnb3I4a3pNTTlkVHB1dkhVVHhXMXErTStIMW5FMGgr?=
 =?utf-8?B?NlVraVVvRGlpdC9IOFBES2N2Z1F1Vi9NVTRPN2Z4SHJRbUNWZlhwZG9MZjgv?=
 =?utf-8?B?WkJGS1F6MnY0WFdwdW4wdElKVGdMcHZaUlJacmk1MFZFODdTbXlDZGd2WDFL?=
 =?utf-8?B?blNQQktiWHFyNlVEaDRyZlR6NXhpdUt1STNZRnRvR25SUFU5RU0raUhFRk55?=
 =?utf-8?B?dU51MUYvL2lJUlFhNHlYU0RVT25mYmJRMkVaUHZWVEd5N0NiOWdxeHVLOTVJ?=
 =?utf-8?B?Tzg1dkk1U2taUDlRN05KNlJwSmloTjJqb3NnaE9hd3Y0L2hZblhEZ1o1ZE4w?=
 =?utf-8?B?R1MzUC9wa0p4YzhyYlpNdFo0ZFByUHZmTFUrVmg1anlzbG54ejVXKzIwTDdE?=
 =?utf-8?B?dFdnbk0vUVRlODZkM3BETlY5bEhLQUhtcythN0Z3VFdneUQxUXRRNVpaNkpL?=
 =?utf-8?B?Ni94SjhvNGw2dURXRmlkMWYxZVA5U0d1MDArS0ptWDhya2ZTRXZDSGkwVWlx?=
 =?utf-8?B?eWdFcXBGcXlzTkQxL0R4dW5BaVRFL1d4U3h1TFZORzFhbFN5bm9WVXhhWVkv?=
 =?utf-8?B?a1NtWlQrOGlaR2IwdlhtdjVWQnBEUHhXT3daNWZIWWltMHFvVFcwNGhiU0s5?=
 =?utf-8?B?Y3FXck11VElvZVJ0V1dJUEJjaEIzdDgvSEgvRWdVL3VTeld2cy8yUHlmNjlh?=
 =?utf-8?B?aTJIaUdMZ1UrN1JTRmtvMWJOTG4xRlo4WVczdnFHMnVsTWdqaW9lMFcyaVRK?=
 =?utf-8?B?MW5JeUVpOUZiN1JSMERyK216WmFIcnNERlFMU0NLQXNpT2VYYVpwZHBNMlRF?=
 =?utf-8?B?TmhxTDVNUDl0NVBadGFrMlU3anorRHBMZmJ6VHkzZ050MU9RMWl1Z0xtZDNH?=
 =?utf-8?B?bzJtMHNrVzdmdndnay9wZlA5bGl2SVVkWEFOTmFSSHYzcnZjU043bmtjMHVu?=
 =?utf-8?B?R1lnWnJNQnJOMytiWFI3M2JsQ1hEY0VuRGZRdGJnejBHRlppdVIwbkpRYWhw?=
 =?utf-8?B?N3BvZDU2elVpRGh1R3lEZ3ovTk1hUFN2ZVg2ZVQrc0pXUW9zekVDRzFMbm40?=
 =?utf-8?B?S2RtVkw1amFiUitIQUgwN3RsY0pRM2RhbmlpSUdJR0VzVG5ic1NRMC9pNFpO?=
 =?utf-8?B?STF3b3VURmxrSHlSK05pZE9jbWs4TFF2Wi9JbGt6VU9ZNldhNGlSRGlEck5E?=
 =?utf-8?B?cGdjWkE5Y0ZrZDEzUFYxYkdnZk9VNmtGenl4MFBDY2VQVDFkU1dROFNjS2N6?=
 =?utf-8?B?NTVHYmdjZkhub2Zhbi9XN2lyT0JRanJFeGtNRnBXYU5rYXdyNVVWcFM4L1lM?=
 =?utf-8?B?SFl3NDc1dDZWNTZsaGlSOEc2NmFxMVlVSVh5UVlnU1A4YlZGUUdFNDhVUmFo?=
 =?utf-8?B?eDZZYyt2cEhQaGJ3UWxMTWluZTM0akRGaDE3bmR2K2xHdTBBelJrTXFGSnZi?=
 =?utf-8?B?WGVjKzlqbmpibmZBZGFQSVI0a3VWeWRacUMxM25TNWpXa3VmRUVpMFZqeUhi?=
 =?utf-8?B?YURncGxrQ1Zrd3daUWN5UFJVNjNKcDVqdUQ4VzFyT0dLdHVTeWNLTGk4VTFL?=
 =?utf-8?B?bTM3dUFJaGd6THdIem5qSVNuMHMxRWw1Rm1VWm5lcnBDTDVjMVRkQzB4aFha?=
 =?utf-8?B?b2M0WkhKajZPNS8xMkt1Z2cxaE9ta0s2YUQzRkNmMk0zdWZIQTcwVzltRGRU?=
 =?utf-8?B?RStTNi8vajJOWldYdGIwcVBWNmRrSDhHYmp0VTM0ZlBtd0lBUlpZd2Jjb2lO?=
 =?utf-8?B?dG50VjVZbmRGZWRvMUZyUFVFWmt2MGJBNEhLWEMzUm9DOVhWWVB5MW9iU0U3?=
 =?utf-8?B?dmZJa0VBUWltUi8wMFRPdXJXZ21GN204NlJ5UXZEb3h0M1N3a3dBOXUwT3FX?=
 =?utf-8?B?UGc5R1R2bm5OdjdtS0YvVWwxd2RIRlk0RWtrelVvRjQveER2bmwrYldxVld2?=
 =?utf-8?B?NEhzWmNiRkxnSXpiMkpiV3g1WkhLKzFJQmU1RUx1K3N2eWxkVHR5YkNTcUx4?=
 =?utf-8?B?Ukg1Um04bWlMWmx1U2NpOUpKeGo2b3hHeGhqQWx1Z0Q2ZGVuRWRKTG05QVk4?=
 =?utf-8?B?UDVJTFkzNFVzWEtzbGUwd3dacDJDNEdDd1FwVXN4bHlzTDg5eS8rQ3MrM2Fn?=
 =?utf-8?B?M3ZlRTYyRHpzdzZ5NXBJcFV5eGRzbWF4dXVUaThHTjJkaWk1cnptVHZ6OEFl?=
 =?utf-8?B?S0VtME1tSkNrTnA0eE9QSXVEQ1FqTzhsR2dIWGsyTG1QR1ZQdGtFaEdFYXRl?=
 =?utf-8?B?RlRxbmw2NXRLOHZydXhOYWRhWHNmT2FGU0hPV21vMVUvRHdJaU9ocVdpVm1t?=
 =?utf-8?B?V0pqeGNjZy9iK2Q5Rk0yYmF2RnR4SmE4Qjl3K0xkamVQSVROTm1ZQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C2270E5732264B4689A0F44EC36653DE@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edcb555f-5b46-4762-de0e-08d9af4713ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2021 12:36:45.5309
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eR2Fn6eCSjvtleIGSEH6lol868zcu0qPy6i7UTiVMGlq91jboaWMmF/N+Z5+KdsVkex6rMEICL9cOgA0VeXQ17feHEu/2WJG1SpB6e0tmByrOfTxvwhShO1oPULSpUDS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0301MB2194
X-Proofpoint-ORIG-GUID: 9z82KFhniKy-ySXhh4FJNfGAyHCcNoZz
X-Proofpoint-GUID: 9z82KFhniKy-ySXhh4FJNfGAyHCcNoZz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-24_04,2021-11-24_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 mlxscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 mlxlogscore=999
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111240070

DQoNCk9uIDI0LjExLjIxIDE0OjMyLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBUdWUs
IE5vdiAyMywgMjAyMSBhdCAwMzoxNDoyN1BNICswMDAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byB3cm90ZToNCj4+IEhpLCBSb2dlciENCj4+DQo+PiBPbiAxOS4xMS4yMSAxNTowMiwgSmFuIEJl
dWxpY2ggd3JvdGU6DQo+Pj4gT24gMTkuMTEuMjAyMSAxMzo1NCwgT2xla3NhbmRyIEFuZHJ1c2hj
aGVua28gd3JvdGU6DQo+Pj4+IE9uIDE5LjExLjIxIDE0OjQ5LCBKYW4gQmV1bGljaCB3cm90ZToN
Cj4+Pj4+IE9uIDE5LjExLjIwMjEgMTM6NDYsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3Rl
Og0KPj4+Pj4+IE9uIDE5LjExLjIxIDE0OjM3LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+Pj4g
T24gMTkuMTEuMjAyMSAxMzoxMCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+
Pj4+PiBPbiAxOS4xMS4yMSAxMzo1OCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+Pj4+Pj4gT24g
MDUuMTEuMjAyMSAwNzo1NiwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+Pj4+
Pj4+IC0tLSBhL3hlbi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmMNCj4+Pj4+Pj4+Pj4gKysrIGIveGVu
L2RyaXZlcnMvdnBjaS9oZWFkZXIuYw0KPj4+Pj4+Pj4+PiBAQCAtNDA4LDYgKzQwOCw0OCBAQCBz
dGF0aWMgdm9pZCBiYXJfd3JpdGUoY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYsIHVuc2lnbmVk
IGludCByZWcsDQo+Pj4+Pj4+Pj4+ICAgICAgICAgICBwY2lfY29uZl93cml0ZTMyKHBkZXYtPnNi
ZGYsIHJlZywgdmFsKTsNCj4+Pj4+Pj4+Pj4gICAgICAgfQ0KPj4+Pj4+Pj4+PiAgICAgICANCj4+
Pj4+Pj4+Pj4gK3N0YXRpYyB2b2lkIGd1ZXN0X2Jhcl93cml0ZShjb25zdCBzdHJ1Y3QgcGNpX2Rl
diAqcGRldiwgdW5zaWduZWQgaW50IHJlZywNCj4+Pj4+Pj4+Pj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB1aW50MzJfdCB2YWwsIHZvaWQgKmRhdGEpDQo+Pj4+Pj4+Pj4+ICt7DQo+Pj4+
Pj4+Pj4+ICsgICAgc3RydWN0IHZwY2lfYmFyICpiYXIgPSBkYXRhOw0KPj4+Pj4+Pj4+PiArICAg
IGJvb2wgaGkgPSBmYWxzZTsNCj4+Pj4+Pj4+Pj4gKw0KPj4+Pj4+Pj4+PiArICAgIGlmICggYmFy
LT50eXBlID09IFZQQ0lfQkFSX01FTTY0X0hJICkNCj4+Pj4+Pj4+Pj4gKyAgICB7DQo+Pj4+Pj4+
Pj4+ICsgICAgICAgIEFTU0VSVChyZWcgPiBQQ0lfQkFTRV9BRERSRVNTXzApOw0KPj4+Pj4+Pj4+
PiArICAgICAgICBiYXItLTsNCj4+Pj4+Pj4+Pj4gKyAgICAgICAgaGkgPSB0cnVlOw0KPj4+Pj4+
Pj4+PiArICAgIH0NCj4+Pj4+Pj4+Pj4gKyAgICBlbHNlDQo+Pj4+Pj4+Pj4+ICsgICAgew0KPj4+
Pj4+Pj4+PiArICAgICAgICB2YWwgJj0gUENJX0JBU0VfQUREUkVTU19NRU1fTUFTSzsNCj4+Pj4+
Pj4+Pj4gKyAgICAgICAgdmFsIHw9IGJhci0+dHlwZSA9PSBWUENJX0JBUl9NRU0zMiA/IFBDSV9C
QVNFX0FERFJFU1NfTUVNX1RZUEVfMzINCj4+Pj4+Pj4+Pj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICA6IFBDSV9CQVNFX0FERFJFU1NfTUVNX1RZUEVfNjQ7DQo+
Pj4+Pj4+Pj4+ICsgICAgICAgIHZhbCB8PSBiYXItPnByZWZldGNoYWJsZSA/IFBDSV9CQVNFX0FE
RFJFU1NfTUVNX1BSRUZFVENIIDogMDsNCj4+Pj4+Pj4+Pj4gKyAgICB9DQo+Pj4+Pj4+Pj4+ICsN
Cj4+Pj4+Pj4+Pj4gKyAgICBiYXItPmd1ZXN0X2FkZHIgJj0gfigweGZmZmZmZmZmdWxsIDw8ICho
aSA/IDMyIDogMCkpOw0KPj4+Pj4+Pj4+PiArICAgIGJhci0+Z3Vlc3RfYWRkciB8PSAodWludDY0
X3QpdmFsIDw8IChoaSA/IDMyIDogMCk7DQo+Pj4+Pj4+Pj4+ICsNCj4+Pj4+Pj4+Pj4gKyAgICBi
YXItPmd1ZXN0X2FkZHIgJj0gfihiYXItPnNpemUgLSAxKSB8IH5QQ0lfQkFTRV9BRERSRVNTX01F
TV9NQVNLOw0KPj4+Pj4+Pj4+PiArfQ0KPj4+Pj4+Pj4+PiArDQo+Pj4+Pj4+Pj4+ICtzdGF0aWMg
dWludDMyX3QgZ3Vlc3RfYmFyX3JlYWQoY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYsIHVuc2ln
bmVkIGludCByZWcsDQo+Pj4+Pj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
dm9pZCAqZGF0YSkNCj4+Pj4+Pj4+Pj4gK3sNCj4+Pj4+Pj4+Pj4gKyAgICBjb25zdCBzdHJ1Y3Qg
dnBjaV9iYXIgKmJhciA9IGRhdGE7DQo+Pj4+Pj4+Pj4+ICsgICAgYm9vbCBoaSA9IGZhbHNlOw0K
Pj4+Pj4+Pj4+PiArDQo+Pj4+Pj4+Pj4+ICsgICAgaWYgKCBiYXItPnR5cGUgPT0gVlBDSV9CQVJf
TUVNNjRfSEkgKQ0KPj4+Pj4+Pj4+PiArICAgIHsNCj4+Pj4+Pj4+Pj4gKyAgICAgICAgQVNTRVJU
KHJlZyA+IFBDSV9CQVNFX0FERFJFU1NfMCk7DQo+Pj4+Pj4+Pj4+ICsgICAgICAgIGJhci0tOw0K
Pj4+Pj4+Pj4+PiArICAgICAgICBoaSA9IHRydWU7DQo+Pj4+Pj4+Pj4+ICsgICAgfQ0KPj4+Pj4+
Pj4+PiArDQo+Pj4+Pj4+Pj4+ICsgICAgcmV0dXJuIGJhci0+Z3Vlc3RfYWRkciA+PiAoaGkgPyAz
MiA6IDApOw0KPj4+Pj4+Pj4+IEknbSBhZnJhaWQgImd1ZXN0X2FkZHIiIHRoZW4gaXNuJ3QgdGhl
IGJlc3QgbmFtZTsgbWF5YmUgImd1ZXN0X3ZhbCI/DQo+Pj4+Pj4+Pj4gVGhpcyB3b3VsZCBtYWtl
IG1vcmUgb2J2aW91cyB0aGF0IHRoZXJlIGlzIGEgbWVhbmluZ2Z1bCBkaWZmZXJlbmNlDQo+Pj4+
Pj4+Pj4gZnJvbSAiYWRkciIgYmVzaWRlcyB0aGUgZ3Vlc3QgdnMgaG9zdCBhc3BlY3QuDQo+Pj4+
Pj4+PiBJIGFtIG5vdCBzdXJlIEkgY2FuIGFncmVlIGhlcmU6DQo+Pj4+Pj4+PiBiYXItPmFkZHIg
YW5kIGJhci0+Z3Vlc3RfYWRkciBtYWtlIGl0IGNsZWFyIHdoYXQgYXJlIHRoZXNlIHdoaWxlDQo+
Pj4+Pj4+PiBiYXItPmFkZHIgYW5kIGJhci0+Z3Vlc3RfdmFsIHdvdWxkIG1ha2Ugc29tZW9uZSBn
byBsb29rIGZvcg0KPj4+Pj4+Pj4gYWRkaXRpb25hbCBpbmZvcm1hdGlvbiBhYm91dCB3aGF0IHRo
YXQgdmFsIGlzIGZvci4NCj4+Pj4+Pj4gRmVlbCBmcmVlIHRvIHJlcGxhY2UgInZhbCIgd2l0aCBz
b21ldGhpbmcgbW9yZSBzdWl0YWJsZS4gImd1ZXN0X2JhciINCj4+Pj4+Pj4gbWF5YmU/IFRoZSB2
YWx1ZSBkZWZpbml0ZWx5IGlzIG5vdCBhbiBhZGRyZXNzLCBzbyAiYWRkciIgc2VlbXMNCj4+Pj4+
Pj4gaW5hcHByb3ByaWF0ZSAvIG1pc2xlYWRpbmcgdG8gbWUuDQo+Pj4+Pj4gVGhpcyBpcyBhIGd1
ZXN0J3MgdmlldyBvbiB0aGUgQkFSJ3MgYWRkcmVzcy4gU28gdG8gbWUgaXQgaXMgc3RpbGwgZ3Vl
c3RfYWRkcg0KPj4+Pj4gSXQncyBhIGd1ZXN0J3MgdmlldyBvbiB0aGUgQkFSLCBub3QganVzdCB0
aGUgYWRkcmVzcy4gT3IgZWxzZSB5b3UgY291bGRuJ3QNCj4+Pj4+IHNpbXBseSByZXR1cm4gdGhl
IHZhbHVlIGhlcmUgd2l0aG91dCBmb2xkaW5nIGluIHRoZSBjb3JyZWN0IGxvdyBiaXRzLg0KPj4+
PiBJIGFncmVlIHdpdGggdGhpcyB0aGlzIHJlc3BlY3QgYXMgaXQgaXMgaW5kZWVkIGFkZHJlc3Mg
KyBsb3dlciBiaXRzLg0KPj4+PiBIb3cgYWJvdXQgZ3Vlc3RfYmFyX3ZhbCB0aGVuPyBTbyBpdCBy
ZWZsZWN0cyBpdHMgbmF0dXJlLCBlLmcuIHRoZSB2YWx1ZQ0KPj4+PiBvZiB0aGUgQkFSIGFzIHNl
ZW4gYnkgdGhlIGd1ZXN0Lg0KPj4+IEdldHMgYSBsaXR0bGUgbG9uZ2lzaCBmb3IgbXkgdGFzdGUu
IEkgZm9yIG9uZSB3b3VsZG4ndCBtaW5kIGl0IGJlIGp1c3QNCj4+PiAiZ3Vlc3QiLiBJbiB0aGUg
ZW5kIFJvZ2VyIGhhcyB0aGUgZmluYWwgc2F5IGhlcmUgYW55d2F5Lg0KPj4gV2hhdCBpcyB5b3Vy
IHByZWZlcmVuY2Ugb24gbmFtaW5nIGhlcmU/DQo+PiAxLiBndWVzdF9hZGRyDQo+PiAyLiBndWVz
dF92YWwNCj4+IDMuIGd1ZXN0X2Jhcl92YWwNCj4+IDQuIGd1ZXN0DQo+IEkgdGhpbmsgZ3Vlc3Rf
cmVnIHdvdWxkIGJlIGZpbmU/DQo+DQo+IE9yIGFsdGVybmF0aXZlbHkgeW91IGNvdWxkIG1ha2Ug
aXQgYSBndWVzdCBhZGRyZXNzIGJ5IGRyb3BwaW5nIHRoZSBsb3cNCj4gYml0cyBhbmQgYWRkaW5n
IHRoZW0gaW4gdGhlIHJlYWQgaGFuZGxlciBpbnN0ZWFkIG9mIGRvaW5nIGl0IGluIHRoZQ0KPiB3
cml0ZSBoYW5kbGVyLg0KU28sIGxldCBpdCBiZSAiZ3Vlc3RfcmVnIiB0aGVuDQo+DQo+IFRoYW5r
cywgUm9nZXIuDQpUaGFuayB5b3UsDQpPbGVrc2FuZHI=

