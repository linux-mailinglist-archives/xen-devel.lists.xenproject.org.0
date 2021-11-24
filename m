Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1638E45BE4F
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 13:43:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230418.398303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mprcD-0000sy-6t; Wed, 24 Nov 2021 12:43:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230418.398303; Wed, 24 Nov 2021 12:43:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mprcD-0000qg-3S; Wed, 24 Nov 2021 12:43:09 +0000
Received: by outflank-mailman (input) for mailman id 230418;
 Wed, 24 Nov 2021 12:43:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gGpx=QL=epam.com=prvs=1962e93d75=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mprcB-0000qH-Cw
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 12:43:07 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1173b1b7-4d24-11ec-9787-a32c541c8605;
 Wed, 24 Nov 2021 13:43:06 +0100 (CET)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AOBSeZ4005299;
 Wed, 24 Nov 2021 12:43:03 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2112.outbound.protection.outlook.com [104.47.18.112])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3chjq98u17-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Nov 2021 12:43:03 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB6243.eurprd03.prod.outlook.com (2603:10a6:20b:144::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20; Wed, 24 Nov
 2021 12:43:01 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%8]) with mapi id 15.20.4713.026; Wed, 24 Nov 2021
 12:43:01 +0000
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
X-Inumbo-ID: 1173b1b7-4d24-11ec-9787-a32c541c8605
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=itAE2mvjKETm+U5948U2MUikKt3qaWcq12dVFY98fNtWd+IeV7hG1lTd1M0lZBYVsK2JBahJLkz9T8iLgsFVNtzc19lbq13VwfczKwMp7tHVpvcLl7pIpWzcCnbpm31J4I29Pgotr2gXRjJB9XV7DNg6urBVpI0CTskINaa7sLfG4c+T7XPNPlUs97HwSVf/0e7Ua84VZdqGWrroj74UrPLClKRvzQT3rBXPRO5+UGxXHCRgA3qoNLORmiTFEHT40foNxF8w78ZV0Jpa9idO0fF6ACpiUi/arf/kJ5erLgz6cGj4IghnFw+uRv/ChLnOXRn7AyxIdipkWidtwv3njA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N7CrNLBJcWpdz23VcauZEF/pG8wXvclqtHNAiT3FZ0E=;
 b=CQg/PBa3ujQyIwldk8gTBzYoiL+pM0p40by76pOOFOMyzrVqr9jwR1i2noMKjJn3/rAyGqwRtE6OmRUq8s1ACHbsjn5xqBf63U6yB4/H7lAqiHcfJIdhAm1jYSwEi76EXtOTGSMKTG/EaY1qvAZAh8BpM5y3NlXdMuK6uUXvqvw1FgCmNt+zOu2r/XgOJjx0FEyt/0xEQ7kM6F9pOVetpwY3uIXP0+tgH/e9msqznt6aWTEGB2azHc7cmS+DIa9OHojy18YCMsFq0RbCObtRA0BlUi2A8Ni6X8jcdLT4BKzKIC2eb+0SrfkOIn6phLoRSkqMC+aKEHKPPZmCG2ta9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N7CrNLBJcWpdz23VcauZEF/pG8wXvclqtHNAiT3FZ0E=;
 b=hxKeweyPj22jYQBIx3EOkYnecMXDBQiMAO0OSFp9sYB9ndJ1z+wguWuucC7qe60qxgWbQDz8v0ZDsIHA3fqL8tlxUqKbe45GPGx3xy29HctPwHhkvM9SSc9fz3CuUuogQLtysVK73EriKppnXP+vozZkZT956Pi2d7KhPt5RLmBpuHOhLtbK6z5D9x3nyB9EP2OEi6K2nuQja41+f/mYqsdbJMCOMjuzNbcimFO4yxop8ESLyr1OqAoNaZntPS9VdqaaKuSsw6Q5FReZJRU5DcF/Miiz8m3+n9zCVtNRKEFGxFebKjkJxZ9YAt3tuYG30rBMQjMqxmsffZosg6bQUw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org" <sstabellini@kernel.org>,
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
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 10/11] vpci: add initial support for virtual PCI bus
 topology
Thread-Topic: [PATCH v4 10/11] vpci: add initial support for virtual PCI bus
 topology
Thread-Index: AQHX0hJNBZwMmlboFUG58hx6442EAqwJkx2AgAkVfoCAABMSAIAAAc4A
Date: Wed, 24 Nov 2021 12:43:01 +0000
Message-ID: <a661f3a6-a479-4a98-3326-593ab38f0263@epam.com>
References: <20211105065629.940943-1-andr2000@gmail.com>
 <20211105065629.940943-11-andr2000@gmail.com>
 <217a5684-34af-e08c-2d70-563857ec5595@suse.com>
 <6c6951dc-2abe-e180-1442-e68097e59d22@epam.com>
 <YZ4x0ANosX3hPfSh@Air-de-Roger>
