Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F364A8606
	for <lists+xen-devel@lfdr.de>; Thu,  3 Feb 2022 15:19:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264857.458125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFcxY-0003jN-Qq; Thu, 03 Feb 2022 14:19:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264857.458125; Thu, 03 Feb 2022 14:19:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFcxY-0003h3-NF; Thu, 03 Feb 2022 14:19:40 +0000
Received: by outflank-mailman (input) for mailman id 264857;
 Thu, 03 Feb 2022 14:19:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ArrP=SS=epam.com=prvs=403311c35b=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nFcxX-0003Hn-3f
 for xen-devel@lists.xenproject.org; Thu, 03 Feb 2022 14:19:39 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51029db4-84fc-11ec-8f75-fffcc8bd4f1a;
 Thu, 03 Feb 2022 15:19:37 +0100 (CET)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 213EAQ71014061;
 Thu, 3 Feb 2022 14:19:31 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2058.outbound.protection.outlook.com [104.47.14.58])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3e0gdc03cj-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 14:19:31 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by DB7PR03MB4668.eurprd03.prod.outlook.com (2603:10a6:10:16::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 14:19:28 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6%3]) with mapi id 15.20.4951.012; Thu, 3 Feb 2022
 14:19:28 +0000
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
X-Inumbo-ID: 51029db4-84fc-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GoZ2dhsbozElKXDTvL6q2kJ8+Mqp8ugT59pOhFcz6HTNGfK3bXQBYtUB1Xa2s29+oHpNmlH09LYyl8qSUOPGGwzux+Fb7RiJz3f6e5zgYnFCOnvKh+di0JT+LJXz0j7Hc4EfesrDRHD7AfoOogJ+OMUpXRzw/d6L/uoCDyzzX5r0gQ9FChIM93yw56GR2MWbxQqBu+Q8g9heHSPaeLrSv7YwkGfNVUSAS2/1cW/vaGwJVwgjrQoH4dTWnZ/JbtOb+/y8gNG2VZm5ierhNfKwxdP+HN2gUkIJyfC0inUmSptIaeNH2Sj+hp0VHpXDGMP1bKmK6J6zl/+FJ2mVle2vjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XBz62T6pXh9O7HDCCwgmvA8biJZnCClmlZ8wQ8WkB/E=;
 b=mnl/GR/I0Y+zfUd1TO2r8THBhYnY7SjeFnDKtFntdBgKcKSOtct8FltoiEwMNXVHv40FwLtQZ3n4Scy9IqSlNRgnYtA0WyvbaK5CJ+YXHtXysb71kDnLjU22U6JuvDRo/IXCC1i2cc2kHQ/Gyr2oNKQa8MzfFQxshClKJ9AYVZYnIt9lu3Rhx3RcqoEZlYRjruTIZQme/LWdtZoNXEvxVBOeSdw+p+6ZiKo6GRR3UmnEFbQlMkqgxb+AIKvqyFAJJmsFcNnjtQDOqQFAm1pwh2WRUJvWRP0EPp6o8nEMFPL/D/ochjRVTRMYzEjGDRx07oNMH4Bae1jDXFsh50zZ/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XBz62T6pXh9O7HDCCwgmvA8biJZnCClmlZ8wQ8WkB/E=;
 b=GmRC8a759LJ5VHO+5sc4rpk/SIHcgZzX7InFu2LlfYM8aINxnAyJPfesmw6rVI2jCNWwIfHP6YP/rzM5lFUyE45dEpE0zRqnEAr5TZ8mMvEiyh9OJi2a0px6bfJoexOLgIIr953BTPIPsqWvt3TMQjF3rcLuNKV/M/qrEqscAxrPolStEcgmRD+uZ6sc+xyrF38ZAwkeLS44EvV1KBkD93NbWllxriYUNRenilo/NHVd7mBgr9oiHLDtoXv66jvRGIRMT62TcrTb1GmUM5DurKu9ybDJ6VB5ucTdDnHixiPGC2w3w407T8jyuNnVP8TEjerPrkM5fYXn8Ci+VfTcIQ==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
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
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
Subject: Re: [PATCH v5 06/14] vpci/header: implement guest BAR register
 handlers
