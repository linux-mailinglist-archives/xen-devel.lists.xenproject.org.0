Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A33FA4AC043
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 14:54:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.266951.460652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH4Sh-0004wq-GA; Mon, 07 Feb 2022 13:53:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 266951.460652; Mon, 07 Feb 2022 13:53:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH4Sh-0004v1-Cg; Mon, 07 Feb 2022 13:53:47 +0000
Received: by outflank-mailman (input) for mailman id 266951;
 Mon, 07 Feb 2022 13:53:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F54n=SW=epam.com=prvs=403792ff6c=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nH4Sg-0004uv-0N
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 13:53:46 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 567d4182-881d-11ec-8f75-fffcc8bd4f1a;
 Mon, 07 Feb 2022 14:53:34 +0100 (CET)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 217Dm9A1019379;
 Mon, 7 Feb 2022 13:53:38 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2110.outbound.protection.outlook.com [104.47.17.110])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3e2w1r20r1-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 13:53:38 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by DBBPR03MB6777.eurprd03.prod.outlook.com (2603:10a6:10:205::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Mon, 7 Feb
 2022 13:53:34 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77%3]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 13:53:34 +0000
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
X-Inumbo-ID: 567d4182-881d-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mxtcviru0bND9VXyWEcTB6LEdiK6Ddy1lLopw7uDYn7B8x3ddCkacQbTYM7Ie6VLx906o2eEHA5iTX7I9OTvYcIO5VQ2CxJHBwoECze1Ian+7+tgpvKHkT8P/LW+hME4wkOu3oyEAWstgaobz+ihNlvt20f0ViHSBWc7gpTP9MxK66HhpdnaROc+Tg2w+gWmyUU9m3co8LOt3UoccaDyVF5wJIbyvgfCCzxHFdj0S9IBtEfoiTLGEJ/R14FYekHZeZSSMWSU32yy7Z7CcZf8UZGxDYnv95VALf2UsjUNlp4TCHpXgoGRvlhzQfAnDd1RxIDnTGiLjOJN+z7Fds0gKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i9BpWkJI0qKeVQk+iJq1PdNxbNzJBvxpV5JA6TXAlYQ=;
 b=CjLXIn5OfpvTwNoc5P6uXLF14mWY+Hgbpqn4GCBm0gMqjTb4cInh+oJg510MeJ3C0aY4TTva/o7s0FRQyQENedMrCr3/rQwuCsST4CAbUzFJe1vUFLA/MzwDyZ/U11rH4oL5Ojd5puAk38QAJNHO3+5wTkkohYtGvDj7IHCh7WJAN1wSXi6F5cbFCW8Qb7lRCI8FnPwLSDcldEtd/6fUHJ/CafHjN/jQRCMire/kryQFsgggw4DCgjv5NagkRPa3xBd7UOFBHL8ODeAZAMdbdBjJZAQgT1L05qoMIx44qbNiy/FcXVaoLUQ4zfmJIopJu05tBGphUwhvioycfKhCsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i9BpWkJI0qKeVQk+iJq1PdNxbNzJBvxpV5JA6TXAlYQ=;
 b=UfnbM1ZIcI4oP0qlqos88vOkdJqv/kfU1hAJ+01RlHkI445+7Huf3DpYFGDj5h7T5fwNyX+pYmpauiDbqEH+4ke/v5dEUmrwj64PjU8sHpLwbU5MEO7KC7Y9TpuYQX7crOXhswwbRiaSlVIt9onQ4PZ1+Y1kF6AGZfLFSEKBvqm9r7HiP13S4wxy77dcePCuEBKwvXvbX1D5GYl24ZPzyXyk2gSH0nvmkzlNQloYl00LB1yXUJ1jMBGIlUu3EjShFufW7zSuKbuLcdvHCl+ITpiR43WqO9ttHtV8ajRgY5PSREP7b7UE/dhHGmZhNaSXdvkaKOhGIoTDb3HwrjPFiA==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
        Jan Beulich
	<jbeulich@suse.com>
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
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v6 03/13] vpci: move lock outside of struct vpci
Thread-Topic: [PATCH v6 03/13] vpci: move lock outside of struct vpci
Thread-Index: 
 AQHYGZFc/MnzQOjwVEeBBUHLSW0md6yDBUkAgAASSACAAATYAIAAD/WAgAAKNgCAAAbfgIAABnuAgAAQvgCAAAMCAIAAAY4AgAADxICAABrnAIAABAgAgAR3CoCAABt5gIAAEpuA
Date: Mon, 7 Feb 2022 13:53:34 +0000
Message-ID: <9ce90193-74a0-5642-d22b-6b8c3340c3cf@epam.com>
References: <c3a99712-cf7c-37da-aac1-f2ee00e6d53b@suse.com>
 <Yf0KcVD8W05A4fbB@Air-de-Roger>
 <1ed0e342-16cd-2f16-c05c-186667a22762@suse.com>
 <7e3562b5-fc67-f213-e872-f211450d9e2e@epam.com>
 <a8fc599c-f620-c4d1-2077-c57068f46a7f@suse.com>
 <deef8468-d607-e49e-f456-6a8013329ca1@epam.com>
 <Yf0k6aoKK5G3iad1@Air-de-Roger>
 <3ad10a99-c706-b95f-1419-2c0c7cf37d58@epam.com>
 <Yf0+3C9nF8+tewLw@Air-de-Roger>
 <c5fea3bb-834b-eeb7-d7a1-1ee609037a9f@epam.com>
 <YgEUwTxhnWVMGMJK@Air-de-Roger>
