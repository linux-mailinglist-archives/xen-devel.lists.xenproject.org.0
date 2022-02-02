Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 343A04A6E15
	for <lists+xen-devel@lfdr.de>; Wed,  2 Feb 2022 10:50:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263942.456833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFCGn-0007BI-Em; Wed, 02 Feb 2022 09:49:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263942.456833; Wed, 02 Feb 2022 09:49:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFCGn-00078Q-Ap; Wed, 02 Feb 2022 09:49:45 +0000
Received: by outflank-mailman (input) for mailman id 263942;
 Wed, 02 Feb 2022 09:49:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1p3Q=SR=epam.com=prvs=40324c57ab=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nFCGm-00078H-6a
 for xen-devel@lists.xenproject.org; Wed, 02 Feb 2022 09:49:44 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71b3c716-840d-11ec-8eb8-a37418f5ba1a;
 Wed, 02 Feb 2022 10:49:42 +0100 (CET)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2129gtS2031611;
 Wed, 2 Feb 2022 09:49:35 GMT
Received: from eur03-db5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2057.outbound.protection.outlook.com [104.47.10.57])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3dyqh2820s-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Feb 2022 09:49:35 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by VE1PR03MB5918.eurprd03.prod.outlook.com (2603:10a6:803:10f::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Wed, 2 Feb
 2022 09:49:31 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6%3]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 09:49:25 +0000
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
X-Inumbo-ID: 71b3c716-840d-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iMBWMVZgsjk8196TUjwqJxpMQ5NeXRAvoohqMmhqsJlcwMHV7B+q6Mt90fj/l1nCsyp7i/jzQ3ThZD3pvAn9YvpVArIFVICPhp6W/gGsfUUKPOmzbb6ryXCTSdTSEzt2K2DMlfIuf+yO8NPXZO+Kqp8CQVr/vmRMxoyUMW+vSkjYEMsvMMdO0Y0bymAKA/GtfKWTzPa/d37/Ngv6YD5CYkyW4yMr7VszBbBSy+IDO1x7PDzrS0T26Ni58C68GlViG3AU7PyQx7pLNzP51qfRNSSCOHno5+sJ/9TP4OZ6zCk7EXLDPHBbMLA2vKkySJ2covzTDtO89Kr2YI8FMq1kEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=djgND/Km+5ZIzq00YTQiIvJ4KwA3bl7qGtnEljP9KAg=;
 b=mU2U60gaS01M2iqosICdaT/mhHiNVO8YD28jzMb4gNsug8A/lTxiFiqNpzjNNEjR8e3Bjb74BY+s3DLsJJ/4M+r0c9a/71vCL7s9wGiK+Nb8rewaaUEJDCEK+VBXV99E/F9nvmlFtiu+zRux+rDOhpZtieKo6bbh5XjgPqNgCBU6CmvXVcgQm73oPuob0PjEyN7/Pc+11xmjb93yRKmTdc8sLR/Az3VrwlRtiHx/vq+C5/I1R5JrfEa1NZN1swilQFRvfFGdYJMoWAa2Xm483wdIzDhedCyx+GozWtnJT3CLo1UGn52eXFp1m/0wARlvoYSFJX04WurUDXHso01T3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=djgND/Km+5ZIzq00YTQiIvJ4KwA3bl7qGtnEljP9KAg=;
 b=KzbsaC/F2/WrwsnBWoA4C9KQn01tmS5ADFqLAd1q9uz/P94vdUTj4Urn/Hf2SiI1+XXcOoDK8PjRbetBWOfpj50t5LmFqEX1JXZZCj6Du1TjbAir/m3PyxeoToOUmVQZkH37vHddGneCPeVVZhhFb+CWXDMS02rKgbvUbj1v179grwRLcKGlSwftNspG3yG0GL6iGSQY54AL7i9j015HHymiHniUOQMEivF6fnwTIMIzVXgqaxLhbO7aCOEe00qYpOiCuX7Hjqo7wiPG1gRePcCws23blY4nwQupQ3xgO/GzckcaiXrMKLl2mvSV5Un3Cno9v1K+RrWnhjlbsdiO8w==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>,
        "paul@xen.org" <paul@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH 3/4] vpci: shrink critical section in vpci_{read/write}
