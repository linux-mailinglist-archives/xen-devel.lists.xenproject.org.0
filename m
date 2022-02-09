Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD2F4AF397
	for <lists+xen-devel@lfdr.de>; Wed,  9 Feb 2022 15:04:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269217.463252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHnaF-0007AO-0q; Wed, 09 Feb 2022 14:04:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269217.463252; Wed, 09 Feb 2022 14:04:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHnaE-000788-So; Wed, 09 Feb 2022 14:04:34 +0000
Received: by outflank-mailman (input) for mailman id 269217;
 Wed, 09 Feb 2022 14:04:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lRsY=SY=epam.com=prvs=4039ed7fca=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nHnaD-00076u-Au
 for xen-devel@lists.xenproject.org; Wed, 09 Feb 2022 14:04:33 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3333e4e1-89b1-11ec-8f75-fffcc8bd4f1a;
 Wed, 09 Feb 2022 15:04:31 +0100 (CET)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 219DxfKl016067;
 Wed, 9 Feb 2022 14:04:30 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2056.outbound.protection.outlook.com [104.47.14.56])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3e4dtg09n4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Feb 2022 14:04:30 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by DB7PR03MB4523.eurprd03.prod.outlook.com (2603:10a6:10:19::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Wed, 9 Feb
 2022 14:04:25 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77%3]) with mapi id 15.20.4951.019; Wed, 9 Feb 2022
 14:04:25 +0000
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
X-Inumbo-ID: 3333e4e1-89b1-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YY8YcwTxwWOryLgY89NigYJuhWN2eUvFlozRY3ZcxiZnvoVpTy2ZAluiIXsdQBQpLiTBypvjRM6y951G9urOg0BU1UciQWZ0TZyBsjEUo+ADK1llDkI/Gy2GK/PRYePIT5SyO+5YR306Y3gmJzbdVoSrSSiZ2O/GKL1z0N1tVUEMFm5PvJUw1GZqEFtcYURmbyVxCxiXCya0hIK0v6u8EIXLgHynfieHsVwV8W3GMRlNm1co96h1pxvJdEgJ6LdFjXGMjvLVqh2ZHIkYYsUMiTST0skkEqXWYcqUhZvnGf8ZBtCsQ8zw9ZBtPwvp7x1IWHTrOA5cZ0Cej8dcwaWLbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fcucRsHBZMhsJaoRK7TEghykSWrfqtMf4Qvq3TJUhfk=;
 b=BKrgvD2f58z3zC0etRvui9/QtxYArIsVi/svz1JJcJO2fFQ1TlS+fFQ/g/+xHzJRuzfDpDsheZbPk71+EcKgQms+IH445AfuUifUXgVDgXShlTrAar5zLGkV2nHtUWJXVU7Q3BQ982nHuXOpupzk9aiy9Yoe8ydMS2nWLRChuLSLAQZhPaA5Ch54zKIc4FdAMzmRKIvSAyfNgSjb9ymCMTAVJzJaLavwTTx0JRN/oImIstBFHrwos857r/1C8rpLykHHhtBLmOLoQu2Y9kHQsvCcJlVPEur/aTcviLPYQaQt/dxKDsOMkNuGN4cGwlIFfz1GRHp4DEOMPssFSzLUnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fcucRsHBZMhsJaoRK7TEghykSWrfqtMf4Qvq3TJUhfk=;
 b=RWIuFWDTLR7xstRYgcO3HSvhhq9pgguRMDRcUfJ6Bu8D45UzHIkCknsnmFedGR2rNWheENO8XlaO0oAsHrYqqRyY0O6OwZyAnrU8lbxazFTwTGoubi0XRYTbxaiIVw8OtZGtJKzkVmSbA4AkvEK/JCkKfgmgKIBdPntZ8OOHwZmIKE44JikvJ/VDdrl7fpQtX9DskmqNpTZ11A3mXp664dkbvhpikWjf33iPsphcr1FsTtIK1BambdthY9grAlPV0gZJOzTN4NMdbsAwYufzC0HBS//J0vl/OGnLIalUepYJ1FDVVozStFQ9G4ROOgddOqePe9+48PDDw2DJm4+N/A==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
        Oleksii Moisieiev
	<Oleksii_Moisieiev@epam.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [RFC v2 2/8] libs: libxenhypfs - handle blob properties
Thread-Topic: [RFC v2 2/8] libs: libxenhypfs - handle blob properties
Thread-Index: AQHYHbudSLxWMD9F30i+VGpqKP0vfqyLP4KAgAAA6oA=
Date: Wed, 9 Feb 2022 14:04:25 +0000
Message-ID: <6cc391f2-44a7-76bf-83c2-152155f39880@epam.com>
References: <cover.1644341635.git.oleksii_moisieiev@epam.com>
 <069eb801bc999ea85c529fa5033121e96b9df06f.1644341635.git.oleksii_moisieiev@epam.com>
 <0b3068fd-d06f-1135-7b84-5400cca0d3de@epam.com>
 <9319cca0-d437-fe55-9b13-967bcd3ef4ac@suse.com>
