Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A4443CCB8
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 16:50:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217034.376868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfkFe-0002xY-Uv; Wed, 27 Oct 2021 14:50:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217034.376868; Wed, 27 Oct 2021 14:50:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfkFe-0002tY-RJ; Wed, 27 Oct 2021 14:50:02 +0000
Received: by outflank-mailman (input) for mailman id 217034;
 Wed, 27 Oct 2021 14:50:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8lYk=PP=epam.com=prvs=0934bd4bd6=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mfkFd-0002kh-5l
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 14:50:01 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 42a4ddc0-1870-4506-b56e-5f41931ddfda;
 Wed, 27 Oct 2021 14:49:59 +0000 (UTC)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19RBSMmt021844; 
 Wed, 27 Oct 2021 14:49:58 GMT
Received: from eur02-he1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2059.outbound.protection.outlook.com [104.47.5.59])
 by mx0a-0039f301.pphosted.com with ESMTP id 3by4ht9euy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Oct 2021 14:49:58 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB4019.eurprd03.prod.outlook.com (2603:10a6:208:7b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Wed, 27 Oct
 2021 14:49:55 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%9]) with mapi id 15.20.4649.014; Wed, 27 Oct 2021
 14:49:55 +0000
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
X-Inumbo-ID: 42a4ddc0-1870-4506-b56e-5f41931ddfda
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TBMVlx6Csa81gUspTKxX2wW14bPQQ6XgADWZTLocGI2iwYQAVMSJ4ClvzDEEJVq3ghH/AL65NWT7zBjkDl0G3iiIPwaWvIM0pTaFtLWrbS8Xf0jooN9sSc1Gjg/VFJovsrEFUfqI2RNDz4QXw9HUSwi6SJp5cIGHY+4F2mVVEjiH7p98HSvRP8zSehUTiGi1qzXBJlhOUA3RY0QN5A+IjuFyv2lcUJs4ogDTTxHk+5YZLkfp3qZAqsInr3BvPzazUanG/xdCa9K/hmlx0DaEphHTw3MRz0Vu9Wjs3Fit19Dz2DJ0kAoiCBJnVNQmhnqtEeUWs/XzCfs0ees3tihGAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uKCRZI733TaWp+3vG42oP142BKKgodaJONsPpUSr6vU=;
 b=aXO1kz0FYTkQGAOCijJ69D2N+zhB/Ft0vo52v5a3Y7W5lDUfjbt6XOrBqHRBbCKZOwVugnrfdR7rpRN8HOR+1zscH1CHRSXHbHBLLDVxSvXbIHc0luY/8SNe2sDenwmxvB8VegfCcFQIs2XqL8DTqbyEqr18IkZaDIMaCt5TYdZTBohpu7GAmv2DqSB6CX6NGhXtpPt4EfSowzAYCnmfNy75bNx3wWWTE/0EZdVupZSKTD4w5pNFH7CXphmW81Q+7+jkkTkBAt379sdweGIL3UHHdDvJLpSZttt1j/gktTD5WWE87g0skmuI//DSXHDnwFbHDvVTKOC5792Au6tE1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uKCRZI733TaWp+3vG42oP142BKKgodaJONsPpUSr6vU=;
 b=d7QD0qwamPXQNvyDEDReTk/10RvN7rFkOI/+JiyTUY7dS0SrkE8dN7fas22VwzyzVqfZZidUqSl9890SsFtku/ssL2yPMt2hvVogpdDM2lvq1XHE93ADOCOBeYST+qDcxMDmiYRncDa5gD4oyZcl+RCvmZxXjohc9SXHdAb9EYgUHkPurBTSxrn4FayCL4goHxjasucOuLFq/N2hBDTyhCtjC8JP2iXBxQbt9lv/ix4Wx4N+2Ppo8WJYF31WGSEu03ZAJF5Ae97Lu8FPDUxScKgAW+NM1WHw+Oywq2nl9Am8SgyT+SOoKJmAbDPNBf+PKppNj9hnIryNlezbeijX4A==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: "jgross@suse.com" <jgross@suse.com>, "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org" <sstabellini@kernel.org>,
        "jbeulich@suse.com"
	<jbeulich@suse.com>,
        Anastasiia Lukianenko <Anastasiia_Lukianenko@epam.com>