In-Reply-To: <YgEUwTxhnWVMGMJK@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 18c0a388-fb8a-4c03-20d9-08d9ea413bc3
x-ms-traffictypediagnostic: DBBPR03MB6777:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <DBBPR03MB6777BA2975157C6DB8E59B3BE72C9@DBBPR03MB6777.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 BaW2lP8c6SmO/xEoO+Ag9XneN9K+m3t27XOcKVpFyPWGCbj4KSTO+keLRN7Nxei5gU9+RVY9PlK2pEMKQ6HXPpcIYSUN+MgH0IjOH/qfpLjf899LQ5Go4Eb8223EwM4vNeLHYYgjRj18bd98vWhVusJOUz2rAegHxieTvCMItvkKncRtpbETOHuucRsyCKwAO9NT6Z1IvOSgD2CH+BX76yEhXrd16oSJVmpq0fkZV4zJMzTgN5l8I3i0RKWu6E84096/c3YaJa7cxIrTUfJQvLli972cWtxLSSKaOQRA8WmHNJMpSjIMiiZCe96iipfhFCNmVDqMmLTB7oLl++lNcOd/akWhxYjslnVhy5YJMdx3VLSSm4jdYAQHzxaOn/8gsZ8FIVnZ1IwtFjA8RsdyE6sjxmvZ8quI/M+aKamD47aNlKizK8S8W4+welCD2FP5AYtD7hf0dj/GX4YhQKy5RzplCK/cxBl54Ik74QHr3qzZ3BWoWes5aapVnLX0YQW/waqHrXq0xJQZRtgbUSEM/74uyrp1WIUfkjcr0hzB8hWk12vnFQyV71XJE/1Bv3I2Ryyfyi2CT/8iyhZsI4HFDzF6kMYO8w/9s+omzvx7fBN2u6oyvLEUCeArT+1S8vCT767uwvp5o+l7+gzKCvq+Gmu4+h3oUgLcCTVbXCXj6XwDspSvn0YtqHlIAFS1/7ChR0QJNVxK2eV8TV1cnxTmGN6RjJ2Lxj6aMkzaawT/VtqhoD7U47Q60sydW0gqfOK8
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(5660300002)(107886003)(2906002)(83380400001)(30864003)(6486002)(7416002)(55236004)(53546011)(36756003)(31686004)(26005)(2616005)(71200400001)(6506007)(508600001)(6512007)(186003)(38070700005)(54906003)(38100700002)(31696002)(66946007)(86362001)(66476007)(66556008)(316002)(4326008)(64756008)(66446008)(110136005)(76116006)(122000001)(8936002)(8676002)(91956017)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eGVISlExOUoxL2I4VUo5MUkrRkVmbnUrQXIrWU1mUWdXUjlJaUhOQkpXOHk3?=
 =?utf-8?B?bzZnblhZREFHTk1LTHdkQnFnazQ1eFhQMUlLbzFadGswZnUrQUtQLzVnREpY?=
 =?utf-8?B?cWlVREVObTIySWZHZCtTOXpyWXZ0U1FTbkI3QXAxcWVUV2NzNWE4bjhNNENN?=
 =?utf-8?B?N0w5MEpwSGFnTGJvaUsxeDBKUS9KdGtmcksvcmgyZ3VDM2wzQ2VGZEJENVhK?=
 =?utf-8?B?aUVLQnNUTXhLRGtOdVM5bk9HamZwOEdBRWliWFhUWTZTR01ONGJmcVNLdjFD?=
 =?utf-8?B?R3poTngreDRkVVBrblJtbHMwWkpJTEh4NjhmMktWeStvS1puMmFlNlBrZVY5?=
 =?utf-8?B?YUJKbDUrRjErTU1WSk9va3lBYWZncm0wMkphMlViVXZCcVlNN3Q0NUVVQ0Fa?=
 =?utf-8?B?cnZ6V3d3YWMzVVFMcEZQUERNaUZ4cThpa00xcFd4SCs5Z0xWeW5EYmlacTA5?=
 =?utf-8?B?RUxrSEhJcnFZaTlLR1EwVVdUbm1nZlF2Yk1CVnJXbFNBZXR4cFhIdHprUVNM?=
 =?utf-8?B?djM5VzZ4Vy90RTR5Nms3MDVLRlpsSXNheWsrenRTcGljMEtPa05BcEEwWXBo?=
 =?utf-8?B?MWVZbVZzZkNhS1k4MDBSYVlVWklvM0sxNWJ0QmNISmNtS3lsTytXT1l2cGcx?=
 =?utf-8?B?eWREeXJqck4yb0pHVDBaS3pIWVdDTXdvRGFkdGtLMDgvMHNFaFF1WUIvaUoz?=
 =?utf-8?B?Zm9IMXcxYjdoWDNrOGJlZXpLTElmK0RLdmsxSDJESVJoYmp3U0hVK0RqVnEr?=
 =?utf-8?B?VjhxU0xBY24xcHZsTTE1ZExTaXpXelNCUW1KdWtxaFQxWVZkeUFDQi9INXZm?=
 =?utf-8?B?cmF1d2lJMFhsdmVON1ZZeURZaUx5QUJ2enhLZ0FYZFdoalk0QmQyUFppVmlv?=
 =?utf-8?B?eU13R1J1N1RQMXIyTVV3bi9iZ0VLeE1ZWUJwRlV2SENtN3ZLN0tqSjBQU3VH?=
 =?utf-8?B?SktLUmFtSmp5R09jM29yQ0dKZGJ4aExjemR0RlphNE8rd2UxaE1uZ2JXbjlv?=
 =?utf-8?B?TEtvV2JOT3dFU0tRYlNzYXZuRXJxanFMRmJKRCs2TVN2WHV2WGRFcXdZcnhq?=
 =?utf-8?B?L2JXeXkwdVUrUDVqUGdoSTVVT0hHR254d2w3dEsvVE5hcVRHb1RpcGYyRnJI?=
 =?utf-8?B?Z0J2WUEyVW9uOGgxRnFGVW5POUNBbGkwdXRpYnlIdU5kckxuc0JPakk2Q2dz?=
 =?utf-8?B?NEVxSDdISjAvYkxZbDV6aUdMajNLeGdqaUk0dTRuK244TzhPV3pidnR4bTJD?=
 =?utf-8?B?R3JNcVVXM3pnOGdmMGxmQ2E0ZGRyeG1LTVVtV1g4dE5oVlNOTXhWK3poRUxn?=
 =?utf-8?B?VEhPckxndXZFZFdDSDJjOFVDRDIyeXZiR0hoR3lkUVRCUjU5cXJTMUxSL3g4?=
 =?utf-8?B?bE1qNnY0d3R5WFZ4V0NWT1U3akRSd0dodStrS0Z6SnhPM3MxZmJZR3B3UTJP?=
 =?utf-8?B?TUNWWG9MUFhDV3JxQVNRMGtOdTRLYkdBK3dHQXlCOFNvSFlyQ2dFV2dDbTJV?=
 =?utf-8?B?cDkzclM1TWpOdzhod3ZZOXhwdEJoa1VueEpNM0tJSWppeTdLNnhiSnVKdEhT?=
 =?utf-8?B?dUx4SVUwSlhVYkQ1dExCZ3h5OC9hQ1ZJbStCTFB3U2JrcWVGaTZrSGxSc3Fh?=
 =?utf-8?B?RjlQSnhjR09mN2RSYWJkbnRsaTVHZTF6YXdsZ2Y0WU5seFVIMG9KMVpjNHY2?=
 =?utf-8?B?Si9WUlJxUEN0bG1lKzNKZWliWU45dGxqckI2SGY2RWFkemtCTlo1ZVVKSVdV?=
 =?utf-8?B?RWlqYXhCb0lidk9wQ3AyYVVUM3RsYUZ0RSsyWWkvU1NBN3ppaTlVMGpUTFo2?=
 =?utf-8?B?L0ZVOGFpek10V2ptUXZCT0hQemlEb3hMN2xNc2pTTzRvNXVYMEtPWXVrUnRk?=
 =?utf-8?B?ZkdFMWlZOVN3aU9XWW53VzRUcUwvUzd6UjFKMERDQnIwY3pEMmRrWUNyRHlR?=
 =?utf-8?B?UHd3Uy9QK21rSVdxNXZkY3QyQzREM01peDdaK2hNVU03VE5yQW1GZkFBcTlL?=
 =?utf-8?B?czNsNGZRdi9XTFNiZXVjb28xbTIyMGpoUGd0TDJIRTVBZ1U4ZlNRVG1kQS9i?=
 =?utf-8?B?akIwWlZlZisrQlZHaEs2dWRSZkR6akZqT0NYZzhKSEk2RS9xOURNUFJzUUdO?=
 =?utf-8?B?M3VvL0M3UVhLWVRPaEYwOGpKYTJaOWFLR3pEQW44TkRJU3RNT2ZmcUYycWVy?=
 =?utf-8?B?SkNQY2ZUMllFZThCS0VrSllHOWZzc3JXcW5QRGZrei92NUl6NFI2SGZ0Skxn?=
 =?utf-8?B?THVVYTJncU1uVmw1Qll6TFdjUEtuMkhNdEdWS2w4aUVHOGZsd3FlOWF2MnRy?=
 =?utf-8?B?aFJLMEVpUXJzRy9PamdybHFYMmJ1d1cwUGdWQngzcU14bEVDVStBQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7F27F0B1B7810F42A96B157F8C074390@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18c0a388-fb8a-4c03-20d9-08d9ea413bc3
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2022 13:53:34.4803
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: APkMHNEe6KlTDjWzqlAIufLJJXjhvmQ4Y1EOyO4qb/Yo3b9LyFMJ/qVm1/9mJWNQ/RV8+a0TJwDuV/Yc5YqJ60e4ZKHijC2WsDwW8wjhqL6JxUJXkaqnRiQWlVuNpGMN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB6777
X-Proofpoint-ORIG-GUID: m15yaJP7NnVIcyOsjXPehtmJss4v7uZr
X-Proofpoint-GUID: m15yaJP7NnVIcyOsjXPehtmJss4v7uZr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-07_05,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 adultscore=0
 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 mlxscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202070090

