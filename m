Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F0C475306
	for <lists+xen-devel@lfdr.de>; Wed, 15 Dec 2021 07:38:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247199.426222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxNvW-0005Pv-4w; Wed, 15 Dec 2021 06:38:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247199.426222; Wed, 15 Dec 2021 06:38:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxNvW-0005Nh-1N; Wed, 15 Dec 2021 06:38:10 +0000
Received: by outflank-mailman (input) for mailman id 247199;
 Wed, 15 Dec 2021 06:38:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9HFQ=RA=epam.com=prvs=2983c13036=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mxNvV-0005Nb-Fs
 for xen-devel@lists.xenproject.org; Wed, 15 Dec 2021 06:38:09 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f8fbaac-5d71-11ec-9e60-abaf8a552007;
 Wed, 15 Dec 2021 07:38:07 +0100 (CET)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BF6I16h017199;
 Wed, 15 Dec 2021 06:38:03 GMT
Received: from eur01-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2053.outbound.protection.outlook.com [104.47.1.53])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3cxw0c29nb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 06:38:03 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM4PR0302MB2802.eurprd03.prod.outlook.com (2603:10a6:200:93::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Wed, 15 Dec
 2021 06:38:00 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::7593:b5e4:6534:5e55]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::7593:b5e4:6534:5e55%6]) with mapi id 15.20.4801.014; Wed, 15 Dec 2021
 06:38:00 +0000
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
X-Inumbo-ID: 8f8fbaac-5d71-11ec-9e60-abaf8a552007
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U/QSxlGHGKyal8hf0G+hsoMEvpWNpni0nmbGbMaq+unlRWPKbHC7qjYEoE1ki2vrSmvCF3/8ttwlD6lyeXfkROer5XvzzS7kBGnSSmrE1n171E9+jLqvw8kc8+Gw9eielzD00uaXpAgGVTKqBkdjxtiatIFZYkNMPNjOyGjgKVdguCtoiXa2K6uFdERNKYdqbkcugjpICzzNnHVy7qOoU0wjR2HXO0zhhlUKexAEWQ13QhTndfXAP/qxOqssU3p5o/dFMOk5QMnkJjn4DBGAJz+wc+V4Y5ADnWJLrMtjFb5MunZ6pUEGFhTLhbvevmNibbdiGntMlDuSEvktUxkPiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MiWfHZtE1ejyMeD06V3TtShkkURLQ0Gcgg35aR4QIxE=;
 b=mSxFVI3UwhPQAxFEi0z08Ex8kKqBfLNOKwXhDLW4F/8la4coF7ngaxUx/R781ywujv7HQNlMUUzysbwCtVIeOWAO84Y8lrnfkYaVAFvDZesPKT/DEeBjScWP8IaxKDLUj08cBmFQESWTP2cqzD/B/fuw9nrjtjkzLS9gNxgC+x4mV13kMZJmA3kTVu/XOG4F/ZLUxoVRkBt3P4uUv30RJrusDLloWXBDkMnB81ofhKBm6fNw4L6kWA67MMFylDnmopOQ9fg7Yj7MuNglUpwcOsVeyMYI1L63gzIA3NCgn4tzhFOiDz5KW922Ty2v+74b6CinysGASzX4Wv3zCHeQVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MiWfHZtE1ejyMeD06V3TtShkkURLQ0Gcgg35aR4QIxE=;
 b=KJ/TgZp870XjNVNlwkkFrswvwShpAv+4ubimVJ3WWSr+5VJJBWVZFm1eLht1WQqcOsCaPvF1u2xpqHzLpaOjCWYvWw4aZkZ2F47qNVwj1+pvvo0PzU9InwPREFxAUnrw4/6UY5EY/5KpY683ebK3VxEpuKmgqPtHWZ6I/Xu5UAJacfyAUMHfE9QqB3NrQ+/EngqCE0tbN7Obwj7P3yY2dENMweJY3jEQnmUuUdUQZTtt2wt5eczdXJ0sh+5/ed+TGaLkUX56Gtm0lbtm0SxK1oJWdjsXtp8eBsrm8muk7dRCipWMwkrNp0fHbJmEl1WDypAe6Cp5TQwOed6c+2h35A==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>,
        Julien Grall
	<julien@xen.org>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Bertrand
 Marquis <bertrand.marquis@arm.com>