In-Reply-To: <YZ4x0ANosX3hPfSh@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5c1671bc-dbae-4b23-d7d6-08d9af47f37f
x-ms-traffictypediagnostic: AM0PR03MB6243:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB62437835E0E6DA8CA1D523A3E7619@AM0PR03MB6243.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 +70sgpEw99ahCMTL8ewLQHmqopprmBVMKR7FG7qL/Qgl7jv1TlP1fRNBCc9WVjhAacRJl0z0sBxv66S8LG6dj5bFnm0DRIWCbMpvKb6HVEd2pnEjSmlhIG8rEMU4jBLCT7o7HIsnidIgCF5Y15q/oQ2IC+bAVPPQyZcIxFdsQwWKkl1fT0b1S0njHlGLoIhxRkFQjcxEEV5Dt7DkqYjJ2v6YILaezozObCnLNXXOfnvuQVaeT+Bdyp3EyLdGCK28yXimd6aQBOhGSaz/L8wPCRElPG/E8e/6Dj8FjsZjwJa1i6bNwGst6OiTSNuTO5KN6X/thL3YAVCFe0lCwqIrt3CXxsd/GkMJ0WLHO5NQxNEB8x3AClPHK28dAMthK5vhMnohwcDf4rPqaMKWUCFK4l5z3X9UTv859zv+isgfkcXzfkzJsimpIzQam2q6s7UyxMdePKjUEFlypZwim/57Lt5l81hXkcfitid4l3oj4+OXRpVQW6G0lfyB7xHsde5HnAn5InAbIlod3Bul2RtRfKBJHBPYUK6elHx/hRpdOd0Aw5qBV9d6jrOaqzCOspsyBxpmD/oxZIRJv9dCN92li4s+AArLlkO+dXpqAouycsVLgrAkdIJQeIY831c8YiIhg6SPno03oDTVWxB3vUC1eSsmBAprzw/gVmNqcxukRMNZXXQqmUsHCAFfbcVeC7WYAfhpQze21ktNmPpplZEBsgleVaYtUvnTfYUJqiNUuuRjB4B6mTHAJ2XGcjX4LMGB
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(31696002)(122000001)(8936002)(38100700002)(5660300002)(26005)(54906003)(6486002)(186003)(36756003)(316002)(7416002)(4326008)(91956017)(8676002)(31686004)(66476007)(66446008)(66946007)(66556008)(64756008)(2906002)(6512007)(76116006)(508600001)(6916009)(71200400001)(6506007)(53546011)(86362001)(38070700005)(83380400001)(2616005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VkcyZmZEVC9FN2gwYWRUblZlMXhRbmdQdVA5QnFBQ0VzU3ZtYWFEc1pLdDVN?=
 =?utf-8?B?ZTJzeVBZdzFqcXRmRUZaNFJJalhtcEFpWjRiU0lnUEFJTkl5Nk1LSzFocC9z?=
 =?utf-8?B?Q0pndElGQzdiWE5QaHdJd1NPbGpPZ3I1dmYrOGZGdDh5YlB1OWRNZGp0NW9D?=
 =?utf-8?B?VU80elNjUXJsbFZILzFQZG00NklIVnBOakdHK1pqc001T1Izc0VIV1oxS2Ey?=
 =?utf-8?B?N2JNejI5b0tWVUxuM3o3ZXlZbzNKeXpBMHRXalRxK2pwdHJkR2lwL1Z0UGRR?=
 =?utf-8?B?UUFjOFFWbzhndmc1VnBzSkh6cTQ0c0srNnlweEFQbGxkUUJ1YkhlTjVkVldN?=
 =?utf-8?B?dE82S0FpYjVHTUdBRG1PNEJBUFluU0xEN2ZXRCtveGxmdjd2UTErMXdJNlJr?=
 =?utf-8?B?UCtGcGhlQlgwcS9yRGZ0L1ZVQ1JMd1ZiQWViQkw2N3BOQ1E3Z1FpaDc5QS9G?=
 =?utf-8?B?WGJLbFVvelo0S3BMM0lRQ2VIZWdVK2N4cWRxa25hSzU0TFVRdEIwQjlpbXA1?=
 =?utf-8?B?NTUzaTNFQUN4NjRya29SVU9RaVZqTEJHN1IzNElNL1ZrNkZ6MXZXWGVTMWRO?=
 =?utf-8?B?ZU1QelA2Mzd5bk9XYjhJOHFRN1RzVWZaMXB1ZWsyNmw2SzVJcUxRZ1ZnT3Za?=
 =?utf-8?B?TW52aUhRcmo2TU94cUliZitRMTN5SFU5dWlKYlhUTnpzSGVodkYxQjZISnNB?=
 =?utf-8?B?MEY3dXpuSDBCay9BckVIY1pRcitZb2JrMlFEaEJ5Si96ZWdsRmZsV0I3em9L?=
 =?utf-8?B?emxRRzZ2KzRpTmp0cU00YVRXL3hWMVpEM1Qxai9iSjBsYVQyOGZ6Sy95QUhO?=
 =?utf-8?B?NHVFd3M3Vmh6d0c0NUlQeWRaL0ZCcDhwSUpGdGw4V2psRnpRYmFZb2p5R1J2?=
 =?utf-8?B?Z3BETDhxSW10UFI5RFU1cGdxYzNKNjN6ak11d2lDNktZenBuOFBCQUx2Y2tC?=
 =?utf-8?B?ZjdMaEZzVGZZeDREWHJDd1JRQk5BcG0vUnpzKzJsSFJMci9pU1RTQ1RFN0Fr?=
 =?utf-8?B?NmpQdWpLZFhCMXFtTDB4UDJmSlY4Z2pjcThTTlJ4ZFlSYVIvYU9iQWRTNTh6?=
 =?utf-8?B?MGpWT1huU25yYmVZbHJGZnUxU0ZmdWs4cVkrbHRjL2Y0Z0psdDRRV3FONjV4?=
 =?utf-8?B?cDAzVFRXL2pDTUdZU2F3MkVJTVo2VldBdW1FYTY3Rmc0eGZSUUVucFh5ZUQv?=
 =?utf-8?B?S0RKTGNJZ0RPWTN3UTVMbGw5Ylh4VnBERmdvRG5QUXFHbVlXRkRjbjBaTmhN?=
 =?utf-8?B?OEdKOU5yeVNWcGdRczdBcUNaNUY4b1BBUEJyaVkrQ01mR1E1dkd1Y2NyVjEx?=
 =?utf-8?B?bVZjWnNrNXFZWnhLRVk1ejdJbU0zWEJBSkNQcUIyV1R1cUxFclExL2FOdkNK?=
 =?utf-8?B?VDk0OUlwOE1GczJkMWFvR3ZPMXVIWnYvVFZYQlpWdnJrc3pTWkVuZExhdlFI?=
 =?utf-8?B?VG5wQU1HdXJ0QWNHNEpERURNYjVQcVJuQVVtZzJHM1JOMEJoWnIwWWdjWHFK?=
 =?utf-8?B?aHRETkVkVWgzMXFzcEo5d2czanAzcHFUQjRDalU3QlFqWlhwTXZUc0R6d21F?=
 =?utf-8?B?ZmZteGhoaFc4UkxtbFBORHRQTWhQc0NHRmNOOVNhRHpTZDNySE1nT1duLzBJ?=
 =?utf-8?B?QThwMU1tdlNiajloSmhHb0x3dkN6VzJEZVJadjQwU0lwNlluWVRiODBPeXZX?=
 =?utf-8?B?L250RXBBTC94bkY3bUVYa3dhbjgrQ1AvMkNOVmo3bFhRaGcwN1lPOTNQMHBN?=
 =?utf-8?B?N2RLeGdGejIzbkwxQVNReTlnNFo3Rjh1dURYNlFOVXZkTGxxbXpDZUZsNGZj?=
 =?utf-8?B?RzFxSmg1MEFveCtvVG8yM2lZa29WVG1pRmlNekNxbk1lRjAvMnEvRTYvQ0Jo?=
 =?utf-8?B?d2FwMHVzMUJkS1FIWCtUZU9GQ3YyaS96eVJXNEN5TG9HSDVFczB4QVFONjZi?=
 =?utf-8?B?RG1IWlZpRHp1dVkrdEFjQ0s2WXRyejhwMDMzZXFvZjYzMjllclhRVHVPQlMr?=
 =?utf-8?B?RHdUeGEydjJjNExENS9kQkRaenZuS2JhZ1V1ZEVxQUJwRStuVHVtVXplNXBO?=
 =?utf-8?B?T3hCOHl4SjFRNzZBR3VRY0R0Z0wrbktndWJNck9oV09td2tzUG93MngwRXZR?=
 =?utf-8?B?ZHE4V09VTlVyb1VQKzVSRUIrM0Fnc3ZIa3Mva0FKKzQ2citSKzFYMUhIK2tJ?=
 =?utf-8?B?cFVIbGxBbzlyVEtUWkFYMEltTHNLZlJaWklpRWQwN05FYXJjMjUrb1Q0clYw?=
 =?utf-8?B?QnY0Q1VCOHFzWCtNZnY2TkdmSGFhajdudmdvMGY4SFlRVC8zcHN1NDhDN01o?=
 =?utf-8?B?aXVDS0RiSlhMUWJaUks5NVUxL0tXSzdQVkNEV2FtL0dDdVdOUWpydz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <48B8556218D19949AA010E3D3ECF3333@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c1671bc-dbae-4b23-d7d6-08d9af47f37f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2021 12:43:01.1301
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CKn0Xx6eH8qvWM6R5UpPwWpkcfcqBJqVonXJqiMM6aCVNFNf5jXrug7cwYyW3Zwh0hD9aeiD8+OVYjTlzDTkohlfs3kzehPmKmrKye53/QD/1SWJI/8SIRJp8zT2BD3Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6243
X-Proofpoint-GUID: 07KWPNsqDYr9aJcM8yoaagKpmsrBsHyA
X-Proofpoint-ORIG-GUID: 07KWPNsqDYr9aJcM8yoaagKpmsrBsHyA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-24_04,2021-11-24_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 mlxlogscore=941 adultscore=0 clxscore=1015
 suspectscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111240071

DQoNCk9uIDI0LjExLjIxIDE0OjM2LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBXZWQs
IE5vdiAyNCwgMjAyMSBhdCAxMToyODoxOEFNICswMDAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byB3cm90ZToNCj4+IEhpLCBKYW4hDQo+Pg0KPj4gT24gMTguMTEuMjEgMTg6NDUsIEphbiBCZXVs
aWNoIHdyb3RlOg0KPj4+IE9uIDA1LjExLjIwMjEgMDc6NTYsIE9sZWtzYW5kciBBbmRydXNoY2hl
bmtvIHdyb3RlOg0KPj4+PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vdnBjaS5oDQo+Pj4+ICsrKyBi
L3hlbi9pbmNsdWRlL3hlbi92cGNpLmgNCj4+Pj4gQEAgLTE0NSw2ICsxNDUsMTAgQEAgc3RydWN0
IHZwY2kgew0KPj4+PiAgICAgICAgICAgICAgICBzdHJ1Y3QgdnBjaV9hcmNoX21zaXhfZW50cnkg
YXJjaDsNCj4+Pj4gICAgICAgICAgICB9IGVudHJpZXNbXTsNCj4+Pj4gICAgICAgIH0gKm1zaXg7
DQo+Pj4+ICsjaWZkZWYgQ09ORklHX0hBU19WUENJX0dVRVNUX1NVUFBPUlQNCj4+Pj4gKyAgICAv
KiBWaXJ0dWFsIFNCREYgb2YgdGhlIGRldmljZS4gKi8NCj4+Pj4gKyAgICBwY2lfc2JkZl90IGd1
ZXN0X3NiZGY7DQo+Pj4gV291bGQgdnNiZGYgcGVyaGFwcyBiZSBiZXR0ZXIgaW4gbGluZSB3aXRo
IHRoaW5ncyBsaWtlIHZwY2kgb3IgdmNwdQ0KPj4+IChhcyB3ZWxsIGFzIHdpdGggdGhlIGNvbW1l
bnQgaGVyZSk/DQo+PiBUaGlzIGlzIHRoZSBzYW1lIGFzIGd1ZXN0X2FkZHIuLi4NCj4+IEBSb2dl
ciB3aGF0IGlzIHlvdXIgcHJlZmVyZW5jZSBoZXJlPw0KPiBJJ20gZmluZSB3aXRoIHVzaW5nIGd1
ZXN0XyBoZXJlLCBidXQgdGhlIGNvbW1lbnQgc2hvdWxkIGJlIHNsaWdodGx5DQo+IGFkanVzdGVk
IHRvIHMvVmlydHVhbC9HdWVzdC8gSU1PLiBJdCdzIGFscmVhZHkgaW5saW5lIHdpdGggb3RoZXIN
Cj4gZ3Vlc3RfIGZpZWxkcyBhZGRlZCBpbiB0aGUgc2VyaWVzIGFueXdheS4NCk9rLCBJIHdpbGwg
dXBkYXRlIHRoZSBjb21tZW50DQo+DQo+IEp1c3QgdG8gY29uZmlybSwgc3VjaCBndWVzdF9zYmRm
IGlzIHN0cmljdGx5IHRvIGJlIHVzZWQgYnkNCj4gdW5wcml2aWxlZ2VkIGRvbWFpbnMsIGRvbTAg
d2lsbCBuZXZlciBnZXQgc3VjaCBhIHZpcnR1YWwgUENJIGJ1cz8NClJpZ2h0LCBmb3IgdW5wcml2
aWxlZ2VkIGRvbWFpbnMgZG9tYWlucyBvbmx5DQo+DQo+IFRoYW5rcywgUm9nZXIuDQpUaGFuayB5
b3UsDQpPbGVrc2FuZHI=

