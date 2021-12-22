Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0676547D0D1
	for <lists+xen-devel@lfdr.de>; Wed, 22 Dec 2021 12:18:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250777.431892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzzdF-0005fR-Jk; Wed, 22 Dec 2021 11:18:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250777.431892; Wed, 22 Dec 2021 11:18:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzzdF-0005co-Gf; Wed, 22 Dec 2021 11:18:05 +0000
Received: by outflank-mailman (input) for mailman id 250777;
 Wed, 22 Dec 2021 11:18:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nRTG=RH=epam.com=prvs=29901831a2=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1mzzdE-0005ci-EX
 for xen-devel@lists.xenproject.org; Wed, 22 Dec 2021 11:18:04 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d342259d-6318-11ec-9e60-abaf8a552007;
 Wed, 22 Dec 2021 12:18:02 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BMAwhAR030695;
 Wed, 22 Dec 2021 11:17:58 GMT
Received: from eur03-am5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2059.outbound.protection.outlook.com [104.47.8.59])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3d427q04dg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Dec 2021 11:17:50 +0000
Received: from PAXPR03MB7594.eurprd03.prod.outlook.com (2603:10a6:102:201::14)
 by PAXPR03MB7713.eurprd03.prod.outlook.com (2603:10a6:102:205::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Wed, 22 Dec
 2021 11:17:46 +0000
Received: from PAXPR03MB7594.eurprd03.prod.outlook.com
 ([fe80::157a:fb23:aa6c:f0f6]) by PAXPR03MB7594.eurprd03.prod.outlook.com
 ([fe80::157a:fb23:aa6c:f0f6%6]) with mapi id 15.20.4823.018; Wed, 22 Dec 2021
 11:17:45 +0000
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
X-Inumbo-ID: d342259d-6318-11ec-9e60-abaf8a552007
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cOvfUuDNeUdvCnjfk8tEB56iNPLR2UYnG2hGKXr4ExMrc+EKUT0pjbBaVD8ePQYi7ll6/51Hqi/DD0OnTkdTkV9iE0OTh3hfO8gXhJPKhy4yVUqkBrXgKdeSn8j4dZfT/iVao1hIyT7pjkDQSDk0iVFV9r3bx1A7c3Jj8WJMoRnCCfSCuw8HGf5dvgFcookfV57I1AKVrXBUDpW89uIUYbbhPdr0CRlXtr+VzUdFgyR1XlU5wktHsjn9JDCVFatFU7A1My4UIYq05DicTLrTXOkx6A86Vx9Cm6xRK7NwsPWWlxSvDfFdmHvruNc8n2fh/KFSSkkeCqRvHH8nsMvL2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vC5oRR6KKBEntPspe24mX35CWo5EklTsERTC76ZXwE4=;
 b=OiRu9K1HPmhTzNoyBIdFY8R9w3E1vAPl85XlBubm1BV6mfBnU4ah9XSmWcJqUrf1uBYaYUFqfNcMQtwgiCGZ7jTe9L1dK4aL1VDdxsaruAXg1HUBmxr0gFGFClZmOyzPWm812pxcMSrqfbZ9KVQ6pvqvMgZR427tOVxUaXVobMElnBbpguwFNhNN9GwywfcH9GY1qgKhXGTmMgFcPLMRG/m8PBYQ0p3wcuh/p3T+r5Hdl2AErvcmLbWi0CQUbv1vdJ/1UeAOlX6qBvVuc2NGMlXQM2M2eRNITIoPX4+p71qKvdKTf8wyhY/7SlkzNm3zAv9cQ0EeYti+gDVKvXNI/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vC5oRR6KKBEntPspe24mX35CWo5EklTsERTC76ZXwE4=;
 b=XIO4b2PVjciJr7yJTJg3eQdnvuDnXUBV6Ogx586VSuEsK+qBcyTK0YO6TCGAzWePXEUhzmKC5iT2WLT5OaJj1EGn0XMXbAfAPTfN3MtbWm8nfpoK2C5xdCL1e9VMKqtyhxi3OdVl4rHX1s7y2KV5S6ZVArYnhe1qL6nWBUGSEGY4nvBb5j52e/SvX9V2QhjCON/qycGXfI1KAtC/2nFomWEukHUK1S9AoNHL8DJkkdp3f43J3ALyGYZl1v4jVdMTDLFQkCv+VGqqeVkDnT3lKyBSxvoA4WQ7lnJdotcc+Qh5nUHc7fzl8qEArFCpnAzkF6tVwn+WRAAa/NIgWavvZQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>,
        Anthony PERARD
	<anthony.perard@citrix.com>,
        Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
        Oleksandr <olekstysh@gmail.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        George Dunlap
	<george.dunlap@citrix.com>,
        Jan Beulich <jbeulich@suse.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>
Subject: Re: [RFC v1 5/5] xen/arm: add SCI mediator support for DomUs
Thread-Topic: [RFC v1 5/5] xen/arm: add SCI mediator support for DomUs
Thread-Index: 
 AQHX8M3LNgat3drmYUW4ty+W1/SkP6w0P2iAgAJeh4CABnNRgIAAc5MAgADFCgCAAB3ugA==
Date: Wed, 22 Dec 2021 11:17:45 +0000
Message-ID: <87lf0cx50o.fsf@epam.com>
References: <cover.1639472078.git.oleksii_moisieiev@epam.com>
 <4469cdf05051bd691a8adff2657d27f6a5f0cefb.1639472078.git.oleksii_moisieiev@epam.com>
 <b1c27f70-309d-bb36-3228-32836063fd16@gmail.com>
 <20211217121524.GA4021162@EPUAKYIW015D> <YcHol8ads22asXGF@perard>
 <alpine.DEB.2.22.394.2112211330310.2060010@ubuntu-linux-20-04-desktop>
 <bc6d7529-337d-a4e1-664a-dddd68ecf5cb@xen.org>
In-Reply-To: <bc6d7529-337d-a4e1-664a-dddd68ecf5cb@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.6.5; emacs 27.2
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b37bcc1b-e6bc-4cef-367a-08d9c53cae22
x-ms-traffictypediagnostic: PAXPR03MB7713:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <PAXPR03MB7713862E7D5F4F37A283520BE67D9@PAXPR03MB7713.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 MRy2hBbKeBELmEBpUjVo0rTw1UYx8+X6/XVqszvFOQdt4rCLuK+LlDkn+xTcbv69W4nUti0VY1c7aiFITX8KE7gN+I9N1HKI9Q1Pl7q7uGqm6aqUcIPXravD+DkWaK6CdP2D6KzO+cNpKSve3odglbkzZ8/ZR5ec07E1mNI9e8QHlMA2zsvX+o5BZiLro0DS9P47GShBDwuUaWbgRZL4SkxxgL+pDujZuzMAd2Q/173mXl/1QP8CignWs4YW9ZX86aCKf9HJZglbpxVZePE1h4D3GHHka3rccpDE2fUrjp1cktYoDzqDC3xXJq0L1S5BAMu8FOJMM8+6cdaknzEWaA3ojYiYCHjVAw9o4R3mUrxiGIR0TqNqr92u3n2OO2Rz8lpIUBVURosaTH8HWD83AdA1H3JSXtys8BEXGAtfk3pJB/sZkpmBDahzrHD68KXbhaac2Kg6BBYrSAss8dXTaHn7zx74AY3C+EpxNNurisp5NxTveZ4L2h0SSUaowbidxoIHsfSCmkMGdg6hULLG4/H8DogOLjIejEOlWYGmTY/MUTlA5TqAkSqA9JAI9dFpcsmG/2EBiiuiVV0B0XivzwhxVl91zmqmFYreBu/GKoNguULX9DgrdiRJehc5402BMKHCNnPvVgrRaqWP2J+lwDswSPgyhChUzG/JFdt5DoM2ctwcbQovgbPgd6zY4RUgSGhZ7XZWmKoHmiDpmJ1B/Q==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR03MB7594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(86362001)(38070700005)(122000001)(38100700002)(71200400001)(7416002)(36756003)(53546011)(6506007)(2906002)(508600001)(5660300002)(4326008)(316002)(8936002)(66946007)(6486002)(8676002)(186003)(6512007)(26005)(83380400001)(66476007)(54906003)(55236004)(91956017)(6916009)(66446008)(76116006)(2616005)(64756008)(66556008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UFhxMDJDR3R6M2NuYVhKYThRYnZXOGg4R1FhczF0aW95eHlZVTQvSlg0S3Yx?=
 =?utf-8?B?QkNxMEJoOXJtbFpSbjMyOUlnZzFUMFRLZDJXZkZpcVVEY2lPNzFZN0hyUk1U?=
 =?utf-8?B?SWR4Z2t4ek5uUnRKT3BrbjZuU0xmbjFmUm9qR0kzNEtBM3ZjenBYbnlPbHVq?=
 =?utf-8?B?RGJOdmxVaXo0K2kvUzRESU1SRlZWbmt2RWIzeHhZRUU3YWttMHV3NXgwVzZn?=
 =?utf-8?B?M0lNUDdIcUwyNiswUjNjOFpKRERibnI3N0dCZk1uN0o3VG5aRjdkWUdKcWtW?=
 =?utf-8?B?czZVQ0ZmT0pHdzEwcDJuK0tQTE9Nd1RGd00wVk81UVA5M21wQ1pVNCszdkJt?=
 =?utf-8?B?bGZwTWFiZFpocXp3SENROGpRSUxSZE1VRUh3U2FKZWRoMnpkRnNsZWJFTEFM?=
 =?utf-8?B?TFV4eVJSTENWSVllbUdtUTBZOCtRcXI5UkpUb1cya0dvN2RLRk5CVHNPMzhz?=
 =?utf-8?B?bDVtMG9HM1hWb0NGdGJRRlFXdm5ySU5yUTV4Z0hza0F5SXBqMkx6NlVvTVBY?=
 =?utf-8?B?bE5SS2hWTXBQS0RTR0dPdTExNE1PQ0VWdnlKTzAyRUxMazVaWDI1cGZPTDhW?=
 =?utf-8?B?VnI3aGNuSnFvV0Z2TDA3cDdGYjJrR0MxejB3dUp0eHNIUzY3eDlTRzBCT1RH?=
 =?utf-8?B?THJ3ZndxSS9uNHJGTHZpR0k3Y1E2YWZnUWlwWmF2cTQ4ajlUZHNiNWlXTTdQ?=
 =?utf-8?B?UWcwY1g5dGloRDl6Mm9OWWl4allLR3N1UHdaakNiZXJjQnhtSXFuT1FubVBr?=
 =?utf-8?B?NzQ2ZFRnUmg0eGN4S0RXZTlqT3J3a2pkK1E1b005QWpWc3VVei82eFBoN04r?=
 =?utf-8?B?WUY4MWhMUkorQ2g4QjlTR3QzOEdqQWlFL2Vqajk4dGJnSTV3aVI1RW9qWklQ?=
 =?utf-8?B?TitwUzI3RnpmMU85OHdFNTRQYkExaHpkc1B0VXhqcERsOFhveEJFbjlnUjJN?=
 =?utf-8?B?TEw3TkxrQW52cjVhYVdhbmRJRHNmUXRJRUFnV2JXa2RtRWpFM2gwcG13M1VG?=
 =?utf-8?B?aUk4ZUR3SUhqOFVHT1FKWmp5b25YN2NCc3B5KzJ0dnVlYjNCOXhZa09lQjRu?=
 =?utf-8?B?VHlBbCtzMTZ5b3FGbmJTOHNTRUVHajlDS0pzTUFTcUN5WDlFeVF6NEQrMFNC?=
 =?utf-8?B?a0Q1VmhjZ21MaFVacDFmOVNaaDV4NFk3c2t1S3kxUXB0N1ppQ21CNmUrK0VM?=
 =?utf-8?B?QWxlV2swL2pDUmFQUXRHN3gxMldpUGFyazZMTmhiNkUvbTd1VU1MQ21OYmpR?=
 =?utf-8?B?V2h0TlMzZCtDOHZBbnJqMW1TMmdYUkVyampadW5IbzFKTnZWS1RPcDc1emVr?=
 =?utf-8?B?YzdzbkpuM0xpTmZabmtlbmpIWWl2d3RaSTFJa2k5NG5VdDFZU3lJNS9Lbkhk?=
 =?utf-8?B?clRpVFFOSFYvVmVUV0NaQ2hXREpQR2VYanBlNVVFdjVSQ1RPSEpNZWJHN3dL?=
 =?utf-8?B?L09DS3ZveXFNMGUxeGRxc2lTZldHMUlwMk5vb2svb3prRWxiTFhoRUFzUDVy?=
 =?utf-8?B?Ulp6S3Q0QWlXUlI1d04rMUJBZDh1U1AzRU1BajJBK3doRGljSndRclROQjlE?=
 =?utf-8?B?anZmRWRpUExIcnBvT0h5MVJmZmNjTzhBMGtDdVhXazd5QTRZaHZzd2srRzVL?=
 =?utf-8?B?SVFua2RIa3dyOFJzWUhlZ29HNXdOb2FYL3d6dHpQNERPTWlZTlBDT0t5R2g4?=
 =?utf-8?B?cGFGZWFyS2lRdWo0dFRVTlA0QnozalJ0UGM5NkJqcFdLME81YmlOYTU4RjA1?=
 =?utf-8?B?czl6VzAxSEtOZ1c1RHRaN0xNUGJwUGN1UmVkWTliTjlwb1BzWFBpa3FkSVRz?=
 =?utf-8?B?dkFPZmNXOHFUY0x3VGlmRU9WdHU1Z0hsdURZNUpoaERuY3FIU1B1YVYyWlRI?=
 =?utf-8?B?TDBYaDBBVXFhUSs2akRneTdaVUt0UEIvZUE5VVJYNytJMFZqaGl6YVpGYThQ?=
 =?utf-8?B?VWpPTlpQTGtIY0Q4SjRxVGVpcFA2MmZack1FV1Zzc2xkalFFZXM5UHFiN0N2?=
 =?utf-8?B?TmQrMndYa2Z3VjhadHU3d3l1Y24wUDZ5MnBhK1ZKRVdLNE1RK0pGTXJoZUN2?=
 =?utf-8?B?R29XWDNoSmYzMTBRZDVVdHJLcU52bHM1dHJhRGxMRTVHZkYzU2tsR1lXL2hM?=
 =?utf-8?B?UGxzditOMktuZlpyWSswRXRmNUJZVXZzMVBLamNKam0xbmFBZlhuTVNENlAr?=
 =?utf-8?B?b010THlsYTJnMVRpeU5QTm5iNVp6SWVVVFpqNjB1ZFZuRlM5VFFrNExZcGtq?=
 =?utf-8?Q?yV5ngv8GFsLEmzl1BvhNmcKjM9Aa6XR2ZbLF4wj0MA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BCFC2A1D90752F488E9D335F7E55A386@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR03MB7594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b37bcc1b-e6bc-4cef-367a-08d9c53cae22
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Dec 2021 11:17:45.8417
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vzi22BrpW2K6WqB52NWiuyZgoZtSlHAmKw9Xnhu2zSD0R5wc3Eq0swuA+3QFRl112RxTqiAeCYNXLwWjBi+zYIiinmb0AR6aLz854Y+CQYg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7713
X-Proofpoint-ORIG-GUID: XtXKcb2wS4_JJUXvX1yu9BuhY-tcVkoK
X-Proofpoint-GUID: XtXKcb2wS4_JJUXvX1yu9BuhY-tcVkoK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-22_05,2021-12-22_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=999
 clxscore=1015 priorityscore=1501 malwarescore=0 mlxscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112220064

DQpIaSBKdWxpZW4sDQoNCkp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+IHdyaXRlczoNCg0K
PiBIaSBTdGVmYW5vLA0KPg0KPiBPbiAyMS8xMi8yMDIxIDIyOjM5LCBTdGVmYW5vIFN0YWJlbGxp
bmkgd3JvdGU6DQo+PiBPbiBUdWUsIDIxIERlYyAyMDIxLCBBbnRob255IFBFUkFSRCB3cm90ZToN
Cj4+PiBPbiBGcmksIERlYyAxNywgMjAyMSBhdCAxMjoxNToyNVBNICswMDAwLCBPbGVrc2lpIE1v
aXNpZWlldiB3cm90ZToNCj4+Pj4+IE9uIDE0LjEyLjIxIDExOjM0LCBPbGVrc2lpIE1vaXNpZWll
diB3cm90ZToNCj4+Pj4+PiBAQCAtMTgxNywxNyArMTg1OCwyNCBAQCBzdGF0aWMgdm9pZCBsaWJ4
bF9fYWRkX2R0ZGV2cyhsaWJ4bF9fZWdjICplZ2MsIGxpYnhsX19hbyAqYW8sIHVpbnQzMl90IGRv
bWlkLA0KPj4+Pj4+ICAgIHsNCj4+Pj4+PiAgICAgICAgQU9fR0M7DQo+Pj4+Pj4gICAgICAgIGxp
YnhsX19hb19kZXZpY2UgKmFvZGV2ID0gbGlieGxfX211bHRpZGV2X3ByZXBhcmUobXVsdGlkZXYp
Ow0KPj4+Pj4+IC0gICAgaW50IGksIHJjID0gMDsNCj4+Pj4+PiArICAgIGludCBpLCByYyA9IDAs
IHJjX3NjaSA9IDA7DQo+Pj4+Pj4gICAgICAgIGZvciAoaSA9IDA7IGkgPCBkX2NvbmZpZy0+bnVt
X2R0ZGV2czsgaSsrKSB7DQo+Pj4+Pj4gICAgICAgICAgICBjb25zdCBsaWJ4bF9kZXZpY2VfZHRk
ZXYgKmR0ZGV2ID0gJmRfY29uZmlnLT5kdGRldnNbaV07DQo+Pj4+Pj4gICAgICAgICAgICBMT0dE
KERFQlVHLCBkb21pZCwgIkFzc2lnbiBkZXZpY2UgXCIlc1wiIHRvIGRvbWFpbiIsIGR0ZGV2LT5w
YXRoKTsNCj4+Pj4+PiAgICAgICAgICAgIHJjID0geGNfYXNzaWduX2R0X2RldmljZShDVFgtPnhj
aCwgZG9taWQsIGR0ZGV2LT5wYXRoKTsNCj4+Pj4+PiAtICAgICAgICBpZiAocmMgPCAwKSB7DQo+
Pj4+Pj4gLSAgICAgICAgICAgIExPR0QoRVJST1IsIGRvbWlkLCAieGNfYXNzaWduX2R0ZGV2aWNl
IGZhaWxlZDogJWQiLCByYyk7DQo+Pj4+Pj4gKyAgICAgICAgcmNfc2NpID0geGNfZG9tYWluX2Fk
ZF9zY2lfZGV2aWNlKENUWC0+eGNoLCBkb21pZCwgZHRkZXYtPnBhdGgpOw0KPj4+Pj4+ICsNCj4+
Pj4+PiArICAgICAgICBpZiAoKHJjIDwgMCkgJiYgKHJjX3NjaSA8IDApKSB7DQo+Pj4+Pj4gKyAg
ICAgICAgICAgIExPR0QoRVJST1IsIGRvbWlkLCAieGNfYXNzaWduX2R0X2RldmljZSBmYWlsZWQ6
ICVkOyAiDQo+Pj4+Pj4gKyAgICAgICAgICAgICAgICAgInhjX2RvbWFpbl9hZGRfc2NpX2Rldmlj
ZSBmYWlsZWQ6ICVkIiwNCj4+Pj4+PiArICAgICAgICAgICAgICAgICByYywgcmNfc2NpKTsNCj4+
Pj4+PiAgICAgICAgICAgICAgICBnb3RvIG91dDsNCj4+Pj4+PiAgICAgICAgICAgIH0NCj4+Pj4+
PiArDQo+Pj4+Pj4gKyAgICAgICAgaWYgKHJjKQ0KPj4+Pj4+ICsgICAgICAgICAgICByYyA9IHJj
X3NjaTsNCj4+Pj4+DQo+Pj4+Pg0KPj4+Pj4gSWYgSSBnZXQgdGhpcyBjb2RlIHJpZ2h0LCBpdCBz
b3VuZHMgbGlrZSB0aGUgZG9tLmNmZydzIGR0ZGV2IHByb3BlcnR5IGlzDQo+Pj4+PiByZXVzZWQg
dG8gZGVzY3JpYmUgc2NpIGRldmljZXMgYXMgd2VsbCwgYnV0IHRoZSBsaWJ4bF9fYWRkX2R0ZGV2
cygpIGRvZXMgbm90DQo+Pj4+PiAoYW5kIGNhbiBub3QpIGRpZmZlcmVudGlhdGUgdGhlbS4gU28g
aXQgaGFzIG5vIG9wdGlvbiBidXQgdG8gc2VuZCB0d28NCj4+Pj4+IGRvbWN0bHMgZm9yIGVhY2gg
ZGV2aWNlIGluIGR0ZGV2c1tdIGhvcGluZyB0byBhdCBsZWFzdCBvbmUgZG9tY3RsIHRvDQo+Pj4+
PiBzdWNjZWVkZWQuIE9yIEkgcmVhbGx5IG1pc3NlZCBzb21ldGhpbmc/DQo+Pj4+Pg0KPj4+Pj4g
SXQgZmVlbHMgdG8gbWUgdGhhdDoNCj4+Pj4+ICDCoC0gZWl0aGVyIG5ldyBkb20uY2ZnJ3MgcHJv
cGVydHkgY291bGQgYmUgaW50cm9kdWNlZCAoc2NpZGV2PykgdG8gZGVzY3JpYmUNCj4+Pj4+IHNj
aSBkZXZpY2VzIHRvZ2V0aGVyIHdpdGggbmV3IHBhcnNpbmcgbG9naWMvbWFuYWdlbWVudCBjb2Rl
LCBzbyB5b3Ugd2lsbCBlbmQNCj4+Pj4+IHVwIGhhdmluZyBuZXcgbGlieGxfX2FkZF9zY2lkZXZz
KCkgdG8gaW52b2tlIFhFTl9ET01DVExfYWRkX3NjaV9kZXZpY2UsDQo+Pj4+PiBzbyBubyBtaXhp
bmcgdGhpbmdzLg0KPj4+Pj4gIMKgLSBvciBpbmRlZWQgZHRkZXYgbG9naWMgY291bGQgYmUgKmNv
bXBsZXRlbHkqIHJldXNlZCBpbmNsdWRpbmcgZXh0ZW5kaW5nDQo+Pj4+PiBYRU5fRE9NQ1RMX2Fz
c2lnbl9kZXZpY2UgdG8gY292ZXIgeW91ciB1c2UtY2FzZSwgYWx0aG91Z2ggc291bmRzIGdlbmVy
aWMsIGl0DQo+Pj4+PiBpcyB1c2VkIHRvIGRlc2NyaWJlIGRldmljZXMgZm9yIHRoZSBwYXNzdGhy
b3VnaCAodG8gY29uZmlndXJlIGFuIElPTU1VIGZvcg0KPj4+Pj4gdGhlIGRldmljZSksIGluIHRo
YXQgY2FzZSB5b3Ugd291bGRuJ3QgbmVlZCBhbiBleHRyYQ0KPj4+Pj4gWEVOX0RPTUNUTF9hZGRf
c2NpX2RldmljZSBpbnRyb2R1Y2VkIGJ5IGN1cnJlbnQgcGF0Y2guDQo+PiBJIHJlYWxpemUgSSBk
aWQgbXkgcmV2aWV3IGJlZm9yZSByZWFkaW5nIE9sZWtzYW5kcidzIGNvbW1lbnRzLiBJDQo+PiBm
dWxseQ0KPj4gYWdyZWUgd2l0aCBoaXMgZmVlZGJhY2suIEhhdmluZyBzZWVuIGhvdyBkaWZmaWN1
bHQgaXMgZm9yIHVzZXJzIHRvIHNldHVwDQo+PiBhIGRvbVUgY29uZmlndXJhdGlvbiBjb3JyZWN0
bHkgdG9kYXksIEkgd291bGQgYWR2aXNlIHRvIHRyeSB0byByZXVzZSB0aGUNCj4+IGV4aXN0aW5n
IGR0ZGV2IHByb3BlcnR5IGluc3RlYWQgb2YgYWRkaW5nIHlldCBvbmUgbmV3IHByb3BlcnR5IHRv
IG1ha2UNCj4+IHRoZSBsaWZlIG9mIG91ciB1c2VycyBlYXNpZXIuDQo+PiANCj4+IA0KPj4+Pj4g
UGVyc29uYWxseSBJIHdvdWxkIHVzZSB0aGUgZmlyc3Qgb3B0aW9uIGFzIEkgYW0gbm90IHN1cmUg
dGhhdCBzZWNvbmQgb3B0aW9uDQo+Pj4+PiBpcyBjb25jZXB0dWFsbHkgY29ycmVjdCAmJiBwb3Nz
aWJsZS4gSSB3b3VsZCBsZWF2ZSB0aGlzIGZvciB0aGUgbWFpbnRhaW5lcnMNCj4+Pj4+IHRvIGNs
YXJpZnkuDQo+Pj4+Pg0KPj4+Pg0KPj4+PiBUaGFuayB5b3UgZm9yIHRoZSBwb2ludC4gSSBhZ3Jl
ZSB0aGF0IHJldXNpbmcgWEVOX0RPTUNUTF9hc3NpZ25fZGV2aWNlDQo+Pj4+IHNlZW1zIG5vdCB0
byBiZSBjb25jZXB0dWFsbHkgY29ycmVjdC4gSW50cm9kdWNpbmcgbmV3IGRvbS5jZmcgcHJvcGVy
dHkNCj4+Pj4gc2VlbXMgdG8gYmUgdGhlIG9ubHkgd2F5IHRvIGF2b2lkIGV4dHJhIERvbWN0bCBj
YWxscy4NCj4+Pj4gSSB3aWxsIGhhbmRsZSB0aGlzIGluIHYyIGlmIHRoZXJlIHdpbGwgYmUgbm8g
Y29tcGxhaW5zIGZyb20gTWFpbnRhaW5lcnMuDQo+Pj4NCj4+PiBJIGRvbid0IGtub3cgaWYgdGhl
cmUgd2lsbCBiZSBhIGNvbXBsYWlucyBpbiB2MiBvciBub3QgOi0pLCBidXQgdXNpbmcNCj4+PiBz
b21ldGhpbmcgZGlmZmVyZW50IGZyb20gZHRkZXYgc291bmQgZ29vZC4NCj4+Pg0KPj4+IElmIEkg
dW5kZXJzdGFuZCBjb3JyZWN0bHksIGR0ZGV2IHNlZW1zIHRvIGJlIGFib3V0IHBhc3NpbmcgdGhy
b3VnaCBhbg0KPj4+IGV4aXN0aW5nIGRldmljZSB0byBhIGd1ZXN0LCBhbmQgdGhpcyBuZXcgc2Np
IGRldmljZSBzZWVtcyB0byBiZSBhYm91dCBoYXZpbmcgWGVuDQo+Pj4gImVtdWxhdGluZyIgYW4g
c2NpIGRldmljZSB3aGljaCB0aGUgZ3Vlc3Qgd2lsbCB1c2UuIFNvIGludHJvZHVjaW5nDQo+Pj4g
c29tZXRoaW5nIG5ldyAoc2NpZGV2IG9yIG90aGVyIG5hbWUpIHNvdW5kcyBnb29kLg0KPj4gVXNl
cnMgYWxyZWFkeSBoYXZlIHRvIHByb3ZpZGUgNCBwcm9wZXJ0aWVzIChkdGRldiwgaW9tZW0sIGly
cXMsDQo+PiBkZXZpY2VfdHJlZSkgdG8gc2V0dXAgZGV2aWNlIGFzc2lnbm1lbnQuIEkgdGhpbmsg
dGhhdCBtYWtpbmcgaXQgNQ0KPj4gcHJvcGVydGllcyB3b3VsZCBub3QgYmUgYSBzdGVwIGZvcndh
cmQgOi0pDQo+DQo+IElJUkMsIGluIHRoZSBwYXN0LCB3ZSBkaXNjdXNzZWQgdG8gZmV0Y2ggdGhl
IGluZm9ybWF0aW9uIGRpcmVjdGx5IGZyb20NCj4gdGhlIHBhcnRpYWwgZGV2aWNlLXRyZWUuIE1h
eWJlIHRoaXMgZGlzY3Vzc2lvbiBuZWVkcyB0byBiZSByZXZpdmVkPw0KPg0KPiBBbHRob3VnaCwg
dGhpcyBpcyBhIHNlcGFyYXRlIHRvcGljIGZyb20gdGhpcyBzZXJpZXMuDQo+DQo+PiBUbyBtZSBk
dGRldiBhbmQgWEVOX0RPTUNUTF9hc3NpZ25fZGV2aWNlIGFyZSBhcHByb3ByaWF0ZSBiZWNhdXNl
DQo+PiB0aGV5DQo+PiBzaWduaWZ5IGRldmljZSBhc3NpZ25tZW50IG9mIG9uZSBvciBtb3JlIGRl
dmljZXMuIFdlIGFyZSBub3QgYWRkaW5nIGFueQ0KPj4gYWRkaXRpb25hbCAibWVhbmluZyIgdG8g
dGhlbS4gSXQgaXMganVzdCB0aGF0IHdlJ2xsIGF1dG9tYXRpY2FsbHkgZGV0ZWN0DQo+PiBhbmQg
Z2VuZXJhdGUgYW55IFNDTUkgY29uZmlndXJhdGlvbnMgYmFzZWQgb24gdGhlIGxpc3Qgb2YgYXNz
aWduZWQNCj4+IGRldmljZXMuIEJlY2F1c2UgaWYgU0NNSSBpcyBlbmFibGVkIGFuZCBhIGRldmlj
ZSBpcyBhc3NpZ25lZCB0byB0aGUNCj4+IGd1ZXN0LCB0aGVuIEkgdGhpbmsgd2Ugd2FudCB0byBh
ZGQgdGhlIGRldmljZSB0byB0aGUgU0NNSSBsaXN0IG9mDQo+PiBkZXZpY2VzIGF1dG9tYXRpY2Fs
bHkuDQo+DQo+IEkgYW0gT0sgd2l0aCByZS11c2luZyBkdGRldi9YRU5fRE9NQ1RMX2Fzc2lnbl9k
ZXZpY2UgaG93ZXZlciB0aGVyZSBpcw0KPiBhIHBpdGZhbGwgd2l0aCB0aGF0IGFwcHJvYWNoLg0K
Pg0KPiBBdCB0aGUgbW9tZW50LCB0aGV5IGFyZSBvbmx5IHVzZWQgZm9yIGRldmljZSBwcm90ZWN0
ZWQgYnkgdGhlDQo+IElPTU1VLiBJZiB0aGUgZGV2aWNlIGlzIG5vdCBwcm90ZWN0ZWQgYnkgdGhl
IElPTU1VIHRoZW4gaXQgd2lsbCByZXR1cm4NCj4gYW4gZXJyb3IuDQoNCklJUkMgdGhlcmUgd2Fz
IGEgY2hhbmdlLCB0aGF0IGFsbG93ZWQgdG8gYXNzaWduIGRldmljZSB3aXRob3V0IGEgSU9NTVUu
IEF0DQpsZWFzdCB3ZSBkaXNjdXNzZWQgdGhpcyBpbnRlcm5hbGx5Lg0KDQo+DQo+IE5vdywgd2l0
aCB5b3VyIGFwcHJvYWNoIHdlIG1heSBoYXZlIGEgZGV2aWNlIHRoYXQgaXMgbm90IHByb3RlY3Rl
ZCBieQ0KPiB0aGUgSU9NTVUgYnV0IHJlcXVpcmUgdG8gYSBTQ01JIGNvbmZpZ3VyYXRpb24uDQoN
CllvdSBuZWVkIHRvIHByb3RlY3Qgb25seSBETUEtY2FwYWJsZSBkZXZpY2VzLg0KDQo+IEkgZG9u
J3QgdGhpbmsgaXQgd291bGQgYmUgc2Vuc2libGUgdG8ganVzdCByZXR1cm4gInN1Y2NlZWQiIGhl
cmUNCj4gYmVjYXVzZSB0ZWNobmljYWxseSB5b3UgYXJlIGFza2luZyB0byBhc3NpZ24gYSBub24t
cHJvdGVjdGVkDQo+IGRldmljZS4gQnV0IGF0IHRoZSBzYW1lIHRpbWUsIGl0IHdvdWxkIHByZXZl
bnQgYSB1c2VyIHRvIGFzc2lnbiBhDQo+IG5vbi1ETUEgY2FwYWJsZSBkZXZpY2UuDQo+DQo+IFNv
IGhvdyBkbyB5b3Ugc3VnZ2VzdCB0byBhcHByb2FjaCB0aGlzPw0KDQpXZWxsLCBpbiBteSBoZWFk
IGFzc2lnbl9kZXZpY2UgaWRlYWxseSBzaG91bGQgZG8gdGhlIGZvbGxvd2luZzoNCg0KMS4gQXNz
aWduIElPTU1VIGlmIGl0IGlzIGNvbmZpZ3VyZWQgZm9yIHRoZSBkZXZpY2UNCjIuIEFzc2lnbiBT
Q01JIGFjY2VzcyByaWdodHMNCihOb3QgcmVsYXRlZCB0byB0aGlzIHBhdGNoIHNlcmllcywgYnV0
Li4uKQ0KMy4gQXNzaWduIElSUXMNCjQuIEFzc2lnbiBJTyBtZW1vcnkgcmFuZ2VzLg0KDQpQb2lu
dHMgMy4gYW5kIDQuIHdvdWxkIGFsbG93IHVzIHRvIG5vdCBwcm92aWRlIGFkZGl0aW9uYWwgaXJx
PVtdIGFuZA0KaW9tZW09W10gZW50cmllcyBpbiBhIGd1ZXN0IGNvbmZpZy4NCg0KDQotLSANClZv
bG9keW15ciBCYWJjaHVrIGF0IEVQQU0=