Subject: Re: [RFC v1 1/5] xen/arm: add support for Renesas R-Car Gen3 platform
Thread-Topic: [RFC v1 1/5] xen/arm: add support for Renesas R-Car Gen3
 platform
Thread-Index: AQHX8X5NR2L2gsXoQUG7s41/KjELVw==
Date: Wed, 15 Dec 2021 06:38:00 +0000
Message-ID: <e6087283-063f-bd4b-060b-e366c30add64@epam.com>
References: <cover.1639472078.git.oleksii_moisieiev@epam.com>
 <7ac8512b5479cf192b4aa399fa2501d0bccaaf48.1639472078.git.oleksii_moisieiev@epam.com>
In-Reply-To: 
 <7ac8512b5479cf192b4aa399fa2501d0bccaaf48.1639472078.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4ad59d14-423d-47b5-742e-08d9bf957042
x-ms-traffictypediagnostic: AM4PR0302MB2802:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM4PR0302MB28025762F63032FBAA492DADE7769@AM4PR0302MB2802.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 fw7uGEUsL2oF8GdyRQZkZmxw9OsPL5q7+rD47QjAxoGhlF2X48D6GLWqWT5imRNAawedUlj2z1rlunB9bGfRb9cGcj1tKpdnTcONKTTkSGOAFGr+4In4hyStjIhapsTNehW/olQaKuYDAgk4qGmv96AAExC8MxvPC/SL8ttH6CL01toApwLrKW0fFXcXN3ZXMk0Dy59H91XJvd3eFQ/Tg2GpGuBlhBOanxeVacK4IusikYml0fl0Ueidax2o3L9JcsDRwAgYKsOAwfCfoKdbSfJ3bQxhwxGeOoZzA6juPtuRQWsF82JqZbj5J1u6OUIl5dC2cHLeBQYyk1PpatsUu1iEybrxrxHeUqtyfBL7jbuuCF9FMD884f9JoWSvgU1tJkUmru6U1xarNNYQuIPiJoASqsdYfSfQNO/cUOGVqV2ikchw8kh1ljmQ/ohOhfnA6h9p9ji4x0/Lg1q5XSrYFO1nembFn/PCy6D8FJw2kS9agn5fiQEsrOsYYvnwVdoOrAqmYy1ds6HEhlhRLuYO6IfCttFgkn4ak0/l57BjE83IoT3mrAltyopYzFKiuBNoiIeLpwRwLtJihvFroFjkrJbt6zXjZBvv0lB3CchmEUbVki7LVOOPGRzFIPOMJa2TIbY0nQB65e7F9XpNVoqCJDmsm6SoeUJ9wwP9NlUZrX02nWF7V91B0MskOvCRyU/E66tuoGPaH4NKcHp1xbE4rg0iBohv3QUjMxlQ2QcDt5xCU6tL7u2krpKP0AbwKw/Z
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(76116006)(66946007)(6506007)(53546011)(186003)(508600001)(6512007)(38100700002)(36756003)(6486002)(122000001)(5660300002)(91956017)(64756008)(66556008)(66446008)(66476007)(55236004)(31696002)(86362001)(8936002)(2616005)(38070700005)(31686004)(2906002)(71200400001)(316002)(54906003)(4326008)(110136005)(8676002)(2004002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?T21xN2J3UURQdHJGelRmMjZleUt4Qi9yR3l0UmFPV0VsWFVCRVEvR1JBYnM4?=
 =?utf-8?B?b0ora3h1RU50Vyt1WWhFaEhYVitGV3FPeDhEbS9WOGoyOW9XdzJtMXlTcmZM?=
 =?utf-8?B?ODFtTTd5djdEN0hNSi93cGlmaWNhSjdZblJoSTdOT01aZW1vdG5tdTRhV0Fa?=
 =?utf-8?B?d1R1QnNTdUQycFdCdkZkdG1oYmU3anBOQ3FVbWNmUTVMS0RhY0FtMVJiTEZm?=
 =?utf-8?B?QVA1ZzZBdGVxT0h1SzR0cUF2eVhsaWZtb3ZNcUZKSUR4am4rVUlyekhuaVdM?=
 =?utf-8?B?a0kxVUNkVlNZbmkvWUE4eUtvaTNMeVNibVc1Qkx1SnVRR3VMTkIwcldFZUU2?=
 =?utf-8?B?cjZseEw3eVhLS2RwcXdseFNidE9McDNFSUZrbzV4OHBpRzA0N0wrR1JiL1ZJ?=
 =?utf-8?B?QjRGZlBLZjkzY2xkMzlFZEYxczV0cWJBazVUWS9yeTFWb3ZHYmdoWnBDNExS?=
 =?utf-8?B?R0c1bE5rYzRLWnJGOVJVYlVIRnVUYUlEZ2tkZjZCSktqa2Y2V21IUEZBcXo4?=
 =?utf-8?B?NmN4NVZ5S3ZTN1R5VFlBeUxlN3pIOGYyR1ZGL2Nwc3Y0cGViNEw3cy9lZFA1?=
 =?utf-8?B?L0EzVE8rK1V1dkFob29RaThiZEJMcUdyTlZ0Q0ZIcUZIMDMyY3pmV1lZdGdw?=
 =?utf-8?B?TXpRL05hbmZkcjEybEpwUmk0WDBINkM1aC92NUpybnhhWk5aMlJydE1maVhy?=
 =?utf-8?B?TTJEUXVjYTRVYVorT25ZUHFYY1FNOFFvTytvSDhvS2ZJb2c1Y1g3QURyTlor?=
 =?utf-8?B?QVJ2L3FsMnM1SEhGcUpZdW0wYUdDRVRkUW5zZTRXLzg2blhXWU5EdS84MDRh?=
 =?utf-8?B?UzI0TnBhY05qb20yS0xMUUVHTTFleVlvaHcwY1FXZlNSa3QyWE1nclV4VG5K?=
 =?utf-8?B?ZVpROFlrbGRJV3JOVmJlOGpuaTUrMVJFcWZ5QytiaVdwcU1lL0ZkM3p4RlFO?=
 =?utf-8?B?dml1NDFrMUovQ2NvaEIvNm9oeEVla3VXQy9ZZWd0b2RJS05JVDhPZjkzbFNq?=
 =?utf-8?B?cHVoUmNCdi9PR0doL3FLV25pZVBhTnYvVWZJUmo2Rm1UVmNmNkowRHFFano5?=
 =?utf-8?B?eTRLbFhLbVEyUVZHUzBlT2U2ejR6QVFoWi9DOFhxU0VIWFJOaUpzeEN2Mkhx?=
 =?utf-8?B?eG55TDAxdkZtdjVRWEZqRzVHZ2haanNYbHhDZVV3QkhYSHBEL04xTTF1dWo4?=
 =?utf-8?B?blRuaWk5SVBRMXBDUDJSbkFoS2lCUCtLTlZtVldYNStqUW94dzFwSVRma05t?=
 =?utf-8?B?Z08rUG0vcy8wUnRKb1BPQVI4Z2tMbFE0a1VHdmJKdWZFUlVJQUphU3pJVG9P?=
 =?utf-8?B?OWFMVXBUQm1uOHBuU0Y4dVZkYzllZUIxMHMzTllFWFZVWFpYdVV1Unc0SmpM?=
 =?utf-8?B?eW0xT3RzQ09OWUo0UXdYa1BRMkhCQWJGbkhNemxacUpIai9seU9HR05Vbkov?=
 =?utf-8?B?Q2JncjhBejIrd3IwR2k3cSswRWtGeCsyclg4NjZ0SzNiYSt6cU1vaGJsaC9m?=
 =?utf-8?B?VjlxOVJkNnBlUmN5WldmTEpxT2k4ODB1YmdjTnJUQUdhbjJQMi9kY0N5dlli?=
 =?utf-8?B?UTNFaWJKTlBqWUV1TjRNWnJLWnRVeFMyS0l3eFFPR0I4TE9mVktUTTI0TzVK?=
 =?utf-8?B?RnRlVTJPSXcwa0hKTXpGU29wYnp1ZmNjaDJBbmRWekVOSWFZRXhCQWtra1pa?=
 =?utf-8?B?aUdLTXlrZEtpbUhmTzhjRkgvZGdWOVQvRG52Nk0xUGlNclNNR0ZwdklpZUJZ?=
 =?utf-8?B?SXliQndkZnZwRlVKbDRKZXUwdWFZb2pLb0dPcFUvUXY4TzY4c1ptcFpKUitT?=
 =?utf-8?B?bjZqOUZnQ0VmSzE3NEx3MHVYTVREQnZVSmQ2NzFJWnZsNGpaaUx6N1NndWw2?=
 =?utf-8?B?alJTaStpVHpCdHFpVHQ1cVduZm9kZVFhcDlmMVN5SlZnMmoxZE9WRHUySVlu?=
 =?utf-8?B?U21VSks1MU8xaXl2MndGVUJYeXBHMW9wUGYyeEQ1ZlgvNE9pcG41R1A1Zy96?=
 =?utf-8?B?a0N3SnVqbmNya3BDL3AvWDNvdXZEUlBvY3V0WnYxNkVobldvdU1aZnZyWjJM?=
 =?utf-8?B?UlVSZzh4b0xZZmZURkl0aWRZWUFDOHhxRDdRQTEwMTRhWVd4ZTJKZUtxZy9U?=
 =?utf-8?B?bDUycjh5WHp6LzczN280YmNKbGFnak1qcElVR29DcVVmdEpuNzIvQ3ptbGxs?=
 =?utf-8?B?dWRnb3prUjhhMHErak5ybkZTR2FwKzdBVDJranZPdWpvTGxic3RGMGlCV0Uz?=
 =?utf-8?B?T052cnlWZDdWdmRScW1kVjRsbjhEZ3ZkSXBjcWxXZFFuMm1pLyt1dXN4eTJ3?=
 =?utf-8?B?NkY4bVMyek56Q2Uwek0yaFNMRXZ4eXk1TVF1c2o5MDNBdTNWY2lKQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <72B08F9136D93146BDB0281A758BF3E0@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ad59d14-423d-47b5-742e-08d9bf957042
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2021 06:38:00.3759
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JisOqeuehTc/xUkIlhLEh4BMGMjBDaL8/0L0rCmDq/V6LTZWzInN+lZuUfsVo72vy1nA+s4oDtLBEkqWn4Sgq82LwclbRj4SA61MnzgVkTEV0Nb8vCsC1g7XrLpCa7mM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0302MB2802
X-Proofpoint-ORIG-GUID: xeX2fKJcyCKY90ZtGj3m8zYWQQTabQbN
X-Proofpoint-GUID: xeX2fKJcyCKY90ZtGj3m8zYWQQTabQbN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_06,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112150036

SGksIE9sZWtzaWkhDQoNCk9uIDE0LjEyLjIxIDExOjM0LCBPbGVrc2lpIE1vaXNpZWlldiB3cm90
ZToNCj4gSW1wbGVtZW50YXRpb24gaW5jbHVkZXMgcGxhdGZvcm0tc3BlY2lmaWMgc21jIGhhbmRs
ZXIgZm9yIHJjYXIzIHBsYXRmb3JtLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2lpIE1vaXNp
ZWlldiA8b2xla3NpaV9tb2lzaWVpZXZAZXBhbS5jb20+DQpSZXZpZXdlZC1ieTogT2xla3NhbmRy
IEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0KDQo+IC0t
LQ0KPiAgIHhlbi9hcmNoL2FybS9wbGF0Zm9ybXMvTWFrZWZpbGUgfCAgMSArDQo+ICAgeGVuL2Fy
Y2gvYXJtL3BsYXRmb3Jtcy9yY2FyMy5jICB8IDQ2ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKw0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgNDcgaW5zZXJ0aW9ucygrKQ0KPiAgIGNyZWF0
ZSBtb2RlIDEwMDY0NCB4ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL3JjYXIzLmMNCj4NCj4gZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL2FybS9wbGF0Zm9ybXMvTWFrZWZpbGUgYi94ZW4vYXJjaC9hcm0vcGxh
dGZvcm1zL01ha2VmaWxlDQo+IGluZGV4IDg2MzJmNDExNWYuLmI2NGMyNWRlNmMgMTAwNjQ0DQo+
IC0tLSBhL3hlbi9hcmNoL2FybS9wbGF0Zm9ybXMvTWFrZWZpbGUNCj4gKysrIGIveGVuL2FyY2gv
YXJtL3BsYXRmb3Jtcy9NYWtlZmlsZQ0KPiBAQCAtNCw2ICs0LDcgQEAgb2JqLSQoQ09ORklHX0FM
TDMyX1BMQVQpICs9IGV4eW5vczUubw0KPiAgIG9iai0kKENPTkZJR19BTEwzMl9QTEFUKSArPSBt
aWR3YXkubw0KPiAgIG9iai0kKENPTkZJR19BTEwzMl9QTEFUKSArPSBvbWFwNS5vDQo+ICAgb2Jq
LSQoQ09ORklHX0FMTDMyX1BMQVQpICs9IHJjYXIyLm8NCj4gK29iai0kKENPTkZJR19SQ0FSMykg
Kz0gcmNhcjMubw0KPiAgIG9iai0kKENPTkZJR19BTEw2NF9QTEFUKSArPSBzZWF0dGxlLm8NCj4g
ICBvYmotJChDT05GSUdfQUxMX1BMQVQpICAgKz0gc3VueGkubw0KPiAgIG9iai0kKENPTkZJR19B
TEw2NF9QTEFUKSArPSB0aHVuZGVyeC5vDQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vcGxh
dGZvcm1zL3JjYXIzLmMgYi94ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL3JjYXIzLmMNCj4gbmV3IGZp
bGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMC4uZDc0MDE0NWM3MQ0KPiAtLS0gL2Rl
di9udWxsDQo+ICsrKyBiL3hlbi9hcmNoL2FybS9wbGF0Zm9ybXMvcmNhcjMuYw0KPiBAQCAtMCww
ICsxLDQ2IEBADQo+ICsvKg0KPiArICogeGVuL2FyY2gvYXJtL3BsYXRmb3Jtcy9yY2FyMy5jDQo+
ICsgKg0KPiArICogUmVuZXNhcyBSLUNhciBHZW4zIHNwZWNpZmljIHNldHRpbmdzDQo+ICsgKg0K
PiArICogT2xla3NpaSBNb2lzaWVpZXYgPG9sZWtzaWlfbW9pc2llaWV2QGVwYW0uY29tPg0KPiAr
ICogQ29weXJpZ2h0IChDKSAyMDIxIEVQQU0gU3lzdGVtcw0KPiArICoNCj4gKyAqIFRoaXMgcHJv
Z3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9k
aWZ5DQo+ICsgKiBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBM
aWNlbnNlIGFzIHB1Ymxpc2hlZCBieQ0KPiArICogdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlv
bjsgZWl0aGVyIHZlcnNpb24gMiBvZiB0aGUgTGljZW5zZSwgb3INCj4gKyAqIChhdCB5b3VyIG9w
dGlvbikgYW55IGxhdGVyIHZlcnNpb24uDQo+ICsgKg0KPiArICogVGhpcyBwcm9ncmFtIGlzIGRp
c3RyaWJ1dGVkIGluIHRoZSBob3BlIHRoYXQgaXQgd2lsbCBiZSB1c2VmdWwsDQo+ICsgKiBidXQg
V0lUSE9VVCBBTlkgV0FSUkFOVFk7IHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50eSBv
Zg0KPiArICogTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQ
T1NFLiAgU2VlIHRoZQ0KPiArICogR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1vcmUg
ZGV0YWlscy4NCj4gKyAqLw0KPiArDQo+ICsjaW5jbHVkZSA8YXNtL3BsYXRmb3JtLmg+DQo+ICsN
Cj4gK3N0YXRpYyBib29sIHJjYXIzX3NtYyhzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncykNCj4g
K3sNCj4gKyAgICByZXR1cm4gZmFsc2U7DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyBjb25zdCBjaGFy
ICpjb25zdCByY2FyM19kdF9jb21wYXRbXSBfX2luaXRjb25zdCA9DQo+ICt7DQo+ICsgICAgInJl
bmVzYXMscjhhNzc5NSIsDQo+ICsgICAgInJlbmVzYXMscjhhNzc5NiIsDQo+ICsgICAgTlVMTA0K
PiArfTsNCj4gKw0KPiArUExBVEZPUk1fU1RBUlQocmNhcjMsICJSZW5lc2FzIFItQ2FyIEdlbjMi
KQ0KPiArICAgIC5jb21wYXRpYmxlID0gcmNhcjNfZHRfY29tcGF0LA0KPiArICAgIC5zbWMgPSBy
Y2FyM19zbWMNCj4gK1BMQVRGT1JNX0VORA0KPiArDQo+ICsvKg0KPiArICogTG9jYWwgdmFyaWFi
bGVzOg0KPiArICogbW9kZTogQw0KPiArICogYy1maWxlLXN0eWxlOiAiQlNEIg0KPiArICogYy1i
YXNpYy1vZmZzZXQ6IDQNCj4gKyAqIGluZGVudC10YWJzLW1vZGU6IG5pbA0KPiArICogRW5kOg0K
PiArICovDQo=