Thread-Topic: [PATCH 3/4] vpci: shrink critical section in vpci_{read/write}
Thread-Index: AQHYF4hObbqxIjaQNUeSdaSEPmZTi6x/8z+AgAAF24CAAAj/gIAAAhgAgAABDwA=
Date: Wed, 2 Feb 2022 09:49:24 +0000
Message-ID: <e5d12099-99aa-f0cd-2180-68377ede510d@epam.com>
References: <20220201162508.417008-1-andr2000@gmail.com>
 <20220201162508.417008-4-andr2000@gmail.com> <YfpEiWT0NpYNSAks@Air-de-Roger>
 <5ed821ac-0a38-3c1a-a28a-c46295c2ffb4@suse.com>
 <5ec87648-2783-d21a-ca7d-dc59180543d9@epam.com>
 <a4a78b7f-126a-3c18-6f93-2d0bd768f74a@suse.com>
In-Reply-To: <a4a78b7f-126a-3c18-6f93-2d0bd768f74a@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ad6bfc5c-6cda-4b54-c42c-08d9e6314bdb
x-ms-traffictypediagnostic: VE1PR03MB5918:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VE1PR03MB5918368B9BC6817E44190D18E7279@VE1PR03MB5918.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 KV6oU9clYfHS7z7eXRaeTrp45iq2VT607ZpODwQ/dwaLbuTAQTZuS1pdbhcgSef4t+dvLa2/4q2yscL8hGcWhUJSdeL4FPNa7Az6qh3UL0efiP/4MuIMdYEMaLNagRXK8wD29Px1GsltG62g1NDFkJ2jhq8fm0tYmV10pZg1JTeMSPOAxGNX3pbXyTW1P23JSdSHoQA4AGx9MUwtFtzb6pO0LZIK4wbdXreHbHZGhF9lQ0OF2UEK1r+XOLgg42viAspRhnpgqYWWb8tB4k8NeXNnUqy4JN+j0bjSb2ASqQBDovQAu9LKcjOTnrTPM6efFumpES17Ip3UEw8hQY8YWu0iyl2X/PU2OWtj/1zMTHX8IZa/2WLUpc5Pt8EMSDzYpO/yM8+8GGiExK9t6m0nhO+ZCsONMjXkittVZC2SW6SwEWSwtgOTwD1GVPuyISE0hiCP7XPccWNCN8WLRvuWCqo0wXub/1h8K9jhO/0lNAAL7VwYTlR7cLo5ms0jpLmxNanzt0+ZNvX3aKw6Ws8d4pWP1exXcv8woTOCw4Mbh2PFJ7N4AUuXhRuGBONHEny46TPknij1liEBtq6K5P7k/8492oPW64BU28lnqUZVzMlLDaf/GkLxP8vfwc7cKdyn3A3dVcS+gBCWDt1XzXMEiIppxBQGRqMJfF3gze7eWpjmCqKZDzHrcgLYDP5WKXWHIW5qB2BBJ88EpQfx14FqAr6xPZiglmptx063GucK9+0=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(31686004)(6486002)(83380400001)(316002)(508600001)(122000001)(53546011)(54906003)(36756003)(110136005)(38100700002)(66946007)(91956017)(2616005)(2906002)(86362001)(31696002)(107886003)(8676002)(26005)(5660300002)(186003)(66446008)(8936002)(66476007)(71200400001)(4326008)(66556008)(64756008)(76116006)(38070700005)(6512007)(6506007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?aXlTQ0VpY21MNTQwcTRRMHhWUHpZVmYrbGlxS25iL1JULzNSYlVaemlMNXUr?=
 =?utf-8?B?Q2I5MEZ0UDdwMXBqWXRweW9kK0Z1cXNVOFlvd0xCa2crdzBzVWJFdlFsaU9T?=
 =?utf-8?B?TTRCNVpwVmRMdkppSks2YVVobEJTT1JLRE9TczFCODFPdlVtSTUxOVFGNGRk?=
 =?utf-8?B?NGowQjNDdTBMaVJ6bEtOYmZxS2RqaDVqZ2w1NnlRT2lHRHM0eDZ3SHRzeEhm?=
 =?utf-8?B?enE3elcvQzhwa0g0OTFObDR3Nkt2ZjFieEhPZzcyQ3ZRTEd1eFJkb0l1WDBZ?=
 =?utf-8?B?YVpPYVRCNSs2eVIzdXpFMWYvNHhlUTF3ZGNLamxaMXJHNFlydEJYNnprZ3gv?=
 =?utf-8?B?elVIbDBHYzRnRk9XZWc2Y0tHbW5UbUhuanlCUU9xMG1wUm5qL2kxd01peVpl?=
 =?utf-8?B?d1hWV2EwUit3UGo3R2VQdFBMcVNTNk53akdoUXlQYjJyZmgvQjJMeW84R3RC?=
 =?utf-8?B?SnlKZ1l6SXJ3Z3lBWm00UytORlpIMks1K2pFVXg5cmpLL1d6dTk0V2lwYzFt?=
 =?utf-8?B?Y0VzVGhyNzgwKzBhWnpDZUcvWVF4b2xjclg5M2VtRm45SVdZNWh5QmNHU2pr?=
 =?utf-8?B?engyOFRzR0hEZmFrRmlqemVtbjFwWXFUREluK2tlelVML3daWkpjQ3FYUitI?=
 =?utf-8?B?ZHlVUDZOYTBNK2RaYWpub2xYQnBEYnozTHVseDNONldJUW85bE1ObXhvOElV?=
 =?utf-8?B?Rmc2eUVCMUJrenBnd3luYjd5RThhYy95am1ad204NGRSUnpOMnhGUmluY2xE?=
 =?utf-8?B?cmtCanJ3MHhnMGVkRXRPNWovNXlVRlB2WkFDODV1UzMzbW04SVRJZmlmME9X?=
 =?utf-8?B?UW9aVjArcmFGQVk1WnNrSFI0aHgzd1M1T3BrbW1OMFpuc1FaWmdVYTkrUnJo?=
 =?utf-8?B?cER2Zm1DRy9XSTIzWUhXV1UwbHlnQnkyb29sS3M1U1RvNEJlOE0yYUFmZ2JX?=
 =?utf-8?B?TnZIaTlYT1ljNXVPL0lFdnpIRmxXTkVhYUZob0RoMHFzMVcvL1hTWlZXMFNh?=
 =?utf-8?B?czkyTERocGhFeDVaR3JHSUQ5Wm9pRWZ4bGRZQjBMc0E5VzhxRXVtbzFnM2J1?=
 =?utf-8?B?Z1hwcUg3OUc5TjB5ODVyRXpwN2VnZlVOREhlWWQ4QlF2SUYrTWpmdTMvTUIx?=
 =?utf-8?B?UmFxZk9FbEtMYjR1Y0xUaVVaYy8wZnRMQUlDRG5nVXBxSGdTVmFwemJJd1Fj?=
 =?utf-8?B?b1pKbHBWY1crdTJFbWZqc1o2UlVSL1o4Y3NLejlFTEFtUUtDeWZDRmZiak8x?=
 =?utf-8?B?b1RJSE9kQzViSXNOVjNkU0NMS1o2azQ4NTdUVVRkUFRITUw0VTQ0SUZxVkto?=
 =?utf-8?B?VjdsQXJVMGhTTVRqUHJIVTRQRHl3N1Jjcm5CTWpDZ3JUVWk5UVFtdXNpMnhy?=
 =?utf-8?B?L1F5MDFtbVdDQmFIVTNjVm1ybDJ4MCtkL3pCNmdYdXQvSzU3bHlLQmxPL0RZ?=
 =?utf-8?B?eFpkNE9pamphR0hvaHF6U2gwb2prcFFhVWFsTUkxdngyM3pvMThYZlFxOHRm?=
 =?utf-8?B?VklQbUhyY2J1SUx1R21EL1RaYVF5elpyUjljeVhYbEJGK0pibGticXpnd3pF?=
 =?utf-8?B?TzVZcDQ2bm5wbVpmSmZVSFY2ei9NTW1YYzZDU2YrVjRUbXM5NUVWWGJ1NytP?=
 =?utf-8?B?SjVKdWswd2RDck5lakJMaUl2eVhscDc4bmo3aW5NV0Z2OU9XNmlVSG9OR3FT?=
 =?utf-8?B?c3J6NnJOb0s1STdlSXlyWVhPUGlLdEUwRzVKbDJnNVBBeWJUbTNSUVZvMWNo?=
 =?utf-8?B?c2FrR1htenE4cC9uY1VQc21SdmtSeFB2YWIxUldQZ3FqK3k2SFJ1cythOGp3?=
 =?utf-8?B?ZTZqSmVTemZ6eTNOTnpUQlhwTWo1dFRLRktBSUFSMldFWmFxUy9oVVBIL2U3?=
 =?utf-8?B?cWoxek5WR2pxdHN6M1N3RENQUG40MjU3NGxQUTNxSS96ZWZmbGRMWGxEUmE0?=
 =?utf-8?B?ZnhzS2J0VUxYOTc4WE9RY09RL1FoeGMvMmJKYWVrcXJPOW9PV3BEVzN3Ui9I?=
 =?utf-8?B?eFpCT0ZNVndMYkxtLzc0OG9DRjlzSFdYVWhCVzg1NXVoYTBUYkI4Y0RsbEdR?=
 =?utf-8?B?YVdlTW9NMmNLMVoxY3FSaTc0dGpUUEFYTWkyZm4xSlJ2eUhtaGF5bHBmR3lY?=
 =?utf-8?B?RGphOVdTRXBUNWIvbVVxbXUyZXVteE1jaW1jc2FRWkIzNzlUZGwxeUZFSGd6?=
 =?utf-8?B?a0ljOEFwTkpjdTZzWTYzYVlzQ2JBenhxT1RvWDlEVlk2eXB2R3FSVlRySHY4?=
 =?utf-8?B?THZTZUdOSU5PaHJEVjYyRlIrQUJVYjRNanRUc1Vqc0tsbmVxS2dhYWttQ0Za?=
 =?utf-8?B?aVBaSWo5UXRmTW9oVmh2WTVxdWM2ZldlL3h6ZUw3bWxnNmlYODJSUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B733A1E93C9CA44997DD163E1A02C09B@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad6bfc5c-6cda-4b54-c42c-08d9e6314bdb
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2022 09:49:24.9334
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kpZfBs2lxqbuWmlMo1KDjR1hn3hVnDK/15J9FSTQzMajutyuwW01ZmJo4uxSviwQ6GewahqIFYPfHHJ94wmqbNfVNj2B1F6HOdNP/ttahF1vkA9ERrAK6SqtDUlCQCAx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR03MB5918
X-Proofpoint-GUID: 8mod4xD1jH-wihTMjsw5DiUuFNyqdRHg
X-Proofpoint-ORIG-GUID: 8mod4xD1jH-wihTMjsw5DiUuFNyqdRHg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-02_03,2022-02-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 mlxscore=0 adultscore=0
 spamscore=0 clxscore=1015 mlxlogscore=999 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202020051

DQoNCk9uIDAyLjAyLjIyIDExOjQ1LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDIuMDIuMjAy
MiAxMDozOCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBPbiAwMi4wMi4yMiAx
MTowNSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMDIuMDIuMjAyMiAwOTo0NCwgUm9nZXIg
UGF1IE1vbm7DqSB3cm90ZToNCj4+Pj4gT24gVHVlLCBGZWIgMDEsIDIwMjIgYXQgMDY6MjU6MDdQ
TSArMDIwMCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+PiBGcm9tOiBPbGVr
c2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+
Pj4gT2xla3NhbmRyLCBjYW4geW91IHBsZWFzZSBjbGFyaWZ5IGF1dGhvcnNoaXAgaGVyZT8gVGhl
IHJ1bGUgb2YgdGh1bWIgaXMNCj4+PiB0aGF0IEZyb206IG1hdGNoZXMgLi4uDQo+Pj4NCj4+Pj4+
IFNocmluayBjcml0aWNhbCBzZWN0aW9uIGluIHZwY2lfe3JlYWQvd3JpdGV9IGFzIHJhY2luZyBj
YWxscyB0bw0KPj4+Pj4gdnBjaV97cmVhZCx3cml0ZX1faHcoKSBzaG91bGRuJ3QgYmUgYSBwcm9i
bGVtLiBUaG9zZSBhcmUganVzdCB3cmFwcGVycw0KPj4+Pj4gYXJvdW5kIHBjaV9jb25mX3tyZWFk
LHdyaXRlfSBmdW5jdGlvbnMsIGFuZCB0aGUgcmVxdWlyZWQgbG9ja2luZyAoaW4NCj4+Pj4+IGNh
c2Ugb2YgdXNpbmcgdGhlIElPIHBvcnRzKSBpcyBhbHJlYWR5IHRha2VuIGNhcmUgaW4gcGNpX2Nv
bmZfe3JlYWQsd3JpdGV9Lg0KPj4+Pj4NCj4+Pj4+IFBsZWFzZSBub3RlLCB0aGF0IHdlIGFueXdh
eXMgc3BsaXQgNjRiaXQgd3JpdGVzIGludG8gdHdvIDMyYml0IG9uZXMNCj4+Pj4+IHdpdGhvdXQg
dGFraW5nIHRoZSBsb2NrIGZvciB0aGUgd2hvbGUgZHVyYXRpb24gb2YgdGhlIGFjY2Vzcywgc28g
aXQgaXMNCj4+Pj4+IHBvc3NpYmxlIHRvIHNlZSBhIHBhcnRpYWxseSB1cGRhdGVkIHN0YXRlIGFz
IGEgcmVzdWx0IG9mIGEgNjRiaXQgd3JpdGU6DQo+Pj4+PiB0aGUgUENJKGUpIHNwZWNpZmljYXRp
b24gZG9uJ3Qgc2VlbSB0byBzcGVjaWZ5IHdoZXRoZXIgdGhlIEVDQU0gaXMgYWxsb3dlZA0KPj4+
Pj4gdG8gc3BsaXQgbWVtb3J5IHRyYW5zYWN0aW9ucyBpbnRvIG11bHRpcGxlIENvbmZpZ3VyYXRp
b24gUmVxdWVzdHMgYW5kDQo+Pj4+PiB3aGV0aGVyIHRob3NlIGNvdWxkIHRoZW4gaW50ZXJsZWF2
ZSB3aXRoIHJlcXVlc3RzIGZyb20gYSBkaWZmZXJlbnQgQ1BVLg0KPj4+Pj4NCj4+Pj4+IFNpZ25l
ZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPj4+Pj4g
U2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNo
Y2hlbmtvQGVwYW0uY29tPg0KPj4+IC4uLiB0aGUgZmlyc3QgUy1vLWIsIGFzIHRoZXNlIGFyZSBl
eHBlY3RlZCB0byBiZSBpbiBjaHJvbm9sb2dpY2FsDQo+Pj4gb3JkZXIuDQo+PiBXZWxsLCBJIHdh
cyBub3Qgc3VyZSBoZXJlOiB0aGUgaWRlYSBhbmQgdGhlIG9yaWdpbmFsIGNvZGUgYmVsb25ncw0K
Pj4gdG8gUm9nZXIgYW5kIGl0IHdhcyBhIHBhcnQgb2YgYSBkZWRpY2F0ZWQgb3RoZXIgcGF0Y2gu
IFNvLCB0ZWNobmljYWxseSwNCj4+IHRoaXMgcGF0Y2ggZGlkbid0IGV4aXN0IGJlZm9yZSBhbmQg
Um9nZXIgaGFzbid0IGNyZWF0ZWQgaXQgKHRoZSBwYXRjaCkuDQo+PiBTbywgdGhpcyBpcyB3aHkg
SSdtIGluIGRvdWJ0IGhlcmU6IHNob3VsZCBJIGNoYW5nZSB0aGUgYXV0aG9yc2hpcA0KPj4gdG8g
Um9nZXIncz8gSSBoYWQgbm8gbWVhbnMgdG8gb2ZmZW5kIGFueW9uZSBoZXJlIG5vciBJIHByZXRl
bmQNCj4+IGZvciB0aGUgYXV0aG9yc2hpcCBpbiBhbnkgZm9ybS4NCj4gTXkgcGVyc29uYWwgdmll
dyBvbiBpdCBpcyB0aGF0IGlmIHlvdSd2ZSBicm9rZW4gdGhpcyBvdXQgb2YgYSBsYXJnZXINCj4g
cGF0Y2ggY29taW5nIGZyb20gUm9nZXIsIHRoZW4gaGUgc2hvdWxkIGJlIG5hbWVkIGFzIHRoZSBh
dXRob3IuDQpBZ3JlZSwgd2lsbCBjaGFuZ2UuDQpSb2dlciwgSSBhbSBzb3JyeSBJIGRpZG4ndCBk
byBpdCBmcm9tIHRoZSBzdGFydA0KPiBKYW4NCj4NClRoYW5rIHlvdSwNCk9sZWtzYW5kcg==