Thread-Topic: [PATCH v5 06/14] vpci/header: implement guest BAR register
 handlers
Thread-Index: 
 AQHX4ewHyWAyD811HEGp8pIjUuVWNaxf8XWAgB1bfoCABObrAIAAAsYAgAAJ6wCAAAmfAIAABBOA
Date: Thu, 3 Feb 2022 14:19:27 +0000
Message-ID: <c1087de5-4b53-5a97-6c26-e341b53a027f@epam.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-7-andr2000@gmail.com> <Yd8RJfpEalnfl+CC@Air-de-Roger>
 <d493b022-3c78-1721-e668-48f4553056a9@epam.com>
 <df98cdbd-36fe-0386-c068-2a1540f10188@epam.com>
 <9c1f376a-0df3-67eb-7fd1-bb75ae130e77@suse.com>
 <0171761f-d90f-3e3a-5c8f-e32d70096e27@epam.com>
 <be1546ec-0465-9398-9681-7e85e2ca9455@suse.com>
In-Reply-To: <be1546ec-0465-9398-9681-7e85e2ca9455@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 47f69ffa-63e3-4bdb-49af-08d9e720300c
x-ms-traffictypediagnostic: DB7PR03MB4668:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <DB7PR03MB46689B0008E7BFDCEDB8DC36E7289@DB7PR03MB4668.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 kR4JYkKM9WgwCagwx7dejqLQN3VTvZALTFggeXEVyqGsn92X9JP+IqHfjW15eFReb5DWgcq0z6Y617MG8v4N9OGq5VxlXmWw6oU+Qdl1Sp6e2AT2CU8g7CRc45fKYFfuuFXFEmrn9Ggj34liGLstRzTlKDDjHkAzgychn7ClqaLKzy7+Ru7dfghGbhx1OH083VXftREy4cEzrerEiPmpQoncYQiVGC6acWBEqZJdaYG4VHgLBmeuhq3b1WaUCvFL5s+BpDbIdDa2qnjGwmek0WPIA4Tt7OEqvDnFMYIyo/wzKBDakHrhN1sBJmeTNlunuPIdYLE8rZYqox/pV++mwWMEoU9j/luv9zoGQgbySFhq1y1HjeaOxJgqAK8k2Tm+t3ulUfEvoph4nhmOR2ckx7S3dwVNzmor1fJRm4JI7GB3O0PDH5e0icnDA7ZBJd9kyXZVmIPGzGQm+UoJnFD4m1oDjCrQXBKdLNbBdwTu66NS5FJyjIrY+lmZVTq11g2lZ+/UkHn4putbMuwUUR6HDOlke6sMR3Qa6yQg3Mq2a+9Dc7YjtZbmfH8bCxxQIy0W4DAq8V4MUFb8BJJIMIUb74G1FOLrdMlSBXKurMctJOG5OSEsXQO6MAwg33MfZOxQkv+RvUVgCCz+EArC4C4t4XX7JmbsDjLnLCCD/j2a56FbVaDr+uCUdN9HpunCAzooeZwPCJu3vvMt6WTVIz37lpN2a1XVjFrKzr4eWW88Pjf8di6P4khTZvFbBS1ajCek
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(7416002)(86362001)(36756003)(6486002)(54906003)(83380400001)(6916009)(5660300002)(2616005)(6512007)(316002)(31686004)(508600001)(2906002)(71200400001)(53546011)(66946007)(66556008)(66476007)(66446008)(76116006)(91956017)(64756008)(8936002)(26005)(6506007)(31696002)(4326008)(122000001)(8676002)(38100700002)(38070700005)(186003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?azZzaC9lcG5oWjJuTWk0aE1XSUtYemdPbzAwNzd6cXJLek5ralQwQXNhakFQ?=
 =?utf-8?B?d0l0dGQ2U0pyUnpqMXJaUUdsZWMwZ0gzU2hPS01vMTl2SGZOdUwzU0dLcUtN?=
 =?utf-8?B?TTZXenRqVmhEalhIcjcyV0RDRXgvSlowaXhRYkJYSlV1NFRBMkZwQWlFbW1s?=
 =?utf-8?B?OXl0TWNvSHREVnJJMytRQkpaSGUxSmNEb2VDOE9IeEI4d2ZRYk4xV1FOaVBT?=
 =?utf-8?B?a3p2NURQeCtFM1NlU2tzWFRkeEFwZjF2bkRRMXdTUTJtY0lZZnFsNnZYdjNk?=
 =?utf-8?B?djRMTldFcVhVVWZFYzBSOEI4V0M1QlVsemswbm9rWTlLWUNsYnNhcE9ZSmMz?=
 =?utf-8?B?WUl2MW5hNGVWOVpzN0NHRUFTdzBEL00rZlJYUVFJQnYzbGk2TGtGeEp6RFgz?=
 =?utf-8?B?RUhaclpqb2k0RUVaaTVhZTR0Wm9NL1JlVGRFMU1pV2g0cUp2ZmtRdzdFb2Vm?=
 =?utf-8?B?ZER1Q2NrNEhwc1ozSGcrNlFDWFJpUmtadkEvZE0zTnMvQUh3bjV2WU03ZThm?=
 =?utf-8?B?eVR0ZnU2QWJmS2t4UXRiemNKUFN3WTZQVkFWTUVjZzBWZHc3SWRMUVFac2ZR?=
 =?utf-8?B?YUlCcUloR3lCNVVMcWlWNTNIc2o1WGc0NzhBWm0zZE80K0lNOUttWnpzSFZu?=
 =?utf-8?B?dzE3ZGlScCt3RThoS0NFeXZubUdCTWR3ZzhyRnk5UjZFMUR0MGRaWFFzKzZi?=
 =?utf-8?B?cWh2bnhQdDgyRGcrUEZDY3pab0dYYXFTMzlrRVZId2ZVNzlCVUNlL1dVYWVU?=
 =?utf-8?B?VkdlUFV6NSsyZGtrU1d3YkczL0dPRDc0Sndvby9ISm9FQlVxaDlObEJkUjNU?=
 =?utf-8?B?aDcrUzNkbDNDS29uREcyenNYUTVHWmNDdi9Nd081NFZVUzY5dk1wVVc2N0pk?=
 =?utf-8?B?QmNrU2NKT2c1WXpRQk5rQzZReFRLajkvMm1Nd3QxN3JyaVZUOWdJR0NHUkFJ?=
 =?utf-8?B?aDVTa29rZ243ZlRaYkZDMlVSZnVQcThWeEdDWjlKODI4RWtEUUs2TUVvRnZQ?=
 =?utf-8?B?RXdmbjIxWGU0UU5TYnRjZm9oWGxRcytmYjFvR0oxbVEvQjV4QzVxSGMrWDEz?=
 =?utf-8?B?YTlkNlQ4dmRRWjc5RkJRSXNxcnEyYy9mcndRS09NREJYM0VjRDNoUktCZzNT?=
 =?utf-8?B?UWZwK2tzUW5YcmxFcW5HRG1mZnJ6eVRaL3hNVkVVNy9FV2RrR2M4Z2dleGZr?=
 =?utf-8?B?U2ZacUpiaSt3bVNhSWtBcHFOSGMzT1FpQmkwcUt3eWJWd2dWczlBREg5YnlH?=
 =?utf-8?B?bHgvMUtQb2tTcGxyejV0Mk5UbTdWamI0SUp1clkxc0d6a1BmQVN2cTZEcVdq?=
 =?utf-8?B?bWdFOGErSWJFamNKUmFsOUpBZHJEUEpmc3lyeFprSVdVNjZJQTZSaGhUQ203?=
 =?utf-8?B?eTFDVWFlRGR1UnUxYWZaN215OVdwZ2VDSFFsR0VrUEZwY1gzaXFtKzZoSTkr?=
 =?utf-8?B?NjA2V0Z2SXhwQ1d1N25qN2VhR05ZMG1KdDJXODNjWjdDdU9XbUNxbG5Ldko2?=
 =?utf-8?B?dmpwVmcrWWxZQXUzdCtQR1Y0U2hEdjdTa1Z1ZUhiRnM2UDdBR0VLR3NZaTVl?=
 =?utf-8?B?dWhXVFBQZkhkZDNSOXpRdlBKWUxqUVo4aW9lRFVaSmQ3OWExWlQ2SmkyRWN1?=
 =?utf-8?B?a3pHNUZMQ3RPRGE0Vjg1SHNVQjI1NUN5c1FYaFAvYURsU2pwS3AvclFzVElm?=
 =?utf-8?B?dmhpdXo0ditDWWtxR2tkS1dVUCtuTzNvY0FDZ1hab2hyVnZCc1V5aEVHUldJ?=
 =?utf-8?B?Ti9DUk94WHA3aldHU3FKU29Va3plbnQyV0dqL0h0dFNMbWJVTEorYTExamsv?=
 =?utf-8?B?aTgybDBMN0xJcmFpVDd5ZUduc3k3MytETGsvdy82SFpvelRqTjUrQnVlaEhr?=
 =?utf-8?B?L3pFWVBTN1lrV1loN29zSU5EWjVRWStBdzJ5QkhROUJlck5Mbk5wN1JtNWV3?=
 =?utf-8?B?dmkxaVp3WGs1TTg2ZTN1M216VDJDUE9jYk1QeEVOM1R1THFxSHFPeThKOE1T?=
 =?utf-8?B?ZysvSVpuSm5qcDlBQ1FZM1BWQU1jdlRJZmJSelBUMFgyZXlsdWx2TEo1eFZp?=
 =?utf-8?B?S280MjdRSkxZdklkWUhleVRIYlkzMUhuRStKWWxaeDFnaWtTMXpWWTVXK1l0?=
 =?utf-8?B?TVkzMzNSdFhrRExmQUgweGpRQjFWMGpxNHUvSGFaRFhMNUdwNW1qa2ErNjZ2?=
 =?utf-8?B?WFpGMjNTaWMreExYb2o5NjhULytkZE9ydTdBSGlWVlBjZTVMVXRpRXI2cytq?=
 =?utf-8?B?SktRYm9YWGEvZW1MWFRObk5CYzRjcGE2YmJrNDUzY0NnbkF0dFZ0bVZONnho?=
 =?utf-8?B?MS9TZlMwV0l3cVNlbmJlRG9WOTZySEdjRjREM0JVOWl1S2JqWVJTQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CE7F0917E9158648A13DF6108A5E5BF3@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47f69ffa-63e3-4bdb-49af-08d9e720300c
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2022 14:19:27.9155
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j1FQbVrBpo05W2+E67uepjng5DmCg4qEyjIs8zrCuH619Qi1Ako5tt59p+yIAC9mrfzpueQysaGofK/8a2edl6vxq2yRDaazSiSRTHbD5ZYHkF4bDVQdc09psUmL7CSY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR03MB4668
X-Proofpoint-GUID: 9o8Hidz9AuAfXLP93jEKuopQN9PQJFan
X-Proofpoint-ORIG-GUID: 9o8Hidz9AuAfXLP93jEKuopQN9PQJFan
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-03_04,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=999 phishscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202030089

DQoNCk9uIDAzLjAyLjIyIDE2OjA0LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDMuMDIuMjAy
MiAxNDozMCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pg0KPj4gT24gMDMuMDIu
MjIgMTQ6NTQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDAzLjAyLjIwMjIgMTM6NDUsIE9s
ZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+Pj4+IEFsc28gbWVtb3J5IGRlY29kaW5n
IG5lZWRzIHRvIGJlIGluaXRpYWxseSBkaXNhYmxlZCB3aGVuIHVzZWQgYnkNCj4+Pj4+PiBndWVz
dHMsIGluIG9yZGVyIHRvIHByZXZlbnQgdGhlIEJBUiBiZWluZyBwbGFjZWQgb24gdG9wIG9mIGEg
UkFNDQo+Pj4+Pj4gcmVnaW9uLiBUaGUgZ3Vlc3QgcGh5c21hcCB3aWxsIGJlIGRpZmZlcmVudCBm
cm9tIHRoZSBob3N0IG9uZSwgc28gaXQncw0KPj4+Pj4+IHBvc3NpYmxlIGZvciBCQVJzIHRvIGVu
ZCB1cCBwbGFjZWQgb24gdG9wIG9mIFJBTSByZWdpb25zIGluaXRpYWxseQ0KPj4+Pj4+IHVudGls
IHRoZSBmaXJtd2FyZSBvciBPUyBwbGFjZXMgdGhlbSBhdCBhIHN1aXRhYmxlIGFkZHJlc3MuDQo+
Pj4+PiBBZ3JlZSwgbWVtb3J5IGRlY29kaW5nIG11c3QgYmUgZGlzYWJsZWQNCj4+Pj4gSXNuJ3Qg
aXQgYWxyZWFkeSBhY2hpZXZlZCBieSB0aGUgdG9vbHN0YWNrIHJlc2V0dGluZyB0aGUgUENJIGRl
dmljZQ0KPj4+PiB3aGlsZSBhc3NpZ25pbmfCoCBpdCB0byBhIGd1ZXN0Pw0KPj4+IElpcmMgdGhl
IHRvb2wgc3RhY2sgd291bGQgcmVzZXQgYSBkZXZpY2Ugb25seSBhZnRlciBnZXR0aW5nIGl0IGJh
Y2sgZnJvbQ0KPj4+IGEgRG9tVS4gV2hlbiBjb21pbmcgc3RyYWlnaHQgZnJvbSBEb20wIG9yIERv
bUlPLCBubyByZXNldCB3b3VsZCBiZQ0KPj4+IHBlcmZvcm1lZC4gRnVydGhlcm1vcmUsIChhZ2Fp
biBpaXJjKSB0aGVyZSBhcmUgY2FzZXMgd2hlcmUgdGhlcmUncyBubw0KPj4+IGtub3duIChzdGFu
ZGFyZCkgd2F5IHRvIHJlc2V0IGEgZGV2aWNlLiBBc3NpZ25pbmcgc3VjaCB0byBhIGd1ZXN0IHdo
ZW4NCj4+PiBpdCBwcmV2aW91c2x5IHdhcyBvd25lZCBieSBhbm90aGVyIG9uZSBpcyByaXNreSAo
YW5kIGhlbmNlIG5lZWRzIGFuDQo+Pj4gYWRtaW4ga25vd2luZyB3aGF0IHRoZXkncmUgZG9pbmcp
LCBidXQgbWF5IGJlIGFjY2VwdGFibGUgaW4gcGFydGljdWxhcg0KPj4+IHdoZW4gZS5nLiBzaW1w
bHkgcmVib290aW5nIGEgZ3Vlc3QuDQo+Pj4NCj4+PiBJT1cgLSBJIGRvbid0IHRoaW5rIHlvdSBj
YW4gcmVseSBvbiB0aGUgYml0IGJlaW5nIGluIGEgcGFydGljdWxhciBzdGF0ZS4NCj4+IFNvLCB5
b3UgbWVhbiBzb21ldGhpbmcgbGlrZToNCj4gUGVyaGFwcywgYnV0IHRoZW4gSSB0aGluayAuLi4N
Cj4NCj4+IC0tLSBhL3hlbi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmMNCj4+ICsrKyBiL3hlbi9kcml2
ZXJzL3ZwY2kvaGVhZGVyLmMNCj4+IEBAIC04MDgsNiArODA4LDE0IEBAIHN0YXRpYyBpbnQgaW5p
dF9iYXJzKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4gICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgcmV0dXJuIHJjOw0KPj4gICDCoMKgwqDCoCB9DQo+Pg0KPj4gK8KgwqDCoCAvKg0KPj4gK8Kg
wqDCoMKgICogTWVtb3J5IGRlY29kaW5nIG5lZWRzIHRvIGJlIGluaXRpYWxseSBkaXNhYmxlZCB3
aGVuIHVzZWQgYnkNCj4+ICvCoMKgwqDCoCAqIGd1ZXN0cywgaW4gb3JkZXIgdG8gcHJldmVudCB0
aGUgQkFSIGJlaW5nIHBsYWNlZCBvbiB0b3Agb2YgYSBSQU0NCj4+ICvCoMKgwqDCoCAqIHJlZ2lv
bi4NCj4+ICvCoMKgwqDCoCAqLw0KPj4gK8KgwqDCoCBpZiAoICFpc19od2RvbSApDQo+PiArwqDC
oMKgwqDCoMKgwqAgcGNpX2NvbmZfd3JpdGUxNihwZGV2LT5zYmRmLCBQQ0lfQ09NTUFORCwgY21k
ICYgflBDSV9DT01NQU5EX01FTU9SWSk7DQo+PiArDQo+PiAgIMKgwqDCoMKgIHJldHVybiAoY21k
ICYgUENJX0NPTU1BTkRfTUVNT1JZKSA/IG1vZGlmeV9iYXJzKHBkZXYsIGNtZCwgZmFsc2UpIDog
MDsNCj4gLi4uIHlvdSBhbHNvIHdhbnQgdG8gdXBkYXRlIGNtZCwgdGh1cyBhdm9pZGluZyB0aGUg
Y2FsbCB0byBtb2RpZnlfYmFycygpLg0KPg0KPiBBbmQgYnR3LCBmcm9tIGFuIGFic3RyYWN0IHBv
diB0aGUgc2FtZSBpcyB0cnVlIGZvciBJL08gZGVjb2Rpbmc6IEkNCj4gcmVhbGl6ZSB0aGF0IHlv
dSBtZWFuIHRvIGxlYXZlIEkvTyBwb3J0IEJBUnMgYXNpZGUgZm9yIHRoZSBtb21lbnQsIGJ1dCBJ
DQo+IHRoaW5rIHRoZSBjb21tYW5kIHJlZ2lzdGVyIGhhbmRsaW5nIGNvdWxkIHZlcnkgd2VsbCB0
YWtlIGNhcmUgb2YgYm90aC4NCj4NCj4gV2hpY2ggcXVpY2tseSBnZXRzIHVzIHRvIHRoZSBidXMg
bWFzdGVyIGVuYWJsZSBiaXQ6IEkgdGhpbmsgdGhhdCBvbmUNCj4gc2hvdWxkIGluaXRpYWxseSBi
ZSBvZmYgdG9vLiBNYWtpbmcgbWUgd29uZGVyOiBEb2Vzbid0IHRoZSBQQ0kgc3BlYw0KPiBkZWZp
bmUgd2hhdCB0aGUgcmVzZXQgc3RhdGUgb2YgdGhpcyByZWdpc3RlciBpcz8gSWYgc28sIHRoYXQn
cyB3aGF0IEkNCj4gdGhpbmsgd2Ugd2FudCB0byBwdXQgaW4gcGxhY2UgZm9yIERvbVUtcy4NClRo
ZSBzcGVjIEkgaGF2ZSBzYXlzIHRoYXQgYWxsIGJpdHMgYXJlIHR5cGljYWxseSAwIGFmdGVyIHJl
c2V0Lg0KU28sIGl0IHNlZW1zIHRvIGJlIHJlYXNvbmFibGUgdG8ganVzdCB3cml0ZSAwIHRvIFBD
SV9DT01NQU5EDQo+IEphbg0KPg0KVGhhbmsgeW91LA0KT2xla3NhbmRy