Subject: Re: [PATCH v5] xen-pciback: allow compiling on other archs than x86
Thread-Topic: [PATCH v5] xen-pciback: allow compiling on other archs than x86
Thread-Index: AQHXtDtdCEW9atNFMk2qqaldf5A98Kvm/I6AgAATI4CAAArGAIAAAOAA
Date: Wed, 27 Oct 2021 14:49:54 +0000
Message-ID: <c4efe0b5-89de-aac1-6ec5-5f137fa3b9d4@epam.com>
References: <20210928073501.433559-1-andr2000@gmail.com>
 <71ce7c97-1d08-9fdf-b217-53eb914a29a6@oracle.com>
 <a54ab50a-f35c-26b9-3907-20c014a1120a@epam.com>
 <af42493e-ec31-8673-5532-1f0c8275b2c6@oracle.com>
In-Reply-To: <af42493e-ec31-8673-5532-1f0c8275b2c6@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 37051162-eebb-40c2-3ef3-08d999590a1d
x-ms-traffictypediagnostic: AM0PR03MB4019:
x-microsoft-antispam-prvs: 
 <AM0PR03MB4019F78BCBB0111488C7D780E7859@AM0PR03MB4019.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 OuN55pPMC67MLDM2D8E9MXT3RniJMOJHgrQsmPsAYVuI5cPq1HWnzVXeGjBhCZT1NtMKuldNo0NDpVOtCBp2Ab3KQUhyrcL3FALpObIxlAGvPaqsxCqdrLTQg7+Fdirb8m0xSK1XEyoL0R4wkg8c6TciH4NSmT4lDlinO0VgTAKqpzhFqHXUdzpjhbvP3esXcC1W7Qj+3VNEBY5Kneii7mujLVpbH7FDtu4BpbXZjw5swmOdP6hnXzZVldd9Cw3d9P1W/iItp2ZiFD8iqwHxH+vWpL805+P17mNhmntA8a4cFIaRblzp8hkilMS6j7deqv+ftESehkVV8hEGjuGpEdk//UM+dfFOBMGQal5euReiCc/UizKvL1Od+y2qwwEwqqsNUSO+vw7sc7wmnthbOOLa5CtrQbxWKQBxa3qYZnMr89ItBUdo8Pa0jXS2z0EYCynyNz2WjSrFmIQviJ6+I08g9qLxa5t0/Wxnm7/xQy89/5wEY6hqxHzm21+JcMaiO9oBv7RLxbVR7SqR+i4TGgQzmlW3xOSCb1tl7XneZa2jg1aZepHS6rAVQtGTQoIqxKAdRlW6ZuIe6xkMfL6kozLf00wnXzyqKGsKvx0uNas8E+U/p14Dwl8Hw2Ru9MvG/gAnBI7yz6iPvPFLNsl4WVmGi4cmlH1TzjHHvq0ukccZHpJiWJCPP3otn01W3QTrx5BWy6ii/Ct9aSSoI1x+rdyaCA64aSkLA98Ml4oDawjau+wLcaim15l47axzpQsR
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4744005)(53546011)(64756008)(86362001)(6506007)(5660300002)(122000001)(66476007)(36756003)(38100700002)(66556008)(4326008)(71200400001)(66946007)(54906003)(26005)(110136005)(66446008)(76116006)(107886003)(31686004)(91956017)(31696002)(508600001)(2906002)(2616005)(186003)(8676002)(6486002)(316002)(38070700005)(6512007)(8936002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NG9PNVdtUmRxOGNOR1VuNVBwQ1FtNmQ2ZHNiMzJGNGEvNUFvRVR0cnpxNDdL?=
 =?utf-8?B?NWpNWjJ4bU5uWnNNazhRY1pSemY2Y0t2dVNBYk84T0RJcWhVVndHeEZRUFpS?=
 =?utf-8?B?aEIxYkRRZkpYMlE2VjY3bzM5VEF0Z3BORm9LZkUrWlV0UlcxNG0rMW1mT3VP?=
 =?utf-8?B?ZVA4VTFkenZpSG5IU3UvcHloMzQwRDJield3cUhybzJZZ1JiSWJLSy9EZ1hr?=
 =?utf-8?B?eWF2bWM4Q2tiTUROcE95WkQvTy85ZFlSaStJVHlicnZmLzVNSkRGQkFTVDVE?=
 =?utf-8?B?WFQ4VStHRWltd0NyeCsxZURtY3hKNnRYTC9lN25YS05mY0R1ZWxwWWhGVFV5?=
 =?utf-8?B?Vmh6dHcvaUdvV1NNdWdQa0xRL09zZFAwMnRadGVKUFk1N3BPeW96cGZsSnlI?=
 =?utf-8?B?VEorMDlVc1J0ZWVzb0MxakgxSExWVVVmTXhlRnRmWEhBenVDUWtmR0dVSkVz?=
 =?utf-8?B?bnpOenBuZncrWW5FU3VMWVBtRTVncngzRStLREpnV1VHRmdYV3UyeEpEeDhZ?=
 =?utf-8?B?U0prMk5NTkhtajZhWGZmZHRrazh5ZWdSTGt1bGk1enhvTWN3M0gySzJGK2hr?=
 =?utf-8?B?bUxkdjYzbGFJaFpLRzlOaC9HQ2U3U1puK0QwckgrU21HcnYvaXdHTmVhdFZP?=
 =?utf-8?B?REtJSTgrdkIrbHRmYlJpOVFOTEJkZC9xNTMyTEtzK2ZYd3dLVUZKWThJUFZD?=
 =?utf-8?B?S25Nc1BoZWJYOW5HYklqdlIvMzN4YXl1SUxGd21NeUxlRFdTdGlhTG9JdTZI?=
 =?utf-8?B?UUFrYTgyQ0czeDJYbk0ySWdldlI0MzY4d1BvODBFTWFqQ3RTbmR5WlFYOW5j?=
 =?utf-8?B?VmNxL0t6b25Jc2FqQzJtVSt0YzF1c3ZVUFhHRWRKTFFVNGx2VGlvWVRmQjhu?=
 =?utf-8?B?NFdUUDhGN2hLVkprN25XeHBRaWZOYm8vaUVIdG9lV2tkam1nOXk1bGliM0xl?=
 =?utf-8?B?eENYMVZ2SzZ2Y3UzTHAveVJwQXNWeFRPUFZXMzJFclN1V1RXV3FqUUhIMi9n?=
 =?utf-8?B?bzZjQ1FKVnltYURLQVNKMGFzZW94d1VJQ3drWktBL3JMckx1cTRZTTlCOE5q?=
 =?utf-8?B?M3JycGF6NGlmUFNXSmZYUkZnZmIvdmlGSytDOVVmMzBNOXJ5U0d5TWZOSDdM?=
 =?utf-8?B?dWhJdUtWTGtCeGNlRW0yamZYR3QwL3V0MHJyNGdmWWIvZHZ4QWszaUZDMjNY?=
 =?utf-8?B?bkZ2akZpMUE4Y1FCVnBwa1BUZEZlWWpPdjAzZ3pENVJmTWszc2N6emF5cVZV?=
 =?utf-8?B?Y3ovUStTZWw5ckZVdjN4b2grMUJQVEVETnBwS25ldnpWM0UzYTlXQlJvdSs2?=
 =?utf-8?B?d3dXWEI0UjhSa0RtYmpUR0ZKRHpWaG1ibkE5K3NHbUwyakdIdEYwaktLNE9M?=
 =?utf-8?B?TGk4Vmd6NThXK2MrSW1wUUF4NnlRNndRNWg4WHBYVmUxWDVmV2VadzV0QVBZ?=
 =?utf-8?B?Z3p0dkJ5NHYzN1lIQ3VTZG1uNmFsL0Y0UHZ2VEpKWXFOTi9SSkVHcVBqMVhp?=
 =?utf-8?B?c1d6SVVFMEtLZTV6eDVTTlFPNUVYeDN3aXVMOU51dmZvcGtqUjJHRUNxVHAz?=
 =?utf-8?B?RzRIQjlnaG94Z0FyRGRPdUZUeDhMRm10b3JoaE5GblZvdHYremI3N0c0NFlI?=
 =?utf-8?B?UTVnZVdHY0xmdFRLTXVmUzBsS1I0U2dqZVp2VGlpczg5U0dIZS93dyt4bXEr?=
 =?utf-8?B?YjVLc1phSEZDbnp4WnV4Vk5ZNk5UWXV3akppR1hlbndqc3dPYjVlbjRWMXBS?=
 =?utf-8?B?ZEpLTEE5cGVJQTdqVzZiV3AzZ2h4dWYzbm9Qb01USVFzVjUwS0JVWnhJNXBG?=
 =?utf-8?B?L3BvWGc3SXhQNy85b2tIeHZPaEdjalBUMFBuSXEzWGQyMXBOTSt5clp1YmJF?=
 =?utf-8?B?WElHZG1rZFdweU82RXJHcDM3WjIyQ3VOOVJDTWRUU3ZEU29BakVNalVnOVp6?=
 =?utf-8?B?NStXbHVBVFE5MkZWR0pzZlFGZ2dOSGovNzFidU1xVGpoUjZ0bkY0Z1N2akVF?=
 =?utf-8?B?a1hxNFdlcFhEc3ZyUHpwMERycGxPSUZVT1prTDBJb0gyQWdoaU8xM2YrRjZh?=
 =?utf-8?B?SXMxNlpzWEdSdi9lZ0g4bWxpMEM1ZUdLRDk5OWROQ2lzWENRWFd2SnZMdm5h?=
 =?utf-8?B?TGJYdUxkL0FxaERwZnJQL2xiUUVLbW5PeHJqVjd6ZXNTdU53cVordGdTaS8w?=
 =?utf-8?B?bVFIVG1ycE5BMWU2QkszaUx1QW5vWHRoQmE0UEdXaFo0SzAweUlIYXhWV2w0?=
 =?utf-8?B?YVo4M0p3dm5VanBxdTZ5UGJMaFR2aEtqVnp4Q09HcTBudUpBRCtkYnc5eUhq?=
 =?utf-8?B?NzRSQVcvMzRZL1VjR0o1aVViRm1WKy9zZjZQOUpwcDNlZzFhNk0yUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BD1825029B228A4DBD83AA8A8D2AABFE@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37051162-eebb-40c2-3ef3-08d999590a1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2021 14:49:54.9617
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CQ4NEgit0tTWutaYSsfoqMwWVSJsFMJPYaWPQ/ve9L9N5R3YYymVNnIJbLTruStksy9rluPWNryDNMh1tSghwEfSY2Yu7POdHdxMcUlM2ms0C6giRNmn5nMrcPnZHb28
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4019
X-Proofpoint-ORIG-GUID: UDjy5fVWp9j5P5bKqyOJ4dorSncNx4ke
X-Proofpoint-GUID: UDjy5fVWp9j5P5bKqyOJ4dorSncNx4ke
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-27_04,2021-10-26_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 mlxscore=0 mlxlogscore=851 priorityscore=1501 phishscore=0 suspectscore=0
 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2110270089

DQoNCk9uIDI3LjEwLjIxIDE3OjQ2LCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6DQo+DQo+IE9uIDEw
LzI3LzIxIDEwOjA4IEFNLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+IEhpLCBC
b3JpcyENCj4+DQo+PiBPbiAyNy4xMC4yMSAxNTo1OSwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOg0K
Pj4+DQo+Pj4gQ2FuIHlvdSBwbGVhc2UgcmViYXNlIHRoaXMgb24gdG9wIG9mIDUuMTUtcmM3PyBU
aGVyZSBpcyBhIGJ1bmNoIG9mIGNvbmZsaWN0cyBkdWUgdG8gY2FlN2Q4MWEzNzMwZGZlMDg2MjNm
OGMxMDgzMjMwYzhkMDk4NzYzOS4NCj4+Pg0KPj4gSSdsbCB0cnkgdG8gZG8gdGhhdCBBU0FQICh3
aGF0IGlzIHRoZSBkZWFkbGluZSBmb3IgdGhhdD8pDQo+DQo+DQo+IElmIHlvdSBjb3VsZCBkbyBp
biB0aGUgbmV4dCBmZXcgZGF5cyBpdCB3b3VsZCBiZSBncmVhdC4gSSBleHBlY3QgbmV4dCBtZXJn
ZSB3aW5kb3cgd2lsbCBvcGVuIG9uIFN1bmRheS4NClN1cmUsIEknbGwgdHJ5IHRvIHNlbmQgaXQg
dG9tb3Jyb3cuDQpJIGFzc3VtZSBJIGNhbiBrZWVwIFItYidzIGFmdGVyIHRoZSByZWJhc2UgKHRo
aXMgaXMgZ29pbmcgdG8gYmUgdjYgb2YgdGhlIHBhdGNoKT8NCj4NCj4NCj4gLWJvcmlzDQo+DQo=