In-Reply-To: <9319cca0-d437-fe55-9b13-967bcd3ef4ac@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c609dd1c-3bfd-465a-499f-08d9ebd514d6
x-ms-traffictypediagnostic: DB7PR03MB4523:EE_
x-microsoft-antispam-prvs: 
 <DB7PR03MB45238FBBD487439C94252CF7E72E9@DB7PR03MB4523.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 o7hdA2pS9BOVr7F8USNvOk32cP0ASyOkxxEPMVOUsb0rC7D8PtAbRwXWND0nyQ2Wq6GgqO5hueBDguNAB2VEZbKhwj3/Thz3qd1tGbNYSwqIWYDfIVa5RPUD2ese8fLAFqAG1jbra/MoIYC0TAde7xLnr3mTKUnWkC2C+AvWIRMSFXhKrWq1mh4J19DLhzx/n7Q2yTLC0MEAr7sgpC9OV0+vncMFodHHEA5/ugkBfoaG88S/VxgMmlcfLn3+bBoEItrUJDichJFEoRP6ooQAQzLfUa6Fbwe6S7BiOyW06tcicMWLiYARD8FnSMNqd5mdWM6pm4BybblXlS7VYj4POrbSKVSag3o8O9pOoiGJL1jJJdy7TrB+PmK0zUBTyScS14urQaOo9/U3p7ad5nJPLc+3Vu7P1qbGjoPkTv8ZU1UsdOPkMxz8rZ0RbY7YyroEl8HyWs2wrdFPpTBNo6ctL1JkabKJTPNxjGMwNCcfupSpe0g1FUGegSPSvipgglnEj4IHLpXqhqH+uMR8LdujBskE3XIrXRxksALzzTteAMVorvFEs52Z9IhEQekSJIMu1SeGTzD6KSJ9nOqOAqg1ZBYShC8Ld6rnEo78pony4aqBASPKa6IYe76GZN1+Zb3nE+Inaiupl0Ht3QNQhEwRh+p0p2RNW4GHdTTqfHpcfNxPlzIUF0SchBMfz+Qdi5J2/tgsVvV98SftVjqscY87fPbrI+ZUhX3Qb2qeduoV5bmYFowDGbtZzfGvXI1LzPM4
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(54906003)(66476007)(8676002)(4326008)(66556008)(64756008)(66446008)(6486002)(76116006)(91956017)(66946007)(316002)(508600001)(31696002)(6916009)(36756003)(122000001)(31686004)(86362001)(38100700002)(38070700005)(83380400001)(55236004)(6506007)(26005)(71200400001)(6512007)(2616005)(53546011)(186003)(5660300002)(8936002)(2906002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?QWlOY0NnbVJZS2IxcmFETGNtNjJFdGdBWGRYOVZkRXRrc09hTis2SmJvd1pO?=
 =?utf-8?B?WWhONWZXMmhudktrMkk3Q01kQlorckRueExxczJWVG0wM2VGbnJLaFlocWNp?=
 =?utf-8?B?RU94VmRxM2xBQUQzMWVmUnhVRXVSNG9QYkhlcmxISkxuSFRMeC9MRVhhamtC?=
 =?utf-8?B?N3NGMUc5Q1BLdU8zZDJDN2hsVmhKd3RDWVJtMkFEY1JwaFhtc0tVaFpYQVFE?=
 =?utf-8?B?SnZ6bXZjYkt0VERqVVRFMkFUUUVoRWhqbzlkMU84TEZNOFJ4YklieXl6eTJn?=
 =?utf-8?B?K3ZCT29PQkIzalBwYXl2UkFCV282cmxIellZN3NGVFgrbmwrNlF4M0hNb2tx?=
 =?utf-8?B?RCszT1U4b0toL3grQTFxOWh4Vnh3OWtIeFhrRGhtNnltMm9IUmRyR1dubHJv?=
 =?utf-8?B?R0ZjUHBoQ29CVHpNWlRmaSsySmI2andmU1N0R29LelJaNksxTnVTYTNyVytl?=
 =?utf-8?B?MHA1YzFuQ3RKY3VPbDJKNExPaWx6VmFZSXU4YU9JVkprYTR1LzQ3T3Y4QkdM?=
 =?utf-8?B?S2xDYjVoY01VMmxwZlBsRUlnQTI4ZWxNMDhoMmZmdWxhN2hIQlVvMmtRbEJa?=
 =?utf-8?B?YjNxZnhnQzM2Qzcxa2h1M2pXdENvQUFxWGx0ZE5NeUprdlJFTC9Gb0JwR0JJ?=
 =?utf-8?B?YlV5QWUxNEl0TE1XYnhtdDUzVVoxNGp3N3lZNVVMN1czZTFIOThIYW9BYUJu?=
 =?utf-8?B?bmZzQWNYRWNvZHRyQ0g3TnBxYnJSZ1orcWRQSDRCekl0NkVMT0Fuc2lOYXpM?=
 =?utf-8?B?dCtnTjJtcmVOWjB2N1NlV1ZBNkN4aWxlQXozV2diVUtYNGxhSitiRFh3bTBi?=
 =?utf-8?B?TWJ3aVdScjRDbit1SGc4TjI4TXpianMyNlFKTjVUTE5IczhVaHZ0dGJmamNB?=
 =?utf-8?B?cnFvMkNFUTNVNUYyZDFiNFZ2QUtjNUFNTjFyb2pNZmtWb0VZZ2hrNHV1SkJq?=
 =?utf-8?B?NHhDOG9xZHpIVGlsOS9vd0dqYm5OcURDc01YdzROcFN3RGNjVXQ0WUFJVlZS?=
 =?utf-8?B?WWcxTUh2SDY0SWszVS9PWDJJMm53WVpGQmJPaFZEd1g0VjBORVNhb1lZK1dO?=
 =?utf-8?B?Tk9zRk5zK2FTVE5mNGtJcThMYmRkZmhRamI2VlBMNG53cnNtR09TeXpRbnBI?=
 =?utf-8?B?dkVLSnBVNEE2VmJFSXVqTmtIV0hkYm5zSVRrWS9lZitMcTdsYUtFRExYa3pk?=
 =?utf-8?B?aCtwWUkrRU9CdFYrUzliMldpOWJSU0k1NEpuc3U0cHNNZjgyb0svQmFhMGx5?=
 =?utf-8?B?Tk5DMDlpY0lJQklsWXQ4YkRaWjRIc04zRjhoemtqeCtnbHlIMjJXV2U2UXk1?=
 =?utf-8?B?eHI4UDhnSFlPOHVNNXVzVjREWmlJR0grSUxOM3g3dGtIVGhvSUNGbUFGTXNH?=
 =?utf-8?B?em96OFpxUDdGb0hHVHlSRVpIdWlEa3JQenpDcFR1aXBXYjZqZDg5MXBsUHhw?=
 =?utf-8?B?MDEyZExlNHFnV1ZJeDhhQis5SjhEQ0FKR1NneTlBUEpmY29RRHVBeHU4WXVE?=
 =?utf-8?B?S1hKUjFHaFR4ZVk5YTV1US8xa1BDaVU3ZmdTS3lkdXNnbmF3MTg5eXZFQTZT?=
 =?utf-8?B?Njd6MDBkaldiRHpqSHpYKzJaMmRKUVBMTjVzR0RidU03TTJ5bm5ITTZhU1FC?=
 =?utf-8?B?UTlMZkZWRlpFWERLSy96Yjhic3puZXpuVFFUM0lObVh0YjVXRUJwS0VWQ0xR?=
 =?utf-8?B?ZWFQWHUzcGs0MUxLN1VybWhPUS9VeWxlejZkUEg1eTdMOW1EaEtZK05LdFRw?=
 =?utf-8?B?Mkk1UEh3b2lIOTNmejJ6UFFuSFJ3Z0tUSHAyc05RdHBTMldhODBJZGZqVWVi?=
 =?utf-8?B?T3lmR3Q3ZzVZaGhYYzV5VkZXS2ZUTnM0dGE5UTJrSEJPZEozdWtnTFVtK1RV?=
 =?utf-8?B?QlNBdjhRVStJd2pVdThIclpkNWxyeUEyQy9maHYrZ1dVT3orOWNHYXhJNTdU?=
 =?utf-8?B?YldPMWdCV0ZPRXloMmw4aU8xS05jZUVpeW41NndSaTlCdGVUQlh0RExmS0F5?=
 =?utf-8?B?TnNQaU03OW4yMVdmL3p6Q2NqbHFBbjlsS1pkSFVJZlRwYTRhRXFqWkYwZzZO?=
 =?utf-8?B?aTBmL1lKakZzMlZEMVlhdzdKekIzamtCT0FJRUJvMm9OZkhwYmVwaTBnc1ow?=
 =?utf-8?B?WWFCMWh6UE10QVJ6RytYNGVoUU9KUFNteFArQnFGclZtNTdtUlZvR21zTzVJ?=
 =?utf-8?B?S2JvN3RuTVhHRXFITzVqRDJiZWYwZFR4eWtVMTJpY3B3WVVjejRJdXdqRWpj?=
 =?utf-8?B?eldjbGhQQ0NpaFpTT3FUSGNySEE2V2VQUnhGaTloRzdZZnVHVk1OaUVDYmw5?=
 =?utf-8?B?VjJIRmp5TGZZN2lsSGVOK05LeDNQaE93WEVqeG9NWTRvcEhqVC9yZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <404EF3CDE763BF409F6D818B023A357C@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c609dd1c-3bfd-465a-499f-08d9ebd514d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2022 14:04:25.9002
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pjm1FEkPC4Xcocbma9vy+s22u7gKSW547MoxiggEINX1hOH7/2SBFtuMITp/nRoAOQ2nEiBJHFDCiEizz23lBGDSvdklfWTY35qYyUHktRdq20KdWVTUHW8HiO0Mh0ML
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR03MB4523
X-Proofpoint-GUID: 4YlQzc36hNDMwLUyrAMFUcvZwgsyFnIK
X-Proofpoint-ORIG-GUID: 4YlQzc36hNDMwLUyrAMFUcvZwgsyFnIK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-09_07,2022-02-09_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=765
 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202090080

DQoNCk9uIDA5LjAyLjIyIDE2OjAxLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDkuMDIuMjAy
MiAxNDo0NywgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBIaSwgT2xla3NpaSEN
Cj4+DQo+PiBPbiAwOC4wMi4yMiAyMDowMCwgT2xla3NpaSBNb2lzaWVpZXYgd3JvdGU6DQo+Pj4g
bGlieGVuaHlwZnMgd2lsbCByZXR1cm4gYmxvYiBwcm9wZXJ0aWVzIGFzIGlzLiBUaGlzIG91dHB1
dCBjYW4gYmUgdXNlZA0KPj4+IHRvIHJldHJpZXZlIGluZm9ybWF0aW9uIGZyb20gdGhlIGh5cGZz
LiBDYWxsZXIgaXMgcmVzcG9uc2libGUgZm9yDQo+Pj4gcGFyc2luZyBwcm9wZXJ0eSB2YWx1ZS4N
Cj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IE9sZWtzaWkgTW9pc2llaWV2IDxvbGVrc2lpX21vaXNp
ZWlldkBlcGFtLmNvbT4NCj4+PiAtLS0NCj4+PiAgICB0b29scy9saWJzL2h5cGZzL2NvcmUuYyB8
IDIgLS0NCj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkNCj4+Pg0KPj4+IGRp
ZmYgLS1naXQgYS90b29scy9saWJzL2h5cGZzL2NvcmUuYyBiL3Rvb2xzL2xpYnMvaHlwZnMvY29y
ZS5jDQo+Pj4gaW5kZXggNTJiMzBkYjhkNy4uZDA5YmJhN2Q4YyAxMDA2NDQNCj4+PiAtLS0gYS90
b29scy9saWJzL2h5cGZzL2NvcmUuYw0KPj4+ICsrKyBiL3Rvb2xzL2xpYnMvaHlwZnMvY29yZS5j
DQo+Pj4gQEAgLTMwNyw4ICszMDcsNiBAQCBjaGFyICp4ZW5oeXBmc19yZWFkKHhlbmh5cGZzX2hh
bmRsZSAqZnNoZGwsIGNvbnN0IGNoYXIgKnBhdGgpDQo+Pj4gICAgICAgICAgICBlcnJubyA9IEVJ
U0RJUjsNCj4+PiAgICAgICAgICAgIGJyZWFrOw0KPj4+ICAgICAgICBjYXNlIHhlbmh5cGZzX3R5
cGVfYmxvYjoNCj4+PiAtICAgICAgICBlcnJubyA9IEVET007DQo+Pj4gLSAgICAgICAgYnJlYWs7
DQo+PiBUaGlzIHdpbGwgbmVlZCBhIC8qIGZhbGx0aHJvdWdoICovIEkgZ3Vlc3MNCj4gV2h5PyBU
aGVyZSdzIG5vIHN0YXRlbWVudCBsZWZ0IGJlZm9yZSB0aGUgbmV4dCBjYXNlIGxhYmVsLg0KWW91
IGFyZSByaWdodCwgbm8gbmVlZA0KU29ycnkNCj4NCj4gSmFuDQo+DQo+Pj4gICAgICAgIGNhc2Ug
eGVuaHlwZnNfdHlwZV9zdHJpbmc6DQo+Pj4gICAgICAgICAgICByZXRfYnVmID0gYnVmOw0KPj4+
ICAgICAgICAgICAgYnVmID0gTlVMTDsNCj4NCg==