DQoNCk9uIDA3LjAyLjIyIDE0OjQ2LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBNb24s
IEZlYiAwNywgMjAyMiBhdCAxMTowODozOUFNICswMDAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byB3cm90ZToNCj4+IEhlbGxvLA0KPj4NCj4+IE9uIDA0LjAyLjIyIDE2OjU3LCBSb2dlciBQYXUg
TW9ubsOpIHdyb3RlOg0KPj4+IE9uIEZyaSwgRmViIDA0LCAyMDIyIGF0IDAyOjQzOjA3UE0gKzAw
MDAsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiBPbiAwNC4wMi4yMiAxNTow
NiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+Pj4+IE9uIEZyaSwgRmViIDA0LCAyMDIyIGF0
IDEyOjUzOjIwUE0gKzAwMDAsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+Pj4+
IE9uIDA0LjAyLjIyIDE0OjQ3LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+Pj4gT24gMDQuMDIu
MjAyMiAxMzozNywgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+Pj4+PiBPbiAw
NC4wMi4yMiAxMzozNywgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+Pj4+Pj4gT24gMDQuMDIuMjAy
MiAxMjoxMywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+Pj4+Pj4+Pj4gT24gRnJpLCBGZWIg
MDQsIDIwMjIgYXQgMTE6NDk6MThBTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+Pj4+
Pj4+PiBPbiAwNC4wMi4yMDIyIDExOjEyLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToN
Cj4+Pj4+Pj4+Pj4+PiBPbiAwNC4wMi4yMiAxMToxNSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+
Pj4+Pj4+Pj4+IE9uIDA0LjAyLjIwMjIgMDk6NTgsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdy
b3RlOg0KPj4+Pj4+Pj4+Pj4+Pj4gT24gMDQuMDIuMjIgMDk6NTIsIEphbiBCZXVsaWNoIHdyb3Rl
Og0KPj4+Pj4+Pj4+Pj4+Pj4+IE9uIDA0LjAyLjIwMjIgMDc6MzQsIE9sZWtzYW5kciBBbmRydXNo
Y2hlbmtvIHdyb3RlOg0KPj4+Pj4+Pj4+Pj4+Pj4+PiBAQCAtMjg1LDYgKzI4NiwxMiBAQCBzdGF0
aWMgaW50IG1vZGlmeV9iYXJzKGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2LCB1aW50MTZfdCBj
bWQsIGJvb2wgcm9tX29ubHkpDQo+Pj4+Pj4+Pj4+Pj4+Pj4+ICAgICAgICAgICAgICAgICAgICAg
ICAgIGNvbnRpbnVlOw0KPj4+Pj4+Pj4+Pj4+Pj4+PiAgICAgICAgICAgICAgICAgfQ0KPj4+Pj4+
Pj4+Pj4+Pj4+PiAgICAgICAgIA0KPj4+Pj4+Pj4+Pj4+Pj4+PiArICAgICAgICBzcGluX2xvY2so
JnRtcC0+dnBjaV9sb2NrKTsNCj4+Pj4+Pj4+Pj4+Pj4+Pj4gKyAgICAgICAgaWYgKCAhdG1wLT52
cGNpICkNCj4+Pj4+Pj4+Pj4+Pj4+Pj4gKyAgICAgICAgew0KPj4+Pj4+Pj4+Pj4+Pj4+PiArICAg
ICAgICAgICAgc3Bpbl91bmxvY2soJnRtcC0+dnBjaV9sb2NrKTsNCj4+Pj4+Pj4+Pj4+Pj4+Pj4g
KyAgICAgICAgICAgIGNvbnRpbnVlOw0KPj4+Pj4+Pj4+Pj4+Pj4+PiArICAgICAgICB9DQo+Pj4+
Pj4+Pj4+Pj4+Pj4+ICAgICAgICAgICAgICAgICBmb3IgKCBpID0gMDsgaSA8IEFSUkFZX1NJWkUo
dG1wLT52cGNpLT5oZWFkZXIuYmFycyk7IGkrKyApDQo+Pj4+Pj4+Pj4+Pj4+Pj4+ICAgICAgICAg
ICAgICAgICB7DQo+Pj4+Pj4+Pj4+Pj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3Ry
dWN0IHZwY2lfYmFyICpiYXIgPSAmdG1wLT52cGNpLT5oZWFkZXIuYmFyc1tpXTsNCj4+Pj4+Pj4+
Pj4+Pj4+Pj4gQEAgLTMwMywxMiArMzEwLDE0IEBAIHN0YXRpYyBpbnQgbW9kaWZ5X2JhcnMoY29u
c3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYsIHVpbnQxNl90IGNtZCwgYm9vbCByb21fb25seSkNCj4+
Pj4+Pj4+Pj4+Pj4+Pj4gICAgICAgICAgICAgICAgICAgICByYyA9IHJhbmdlc2V0X3JlbW92ZV9y
YW5nZShtZW0sIHN0YXJ0LCBlbmQpOw0KPj4+Pj4+Pj4+Pj4+Pj4+PiAgICAgICAgICAgICAgICAg
ICAgIGlmICggcmMgKQ0KPj4+Pj4+Pj4+Pj4+Pj4+PiAgICAgICAgICAgICAgICAgICAgIHsNCj4+
Pj4+Pj4+Pj4+Pj4+Pj4gKyAgICAgICAgICAgICAgICBzcGluX3VubG9jaygmdG1wLT52cGNpX2xv
Y2spOw0KPj4+Pj4+Pj4+Pj4+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICBwcmludGsoWEVO
TE9HX0dfV0FSTklORyAiRmFpbGVkIHRvIHJlbW92ZSBbJWx4LCAlbHhdOiAlZFxuIiwNCj4+Pj4+
Pj4+Pj4+Pj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0YXJ0LCBlbmQsIHJj
KTsNCj4+Pj4+Pj4+Pj4+Pj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgcmFuZ2VzZXRfZGVz
dHJveShtZW0pOw0KPj4+Pj4+Pj4+Pj4+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICByZXR1
cm4gcmM7DQo+Pj4+Pj4+Pj4+Pj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgfQ0KPj4+Pj4+Pj4+
Pj4+Pj4+PiAgICAgICAgICAgICAgICAgfQ0KPj4+Pj4+Pj4+Pj4+Pj4+PiArICAgICAgICBzcGlu
X3VubG9jaygmdG1wLT52cGNpX2xvY2spOw0KPj4+Pj4+Pj4+Pj4+Pj4+PiAgICAgICAgICAgICB9
DQo+Pj4+Pj4+Pj4+Pj4+Pj4gQXQgdGhlIGZpcnN0IGdsYW5jZSB0aGlzIHNpbXBseSBsb29rcyBs
aWtlIGFub3RoZXIgdW5qdXN0aWZpZWQgKGluIHRoZQ0KPj4+Pj4+Pj4+Pj4+Pj4+IGRlc2NyaXB0
aW9uKSBjaGFuZ2UsIGFzIHlvdSdyZSBub3QgY29udmVydGluZyBhbnl0aGluZyBoZXJlIGJ1dCB5
b3UNCj4+Pj4+Pj4+Pj4+Pj4+PiBhY3R1YWxseSBhZGQgbG9ja2luZyAoYW5kIEkgcmVhbGl6ZSB0
aGlzIHdhcyB0aGVyZSBiZWZvcmUsIHNvIEknbSBzb3JyeQ0KPj4+Pj4+Pj4+Pj4+Pj4+IGZvciBu
b3QgcG9pbnRpbmcgdGhpcyBvdXQgZWFybGllcikuDQo+Pj4+Pj4+Pj4+Pj4+PiBXZWxsLCBJIHRo
b3VnaHQgdGhhdCB0aGUgZGVzY3JpcHRpb24gYWxyZWFkeSBoYXMgIi4uLnRoZSBsb2NrIGNhbiBi
ZQ0KPj4+Pj4+Pj4+Pj4+Pj4gdXNlZCAoYW5kIGluIGEgZmV3IGNhc2VzIGlzIHVzZWQgcmlnaHQg
YXdheSkgdG8gY2hlY2sgd2hldGhlciB2cGNpDQo+Pj4+Pj4+Pj4+Pj4+PiBpcyBwcmVzZW50IiBh
bmQgdGhpcyBpcyBlbm91Z2ggZm9yIHN1Y2ggdXNlcyBhcyBoZXJlLg0KPj4+Pj4+Pj4+Pj4+Pj4+
ICAgICAgICAgQnV0IHRoZW4gSSB3b25kZXIgd2hldGhlciB5b3UNCj4+Pj4+Pj4+Pj4+Pj4+PiBh
Y3R1YWxseSB0ZXN0ZWQgdGhpcywgc2luY2UgSSBjYW4ndCBoZWxwIGdldHRpbmcgdGhlIGltcHJl
c3Npb24gdGhhdA0KPj4+Pj4+Pj4+Pj4+Pj4+IHlvdSdyZSBpbnRyb2R1Y2luZyBhIGxpdmUtbG9j
azogVGhlIGZ1bmN0aW9uIGlzIGNhbGxlZCBmcm9tIGNtZF93cml0ZSgpDQo+Pj4+Pj4+Pj4+Pj4+
Pj4gYW5kIHJvbV93cml0ZSgpLCB3aGljaCBpbiB0dXJuIGFyZSBjYWxsZWQgb3V0IG9mIHZwY2lf
d3JpdGUoKS4gWWV0IHRoYXQNCj4+Pj4+Pj4+Pj4+Pj4+PiBmdW5jdGlvbiBhbHJlYWR5IGhvbGRz
IHRoZSBsb2NrLCBhbmQgdGhlIGxvY2sgaXMgbm90IChjdXJyZW50bHkpDQo+Pj4+Pj4+Pj4+Pj4+
Pj4gcmVjdXJzaXZlLiAoRm9yIHRoZSAzcmQgY2FsbGVyIG9mIHRoZSBmdW5jdGlvbiAtIGluaXRf
YmFycygpIC0gb3RvaA0KPj4+Pj4+Pj4+Pj4+Pj4+IHRoZSBsb2NraW5nIGxvb2tzIHRvIGJlIGVu
dGlyZWx5IHVubmVjZXNzYXJ5LikNCj4+Pj4+Pj4+Pj4+Pj4+IFdlbGwsIHlvdSBhcmUgY29ycmVj
dDogaWYgdG1wICE9IHBkZXYgdGhlbiBpdCBpcyBjb3JyZWN0IHRvIGFjcXVpcmUNCj4+Pj4+Pj4+
Pj4+Pj4+IHRoZSBsb2NrLiBCdXQgaWYgdG1wID09IHBkZXYgYW5kIHJvbV9vbmx5ID09IHRydWUN
Cj4+Pj4+Pj4+Pj4+Pj4+IHRoZW4gd2UnbGwgZGVhZGxvY2suDQo+Pj4+Pj4+Pj4+Pj4+Pg0KPj4+
Pj4+Pj4+Pj4+Pj4gSXQgc2VlbXMgd2UgbmVlZCB0byBoYXZlIHRoZSBsb2NraW5nIGNvbmRpdGlv
bmFsLCBlLmcuIG9ubHkgbG9jaw0KPj4+Pj4+Pj4+Pj4+Pj4gaWYgdG1wICE9IHBkZXYNCj4+Pj4+
Pj4+Pj4+Pj4gV2hpY2ggd2lsbCBhZGRyZXNzIHRoZSBsaXZlLWxvY2ssIGJ1dCBpbnRyb2R1Y2Ug
QUJCQSBkZWFkbG9jayBwb3RlbnRpYWwNCj4+Pj4+Pj4+Pj4+Pj4gYmV0d2VlbiB0aGUgdHdvIGxv
Y2tzLg0KPj4+Pj4+Pj4+Pj4+IEkgYW0gbm90IHN1cmUgSSBjYW4gc3VnZ2VzdCBhIGJldHRlciBz
b2x1dGlvbiBoZXJlDQo+Pj4+Pj4+Pj4+Pj4gQFJvZ2VyLCBASmFuLCBjb3VsZCB5b3UgcGxlYXNl
IGhlbHAgaGVyZT8NCj4+Pj4+Pj4+Pj4+IFdlbGwsIGZpcnN0IG9mIGFsbCBJJ2QgbGlrZSB0byBt
ZW50aW9uIHRoYXQgd2hpbGUgaXQgbWF5IGhhdmUgYmVlbiBva2F5IHRvDQo+Pj4+Pj4+Pj4+PiBu
b3QgaG9sZCBwY2lkZXZzX2xvY2sgaGVyZSBmb3IgRG9tMCwgaXQgc3VyZWx5IG5lZWRzIGFjcXVp
cmluZyB3aGVuIGRlYWxpbmcNCj4+Pj4+Pj4+Pj4+IHdpdGggRG9tVS1zJyBsaXN0cyBvZiBQQ0kg
ZGV2aWNlcy4gVGhlIHJlcXVpcmVtZW50IHJlYWxseSBhcHBsaWVzIHRvIHRoZQ0KPj4+Pj4+Pj4+
Pj4gb3RoZXIgdXNlIG9mIGZvcl9lYWNoX3BkZXYoKSBhcyB3ZWxsIChpbiB2cGNpX2R1bXBfbXNp
KCkpLCBleGNlcHQgdGhhdA0KPj4+Pj4+Pj4+Pj4gdGhlcmUgaXQgcHJvYmFibHkgd2FudHMgdG8g
YmUgYSB0cnktbG9jay4NCj4+Pj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4+PiBOZXh0IEknZCBsaWtlIHRv
IHBvaW50IG91dCB0aGF0IGhlcmUgd2UgaGF2ZSB0aGUgc3RpbGwgcGVuZGluZyBpc3N1ZSBvZg0K
Pj4+Pj4+Pj4+Pj4gaG93IHRvIGRlYWwgd2l0aCBoaWRkZW4gZGV2aWNlcywgd2hpY2ggRG9tMCBj
YW4gYWNjZXNzLiBTZWUgbXkgUkZDIHBhdGNoDQo+Pj4+Pj4+Pj4+PiAidlBDSTogYWNjb3VudCBm
b3IgaGlkZGVuIGRldmljZXMgaW4gbW9kaWZ5X2JhcnMoKSIuIFdoYXRldmVyIHRoZSBzb2x1dGlv
bg0KPj4+Pj4+Pj4+Pj4gaGVyZSwgSSB0aGluayBpdCB3YW50cyB0byBhdCBsZWFzdCBhY2NvdW50
IGZvciB0aGUgZXh0cmEgbmVlZCB0aGVyZS4NCj4+Pj4+Pj4+Pj4gWWVzLCBzb3JyeSwgSSBzaG91
bGQgdGFrZSBjYXJlIG9mIHRoYXQuDQo+Pj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4+PiBOb3cgaXQgaXMg
cXVpdGUgY2xlYXIgdGhhdCBwY2lkZXZzX2xvY2sgaXNuJ3QgZ29pbmcgdG8gaGVscCB3aXRoIGF2
b2lkaW5nDQo+Pj4+Pj4+Pj4+PiB0aGUgZGVhZGxvY2ssIGFzIGl0J3MgaW1vIG5vdCBhbiBvcHRp
b24gYXQgYWxsIHRvIGFjcXVpcmUgdGhhdCBsb2NrDQo+Pj4+Pj4+Pj4+PiBldmVyeXdoZXJlIGVs
c2UgeW91IGFjY2VzcyAtPnZwY2kgKG9yIGVsc2UgdGhlIHZwY2kgbG9jayBpdHNlbGYgd291bGQg
YmUNCj4+Pj4+Pj4+Pj4+IHBvaW50bGVzcykuIEJ1dCBhIHBlci1kb21haW4gYXV4aWxpYXJ5IHIv
dyBsb2NrIG1heSBoZWxwOiBPdGhlciBwYXRocw0KPj4+Pj4+Pj4+Pj4gd291bGQgYWNxdWlyZSBp
dCBpbiByZWFkIG1vZGUsIGFuZCBoZXJlIHlvdSdkIGFjcXVpcmUgaXQgaW4gd3JpdGUgbW9kZSAo
aW4NCj4+Pj4+Pj4+Pj4+IHRoZSBmb3JtZXIgY2FzZSBhcm91bmQgdGhlIHZwY2kgbG9jaywgd2hp
bGUgaW4gdGhlIGxhdHRlciBjYXNlIHRoZXJlIG1heQ0KPj4+Pj4+Pj4+Pj4gdGhlbiBub3QgYmUg
YW55IG5lZWQgdG8gYWNxdWlyZSB0aGUgaW5kaXZpZHVhbCB2cGNpIGxvY2tzIGF0IGFsbCkuIEZU
QU9EOg0KPj4+Pj4+Pj4+Pj4gSSBoYXZlbid0IGZ1bGx5IHRob3VnaHQgdGhyb3VnaCBhbGwgaW1w
bGljYXRpb25zIChhbmQgaGVuY2Ugd2hldGhlciB0aGlzIGlzDQo+Pj4+Pj4+Pj4+PiB2aWFibGUg
aW4gdGhlIGZpcnN0IHBsYWNlKTsgSSBleHBlY3QgeW91IHdpbGwsIGRvY3VtZW50aW5nIHdoYXQg
eW91J3ZlDQo+Pj4+Pj4+Pj4+PiBmb3VuZCBpbiB0aGUgcmVzdWx0aW5nIHBhdGNoIGRlc2NyaXB0
aW9uLiBPZiBjb3Vyc2UgdGhlIGRvdWJsZSBsb2NrDQo+Pj4+Pj4+Pj4+PiBhY3F1aXJlL3JlbGVh
c2Ugd291bGQgdGhlbiBsaWtlbHkgd2FudCBoaWRpbmcgaW4gaGVscGVyIGZ1bmN0aW9ucy4NCj4+
Pj4+Pj4+Pj4gSSd2ZSBiZWVuIGFsc28gdGhpbmtpbmcgYWJvdXQgdGhpcywgYW5kIHdoZXRoZXIg
aXQncyByZWFsbHkgd29ydGggdG8NCj4+Pj4+Pj4+Pj4gaGF2ZSBhIHBlci1kZXZpY2UgbG9jayBy
YXRoZXIgdGhhbiBhIHBlci1kb21haW4gb25lIHRoYXQgcHJvdGVjdHMgYWxsDQo+Pj4+Pj4+Pj4+
IHZwY2kgcmVnaW9ucyBvZiB0aGUgZGV2aWNlcyBhc3NpZ25lZCB0byB0aGUgZG9tYWluLg0KPj4+
Pj4+Pj4+Pg0KPj4+Pj4+Pj4+PiBUaGUgT1MgaXMgbGlrZWx5IHRvIHNlcmlhbGl6ZSBhY2Nlc3Nl
cyB0byB0aGUgUENJIGNvbmZpZyBzcGFjZSBhbnl3YXksDQo+Pj4+Pj4+Pj4+IGFuZCB0aGUgb25s
eSBwbGFjZSBJIGNvdWxkIHNlZSBhIGJlbmVmaXQgb2YgaGF2aW5nIHBlci1kZXZpY2UgbG9ja3Mg
aXMNCj4+Pj4+Pj4+Pj4gaW4gdGhlIGhhbmRsaW5nIG9mIE1TSS1YIHRhYmxlcywgYXMgdGhlIGhh
bmRsaW5nIG9mIHRoZSBtYXNrIGJpdCBpcw0KPj4+Pj4+Pj4+PiBsaWtlbHkgdmVyeSBwZXJmb3Jt
YW5jZSBzZW5zaXRpdmUsIHNvIGFkZGluZyBhIHBlci1kb21haW4gbG9jayB0aGVyZQ0KPj4+Pj4+
Pj4+PiBjb3VsZCBiZSBhIGJvdHRsZW5lY2suDQo+Pj4+Pj4+Pj4gSG1tLCB3aXRoIG1ldGhvZCAx
IGFjY2Vzc2VzIHNlcmlhbGl6aW5nIGdsb2JhbGx5IGlzIGJhc2ljYWxseQ0KPj4+Pj4+Pj4+IHVu
YXZvaWRhYmxlLCBidXQgd2l0aCBNTUNGRyBJIHNlZSBubyByZWFzb24gd2h5IE9TZXMgbWF5IG5v
dCAobW92ZQ0KPj4+Pj4+Pj4+IHRvKSBwZXJtaXQodGluZykgcGFyYWxsZWwgYWNjZXNzZXMsIHdp
dGggc2VyaWFsaXphdGlvbiBwZXJoYXBzIGRvbmUNCj4+Pj4+Pj4+PiBvbmx5IGF0IGRldmljZSBs
ZXZlbC4gU2VlIG91ciBvd24gcGNpX2NvbmZpZ19sb2NrLCB3aGljaCBhcHBsaWVzIHRvDQo+Pj4+
Pj4+Pj4gb25seSBtZXRob2QgMSBhY2Nlc3Nlczsgd2UgZG9uJ3QgbG9vayB0byBiZSBzZXJpYWxp
emluZyBNTUNGRw0KPj4+Pj4+Pj4+IGFjY2Vzc2VzIGF0IGFsbC4NCj4+Pj4+Pj4+Pg0KPj4+Pj4+
Pj4+PiBXZSBjb3VsZCBhbHRlcm5hdGl2ZWx5IGRvIGEgcGVyLWRvbWFpbiByd2xvY2sgZm9yIHZw
Y2kgYW5kIHNwZWNpYWwgY2FzZQ0KPj4+Pj4+Pj4+PiB0aGUgTVNJLVggYXJlYSB0byBhbHNvIGhh
dmUgYSBwZXItZGV2aWNlIHNwZWNpZmljIGxvY2suIEF0IHdoaWNoIHBvaW50DQo+Pj4+Pj4+Pj4+
IGl0IGJlY29tZXMgZmFpcmx5IHNpbWlsYXIgdG8gd2hhdCB5b3UgcHJvcG9zZS4NCj4+Pj4+Pj4+
IEBKYW4sIEBSb2dlcg0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+IDEuIGQtPnZwY2lfbG9jayAtIHJ3bG9j
ayA8LSB0aGlzIHByb3RlY3RzIHZwY2kNCj4+Pj4+Pj4+IDIuIHBkZXYtPnZwY2ktPm1zaXhfdGJs
X2xvY2sgLSByd2xvY2sgPC0gdGhpcyBwcm90ZWN0cyBNU0ktWCB0YWJsZXMNCj4+Pj4+Pj4+IG9y
IHNob3VsZCBpdCBiZXR0ZXIgYmUgcGRldi0+bXNpeF90YmxfbG9jayBhcyBNU0ktWCB0YWJsZXMg
ZG9uJ3QNCj4+Pj4+Pj4+IHJlYWxseSBkZXBlbmQgb24gdlBDST8NCj4+Pj4+Pj4gSWYgc28sIHBl
cmhhcHMgaW5kZWVkIGJldHRlciB0aGUgbGF0dGVyLiBCdXQgYXMgc2FpZCBpbiByZXBseSB0byBS
b2dlciwNCj4+Pj4+Pj4gSSdtIG5vdCBjb252aW5jZWQgKHlldCkgdGhhdCBkb2luZyBhd2F5IHdp
dGggdGhlIHBlci1kZXZpY2UgbG9jayBpcyBhDQo+Pj4+Pj4+IGdvb2QgbW92ZS4gQXMgc2FpZCB0
aGVyZSAtIHdlJ3JlIG91cnNlbHZlcyBkb2luZyBmdWxseSBwYXJhbGxlbCBNTUNGRw0KPj4+Pj4+
PiBhY2Nlc3Nlcywgc28gT1NlcyBvdWdodCB0byBiZSBmaW5lIHRvIGRvIHNvLCB0b28uDQo+Pj4+
Pj4gQnV0IHdpdGggcGRldi0+dnBjaV9sb2NrIHdlIGZhY2UgQUJCQS4uLg0KPj4+Pj4gSSB0aGlu
ayBpdCB3b3VsZCBiZSBlYXNpZXIgdG8gc3RhcnQgd2l0aCBhIHBlci1kb21haW4gcndsb2NrIHRo
YXQNCj4+Pj4+IGd1YXJhbnRlZXMgcGRldi0+dnBjaSBjYW5ub3QgYmUgcmVtb3ZlZCB1bmRlciBv
dXIgZmVldC4gVGhpcyB3b3VsZCBiZQ0KPj4+Pj4gdGFrZW4gaW4gcmVhZCBtb2RlIGluIHZwY2lf
e3JlYWQsd3JpdGV9IGFuZCBpbiB3cml0ZSBtb2RlIHdoZW4NCj4+Pj4+IHJlbW92aW5nIGEgZGV2
aWNlIGZyb20gYSBkb21haW4uDQo+Pj4+Pg0KPj4+Pj4gVGhlbiB0aGVyZSBhcmUgYWxzbyBvdGhl
ciBpc3N1ZXMgcmVnYXJkaW5nIHZQQ0kgbG9ja2luZyB0aGF0IG5lZWQgdG8NCj4+Pj4+IGJlIGZp
eGVkLCBidXQgdGhhdCBsb2NrIHdvdWxkIGxpa2VseSBiZSBhIHN0YXJ0Lg0KPj4+PiBPciBsZXQn
cyBzZWUgdGhlIHByb2JsZW0gYXQgYSBkaWZmZXJlbnQgYW5nbGU6IHRoaXMgaXMgdGhlIG9ubHkg
cGxhY2UNCj4+Pj4gd2hpY2ggYnJlYWtzIHRoZSB1c2Ugb2YgcGRldi0+dnBjaV9sb2NrLiBCZWNh
dXNlIGFsbCBvdGhlciBwbGFjZXMNCj4+Pj4gZG8gbm90IHRyeSB0byBhY3F1aXJlIHRoZSBsb2Nr
IG9mIGFueSB0d28gZGV2aWNlcyBhdCBhIHRpbWUuDQo+Pj4+IFNvLCB3aGF0IGlmIHdlIHJlLXdv
cmsgdGhlIG9mZmVuZGluZyBwaWVjZSBvZiBjb2RlIGluc3RlYWQ/DQo+Pj4+IFRoYXQgd2F5IHdl
IGRvIG5vdCBicmVhayBwYXJhbGxlbCBhY2Nlc3MgYW5kIGhhdmUgdGhlIGxvY2sgcGVyLWRldmlj
ZQ0KPj4+PiB3aGljaCBtaWdodCBhbHNvIGJlIGEgcGx1cy4NCj4+Pj4NCj4+Pj4gQnkgcmUtd29y
ayBJIG1lYW4sIHRoYXQgaW5zdGVhZCBvZiByZWFkaW5nIGFscmVhZHkgbWFwcGVkIHJlZ2lvbnMN
Cj4+Pj4gZnJvbSB0bXAgd2UgY2FuIGVtcGxveSBhIGQtPnBjaV9tYXBwZWRfcmVnaW9ucyByYW5n
ZSBzZXQgd2hpY2gNCj4+Pj4gd2lsbCBob2xkIGFsbCB0aGUgYWxyZWFkeSBtYXBwZWQgcmFuZ2Vz
LiBBbmQgd2hlbiBpdCBpcyBuZWVkZWQgdG8gYWNjZXNzDQo+Pj4+IHRoYXQgcmFuZ2Ugc2V0IHdl
IHVzZSBwY2lkZXZzX2xvY2sgd2hpY2ggc2VlbXMgdG8gYmUgcmFyZS4NCj4+Pj4gU28sIG1vZGlm
eV9iYXJzIHdpbGwgcmVseSBvbiBwZGV2LT52cGNpX2xvY2sgKyBwY2lkZXZzX2xvY2sgYW5kDQo+
Pj4+IEFCQkEgd29uJ3QgYmUgcG9zc2libGUgYXQgYWxsLg0KPj4+IFNhZGx5IHRoYXQgd29uJ3Qg
cmVwbGFjZSB0aGUgdXNhZ2Ugb2YgdGhlIGxvb3AgaW4gbW9kaWZ5X2JhcnMuIFRoaXMgaXMNCj4+
PiBub3QgKGV4Y2x1c2l2ZWx5KSBkb25lIGluIG9yZGVyIHRvIHByZXZlbnQgbWFwcGluZyB0aGUg
c2FtZSByZWdpb24NCj4+PiBtdWx0aXBsZSB0aW1lcywgYnV0IHJhdGhlciB0byBwcmV2ZW50IHVu
bWFwcGluZyBvZiByZWdpb25zIGFzIGxvbmcgYXMNCj4+PiB0aGVyZSdzIGFuIGVuYWJsZWQgQkFS
IHRoYXQncyB1c2luZyBpdC4NCj4+Pg0KPj4+IElmIHlvdSB3YW50ZWQgdG8gdXNlIHNvbWV0aGlu
ZyBsaWtlIGQtPnBjaV9tYXBwZWRfcmVnaW9ucyBpdCB3b3VsZA0KPj4+IGhhdmUgdG8ga2VlcCBy
ZWZlcmVuY2UgY291bnRzIHRvIHJlZ2lvbnMsIGluIG9yZGVyIHRvIGtub3cgd2hlbiBhDQo+Pj4g
bWFwcGluZyBpcyBubyBsb25nZXIgcmVxdWlyZWQgYnkgYW55IEJBUiBvbiB0aGUgc3lzdGVtIHdp
dGggbWVtb3J5DQo+Pj4gZGVjb2RpbmcgZW5hYmxlZC4NCj4+IEkgbWlzc2VkIHRoaXMgcGF0aCwg
dGhhbmsgeW91DQo+Pg0KPj4gSSB0cmllZCB0byBhbmFseXplIHRoZSBsb2NraW5nIGluIHBjaS92
cGNpLg0KPj4NCj4+IEZpcnN0IG9mIGFsbCBzb21lIGNvbnRleHQgdG8gcmVmcmVzaCB0aGUgdGFy
Z2V0IHdlIHdhbnQ6DQo+PiB0aGUgcmF0aW9uYWxlIGJlaGluZCBtb3ZpbmcgcGRldi0+dnBjaS0+
bG9jayBvdXRzaWRlDQo+PiBpcyB0byBiZSBhYmxlIGR5bmFtaWNhbGx5IGNyZWF0ZSBhbmQgZGVz
dHJveSBwZGV2LT52cGNpLg0KPj4gU28sIGZvciB0aGF0IHJlYXNvbiBsb2NrIG5lZWRzIHRvIGJl
IG1vdmVkIG91dHNpZGUgb2YgdGhlIHBkZXYtPnZwY2kuDQo+Pg0KPj4gU29tZSBvZiB0aGUgY2Fs
bGVycyBvZiB0aGUgdlBDSSBjb2RlIGFuZCBsb2NraW5nIHVzZWQ6DQo+Pg0KPj4gPT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCj4+IHZwY2lfbW1pb19yZWFkL3ZwY2lfbW1j
ZmdfcmVhZA0KPj4gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCj4+ICAg
wqAgLSB2cGNpX2VjYW1fcmVhZA0KPj4gICDCoCAtIHZwY2lfcmVhZA0KPj4gICDCoMKgICEhISEh
ISEhIHBkZXYgaXMgYWNxdWlyZWQsIHRoZW4gcGRldi0+dnBjaV9sb2NrIGlzIHVzZWQgISEhISEh
ISENCj4+ICAgwqDCoCAtIG1zaXg6DQo+PiAgIMKgwqDCoCAtIGNvbnRyb2xfcmVhZA0KPj4gICDC
oMKgIC0gaGVhZGVyOg0KPj4gICDCoMKgwqAgLSBndWVzdF9iYXJfcmVhZA0KPj4gICDCoMKgIC0g
bXNpOg0KPj4gICDCoMKgwqAgLSBjb250cm9sX3JlYWQNCj4+ICAgwqDCoMKgIC0gYWRkcmVzc19y
ZWFkL2FkZHJlc3NfaGlfcmVhZA0KPj4gICDCoMKgwqAgLSBkYXRhX3JlYWQNCj4+ICAgwqDCoMKg
IC0gbWFza19yZWFkDQo+Pg0KPj4gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT0NCj4+IHZwY2lfbW1pb193cml0ZS92cGNpX21tY2ZnX3dyaXRlDQo+PiA9PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPj4gICDCoCAtIHZwY2lfZWNhbV93cml0ZQ0KPj4g
ICDCoCAtIHZwY2lfd3JpdGUNCj4+ICAgwqDCoCAhISEhISEhISBwZGV2IGlzIGFjcXVpcmVkLCB0
aGVuIHBkZXYtPnZwY2lfbG9jayBpcyB1c2VkICEhISEhISEhDQo+PiAgIMKgwqAgLSBtc2l4Og0K
Pj4gICDCoMKgwqAgLSBjb250cm9sX3dyaXRlDQo+PiAgIMKgwqAgLSBoZWFkZXI6DQo+PiAgIMKg
wqDCoCAtIGJhcl93cml0ZS9ndWVzdF9iYXJfd3JpdGUNCj4+ICAgwqDCoMKgIC0gY21kX3dyaXRl
L2d1ZXN0X2NtZF93cml0ZQ0KPj4gICDCoMKgwqAgLSByb21fd3JpdGUNCj4+ICAgwqDCoMKgwqAg
LSBhbGwgd3JpdGUgaGFuZGxlcnMgbWF5IGNhbGwgbW9kaWZ5X2JhcnMNCj4+ICAgwqDCoMKgwqDC
oCBtb2RpZnlfYmFycw0KPj4gICDCoMKgIC0gbXNpOg0KPj4gICDCoMKgwqAgLSBjb250cm9sX3dy
aXRlDQo+PiAgIMKgwqDCoCAtIGFkZHJlc3Nfd3JpdGUvYWRkcmVzc19oaV93cml0ZQ0KPj4gICDC
oMKgwqAgLSBkYXRhX3dyaXRlDQo+PiAgIMKgwqDCoCAtIG1hc2tfd3JpdGUNCj4+DQo+PiA9PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPj4gcGNpX2FkZF9kZXZpY2U6IGxv
Y2tlZCB3aXRoIHBjaWRldnNfbG9jaw0KPj4gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT0NCj4+ICAgwqAgLSB2cGNpX2FkZF9oYW5kbGVycw0KPj4gICDCoMKgICsrKysrKysr
IHBkZXYtPnZwY2lfbG9jayBpcyB1c2VkICsrKysrKysrDQo+Pg0KPj4gPT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT0NCj4+IHBjaV9yZW1vdmVfZGV2aWNlOiBsb2NrZWQgd2l0
aCBwY2lkZXZzX2xvY2sNCj4+ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
DQo+PiAtIHZwY2lfcmVtb3ZlX2RldmljZQ0KPj4gICDCoCArKysrKysrKyBwZGV2LT52cGNpX2xv
Y2sgaXMgdXNlZCArKysrKysrKw0KPj4gLSBwY2lfY2xlYW51cF9tc2kNCj4+IC0gZnJlZV9wZGV2
DQo+Pg0KPj4gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCj4+IFhFTl9E
T01DVExfYXNzaWduX2RldmljZTogbG9ja2VkIHdpdGggcGNpZGV2c19sb2NrDQo+PiA9PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPj4gLSBhc3NpZ25fZGV2aWNlDQo+PiAg
IMKgLSB2cGNpX2RlYXNzaWduX2RldmljZQ0KPj4gICDCoC0gcGRldl9tc2l4X2Fzc2lnbg0KPj4g
ICDCoC0gdnBjaV9hc3NpZ25fZGV2aWNlDQo+PiAgIMKgIC0gdnBjaV9hZGRfaGFuZGxlcnMNCj4+
ICAgwqDCoMKgICsrKysrKysrIHBkZXYtPnZwY2lfbG9jayBpcyB1c2VkICsrKysrKysrDQo+Pg0K
Pj4gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCj4+IFhFTl9ET01DVExf
ZGVhc3NpZ25fZGV2aWNlOiBsb2NrZWQgd2l0aCBwY2lkZXZzX2xvY2sNCj4+ID09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+PiAtIGRlYXNzaWduX2RldmljZQ0KPj4gICDC
oC0gdnBjaV9kZWFzc2lnbl9kZXZpY2UNCj4+ICAgwqDCoCArKysrKysrKyBwZGV2LT52cGNpX2xv
Y2sgaXMgdXNlZCArKysrKysrKw0KPj4gICDCoCAtIHZwY2lfcmVtb3ZlX2RldmljZQ0KPj4NCj4+
DQo+PiA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPj4gbW9kaWZ5X2Jh
cnMgaXMgYSBzcGVjaWFsIGNhc2U6IHRoaXMgaXMgdGhlIG9ubHkgZnVuY3Rpb24gd2hpY2ggdHJp
ZXMgdG8gbG9jaw0KPj4gdHdvIHBjaV9kZXYgZGV2aWNlczogaXQgaXMgZG9uZSB0byBjaGVjayBm
b3Igb3ZlcmxhcHMgd2l0aCBvdGhlciBCQVJzIHdoaWNoIG1heSBoYXZlIGJlZW4NCj4+IGFscmVh
ZHkgbWFwcGVkIG9yIHVubWFwcGVkLg0KPj4NCj4+IFNvLCB0aGlzIGlzIHRoZSBvbmx5IGNhc2Ug
d2hpY2ggbWF5IGRlYWRsb2NrIGJlY2F1c2Ugb2YgcGNpX2Rldi0+dnBjaV9sb2NrLg0KPj4gPT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCj4+DQo+PiBCb3R0b20gbGluZToN
Cj4+ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+Pg0KPj4gMS4gdnBj
aV97cmVhZHx3cml0ZX0gYXJlIG5vdCBwcm90ZWN0ZWQgd2l0aCBwY2lkZXZzX2xvY2sgYW5kIGNh
biBydW4gaW4NCj4+IHBhcmFsbGVsIHdpdGggcGNpX3JlbW92ZV9kZXZpY2Ugd2hpY2ggY2FuIHJl
bW92ZSBwZGV2IGFmdGVyIHZwY2lfe3JlYWR8d3JpdGV9DQo+PiBhY3F1aXJlZCB0aGUgcGRldiBw
b2ludGVyLiBUaGlzIG1heSBsZWFkIHRvIGEgZmFpbCBkdWUgdG8gcGRldiBkZXJlZmVyZW5jZS4N
Cj4+DQo+PiBTbywgdG8gcHJvdGVjdCBwZGV2IGRlcmVmZXJlbmNlIHZwY2lfe3JlYWR8d3JpdGV9
IG11c3QgYWxzbyB1c2UgcGRldnNfbG9jay4NCj4gV2Ugd291bGQgbGlrZSB0byB0YWtlIHRoZSBw
Y2lkZXZzX2xvY2sgb25seSB3aGlsZSBmZXRjaGluZyB0aGUgZGV2aWNlDQo+IChpZTogcGNpX2dl
dF9wZGV2X2J5X2RvbWFpbiksIGFmdGVyd2FyZHMgaXQgc2hvdWxkIGJlIGZpbmUgdG8gbG9jayB0
aGUNCj4gZGV2aWNlIHVzaW5nIGEgdnBjaSBzcGVjaWZpYyBsb2NrIHNvIGNhbGxzIHRvIHZwY2lf
e3JlYWQsd3JpdGV9IGNhbiBiZQ0KPiBwYXJ0aWFsbHkgY29uY3VycmVudCBhY3Jvc3MgbXVsdGlw
bGUgZG9tYWlucy4NClRoaXMgbWVhbnMgdGhpcyBjYW4ndCBiZSBkb25lIGEgcHJlLXJlcSBwYXRj
aCwgYnV0IGFzIGEgcGFydCBvZiB0aGUNCnBhdGNoIHdoaWNoIGNoYW5nZXMgbG9ja2luZy4NCj4N
Cj4gSW4gZmFjdCBJIHRoaW5rIEphbiBoYWQgYWxyZWFkeSBwb2ludGVkIG91dCB0aGF0IHRoZSBw
Y2kgbG9jayB3b3VsZA0KPiBuZWVkIHRha2luZyB3aGlsZSBzZWFyY2hpbmcgZm9yIHRoZSBkZXZp
Y2UgaW4gdnBjaV97cmVhZCx3cml0ZX0uDQpJIHdhcyByZWZlcnJpbmcgdG8gdGhlIHRpbWUgYWZ0
ZXIgd2UgZm91bmQgcGRldiBhbmQgaXQgaXMgY3VycmVudGx5DQpwb3NzaWJsZSB0byBmcmVlIHBk
ZXYgd2hpbGUgdXNpbmcgaXQgYWZ0ZXIgdGhlIHNlYXJjaA0KPg0KPiBJdCBzZWVtcyB0byBtZSB0
aGF0IGlmIHlvdSBpbXBsZW1lbnQgb3B0aW9uIDMgYmVsb3cgdGFraW5nIHRoZQ0KPiBwZXItZG9t
YWluIHJ3bG9jayBpbiByZWFkIG1vZGUgaW4gdnBjaV97cmVhZHx3cml0ZX0gd2lsbCBhbHJlYWR5
DQo+IHByb3RlY3QgeW91IGZyb20gdGhlIGRldmljZSBiZWluZyByZW1vdmVkIGlmIHRoZSBzYW1l
IHBlci1kb21haW4gbG9jaw0KPiBpcyB0YWtlbiBpbiB3cml0ZSBtb2RlIGluIHZwY2lfcmVtb3Zl
X2RldmljZS4NClllcywgaXQgc2hvdWxkLiBBZ2FpbiB0aGlzIGNhbid0IGJlIGRvbmUgYXMgYSBw
cmUtcmVxIHBhdGNoIGJlY2F1c2UNCnRoaXMgcmVsaWVzIG9uIHBkZXYtPnZwY2lfbG9jaw0KPg0K
Pj4gMi4gVGhlIG9ubHkgb2ZmZW5kaW5nIHBsYWNlIHdoaWNoIGlzIGluIHRoZSB3YXkgb2YgcGNp
X2Rldi0+dnBjaV9sb2NrIGlzDQo+PiBtb2RpZnlfYmFycy4gSWYgaXQgY2FuIGJlIHJlLXdvcmtl
ZCB0byB0cmFjayBhbHJlYWR5IG1hcHBlZCBhbmQgdW5tYXBwZWQNCj4+IHJlZ2lvbnMgdGhlbiB3
ZSBjYW4gYXZvaWQgaGF2aW5nIGEgcG9zc2libGUgZGVhZGxvY2sgYW5kIGNhbiB1c2UNCj4+IHBj
aV9kZXYtPnZwY2lfbG9jayAocmFuZ2VzZXRzIHdvbid0IGhlbHAgaGVyZSBhcyB3ZSBhbHNvIG5l
ZWQgcmVmY291bnRpbmcgYmUNCj4+IGltcGxlbWVudGVkKS4NCj4gSSB0aGluayBhIHJlZmNvdW50
aW5nIGJhc2VkIHNvbHV0aW9uIHdpbGwgYmUgdmVyeSBjb21wbGV4IHRvDQo+IGltcGxlbWVudC4g
SSdtIGhvd2V2ZXIgaGFwcHkgdG8gYmUgcHJvdmVuIHdyb25nLg0KSSBjYW4ndCBlc3RpbWF0ZSwg
YnV0IEkgaGF2ZSBhIGZlZWxpbmcgdGhhdCBhbGwgdGhlc2UgcGxheXMgYXJvdW5kIGxvY2tpbmcN
CmlzIGp1c3QgYmVjYXVzZSBvZiB0aGlzIHNpbmdsZSBwaWVjZSBvZiBjb2RlLiBObyBvdGhlciBw
bGFjZSBzdWZmZXIgZnJvbQ0KcGRldi0+dnBjaV9sb2NrIGFuZCBubyBkLT5sb2NrDQo+DQo+PiBJ
ZiBwY2lkZXZzX2xvY2sgaXMgdXNlZCBmb3IgdnBjaV97cmVhZHx3cml0ZX0gdGhlbiBubyBkZWFk
bG9jayBpcyBwb3NzaWJsZSwNCj4+IGJ1dCBtb2RpZnlfYmFycyBjb2RlIG11c3QgYmUgcmUtd29y
a2VkIG5vdCB0byBsb2NrIGl0c2VsZiAocGRldi0+dnBjaV9sb2NrIGFuZA0KPj4gdG1wLT52cGNp
X2xvY2sgd2hlbiBwZGV2ID09IHRtcCwgdGhpcyBpcyBtaW5vcikuDQo+IFRha2luZyB0aGUgcGNp
ZGV2cyBsb2NrIChhIGdsb2JhbCBsb2NrKSBpcyBvdXQgb2YgdGhlIHBpY3R1cmUgSU1PLCBhcw0K
PiBpdCdzIGdvaW5nIHRvIHNlcmlhbGl6ZSBhbGwgY2FsbHMgb2YgdnBjaV97cmVhZHx3cml0ZX0s
IGFuZCB3b3VsZA0KPiBjcmVhdGUgdG9vIG11Y2ggY29udGVudGlvbiBvbiB0aGUgcGNpZGV2cyBs
b2NrLg0KSSB1bmRlcnN0YW5kIHRoYXQuIEJ1dCBpZiB3ZSB3b3VsZCBsaWtlIHRvIGZpeCB0aGUg
ZXhpc3RpbmcgY29kZSBJIHNlZQ0Kbm8gb3RoZXIgYWx0ZXJuYXRpdmUuDQo+DQo+PiAzLiBXZSBt
YXkgdGhpbmsgYWJvdXQgYSBwZXItZG9tYWluIHJ3bG9jayBhbmQgcGRldi0+dnBjaV9sb2NrLCBz
byB0aGlzIHNvbHZlcw0KPj4gbW9kaWZ5X2JhcnMncyB0d28gcGRldnMgYWNjZXNzLiBCdXQgdGhp
cyBkb2Vzbid0IHNvbHZlIHBvc3NpYmxlIHBkZXYNCj4+IGRlLXJlZmVyZW5jZSBpbiB2cGNpX3ty
ZWFkfHdyaXRlfSB2cyBwY2lfcmVtb3ZlX2RldmljZS4NCj4gcGNpX3JlbW92ZSBkZXZpY2Ugd2ls
bCBjYWxsIHZwY2lfcmVtb3ZlX2RldmljZSwgc28gYXMgbG9uZyBhcw0KPiB2cGNpX3JlbW92ZV9k
ZXZpY2UgdGFrZW4gdGhlIHBlci1kb21haW4gbG9jayBpbiB3cml0ZSAoZXhjbHVzaXZlKSBtb2Rl
DQo+IGl0IHNob3VsZCBiZSBmaW5lLg0KSSB0aGluayBJIG5lZWQgdG8gc2VlIGlmIHRoZXJlIGFy
ZSBhbnkgb3RoZXIgcGxhY2VzIHdoaWNoIHNpbWlsYXJseQ0KcmVxdWlyZSB0aGUgd3JpdGUgbG9j
aw0KPg0KPj4gQFJvZ2VyLCBASmFuLCBJIHdvdWxkIGxpa2UgdG8gaGVhciB3aGF0IGRvIHlvdSB0
aGluayBhYm91dCB0aGUgYWJvdmUgYW5hbHlzaXMNCj4+IGFuZCBob3cgY2FuIHdlIHByb2NlZWQg
d2l0aCBsb2NraW5nIHJlLXdvcms/DQo+IEkgdGhpbmsgdGhlIHBlci1kb21haW4gcndsb2NrIHNl
ZW1zIGxpa2UgYSBnb29kIG9wdGlvbi4gSSB3b3VsZCBkbw0KPiB0aGF0IGFzIGEgcHJlLXBhdGNo
Lg0KSXQgaXMuIEJ1dCBpdCBzZWVtcyBpdCB3b24ndCBzb2x2ZSB0aGUgdGhpbmcgd2Ugc3RhcnRl
ZCB0aGlzIGFkdmVudHVyZSBmb3I6DQoNCldpdGggcGVyLWRvbWFpbiByZWFkIGxvY2sgYW5kIHN0
aWxsIEFCQkEgaW4gbW9kaWZ5X2JhcnMgKGhvcGUgdGhlIGJlbG93DQppcyBjb3JyZWN0bHkgc2Vl
biB3aXRoIGEgbW9ub3NwYWNlIGZvbnQpOg0KDQpjcHUwOiB2cGNpX3dyaXRlLT4gZC0+UkxvY2sg
LT4gcGRldjEtPmxvY2sgLT7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCByb21fd3JpdGUgLT4gbW9kaWZ5X2JhcnM6IHRtcCAocGRldjIpIC0+bG9jaw0KY3B1MTrCoMKg
wqDCoMKgwqDCoCB2cGNpX3dyaXRlLT4gZC0+UkxvY2sgcGRldjItPmxvY2sgLT4gY21kX3dyaXRl
IC0+IG1vZGlmeV9iYXJzOiB0bXAgKHBkZXYxKSAtPmxvY2sNCg0KVGhlcmUgaXMgbm8gQVBJIHRv
IHVwZ3JhZGUgcmVhZCBsb2NrIHRvIHdyaXRlIGxvY2sgaW4gbW9kaWZ5X2JhcnMgd2hpY2ggY291
bGQgaGVscCwNCnNvIGluIGJvdGggY2FzZXMgdnBjaV93cml0ZSBzaG91bGQgdGFrZSB3cml0ZSBs
b2NrLg0KDQpBbSBJIG1pc3Npbmcgc29tZXRoaW5nIGhlcmU/DQo+DQo+IFRoYW5rcywgUm9nZXIu
DQpUaGFuayB5b3UsDQpPbGVrc2FuZHI=

