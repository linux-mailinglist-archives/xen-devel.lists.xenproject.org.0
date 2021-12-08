Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DCF46DBB2
	for <lists+xen-devel@lfdr.de>; Wed,  8 Dec 2021 19:59:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242588.419550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mv29b-00038A-8J; Wed, 08 Dec 2021 18:58:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242588.419550; Wed, 08 Dec 2021 18:58:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mv29b-00035U-4j; Wed, 08 Dec 2021 18:58:59 +0000
Received: by outflank-mailman (input) for mailman id 242588;
 Wed, 08 Dec 2021 18:58:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v8t+=QZ=epam.com=prvs=2976427baf=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mv29Z-0002V9-J0
 for xen-devel@lists.xenproject.org; Wed, 08 Dec 2021 18:58:57 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e481e91f-5858-11ec-9d12-4777fae47e2b;
 Wed, 08 Dec 2021 19:58:56 +0100 (CET)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1B8Id37A015671;
 Wed, 8 Dec 2021 18:58:52 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2169.outbound.protection.outlook.com [104.47.17.169])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3cu25v81br-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Dec 2021 18:58:52 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB4305.eurprd03.prod.outlook.com (2603:10a6:208:c0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Wed, 8 Dec
 2021 18:58:48 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::7593:b5e4:6534:5e55]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::7593:b5e4:6534:5e55%5]) with mapi id 15.20.4778.012; Wed, 8 Dec 2021
 18:58:48 +0000
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
X-Inumbo-ID: e481e91f-5858-11ec-9d12-4777fae47e2b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XpK7QYVtz3nUuw1rsHrkHAM/vqNSUQOegP4MEL3PcDzirl6czke93w9JcCIC6gt7oO8kEY42LkyXnHBL2E//Js++FjftJU5HRRb14v4hvgwbPnxY3unZL+TU959K69GVBywg4xj7yXKLBilu32dj7pKg7sWNCS6qUlnmnDNPPtwDYsJKAZmMqx9k6GCk2VrB4X3+UkgLLRFtUxYDDBFHs9wJFH1ChQPLA87VVBp1CJMBOEcpuD9EwgTiOm2hJlBVvZhGeSUx1AoJtrLOfkSxE8S9L6QdG/MOahNfEDrzfTymSdOC+O0yPk+f3o/biVF2nZJfbvQNYfOQqx5T58jqKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OGBO0HXPhnvsCxbxCRm847xG3xpA1974HHfgcE+axLM=;
 b=JJKpNn7JYa5nFDTsaIg/y3v/mJsEuQMyRjhUxJKSoKDbtwmDOrm0JtFOnqGBx1jiM3f80XNofr0wWqqwVJiL8GrVwXBD9rEjECIIjb5FIwH7wOoz02CNtr2WT2cGzbjIt4D5hwwTwfldyWxJDa5/+JtwSbpain3uYMvTirJHfsKGFS/GztqeYTADHjg9kWHK7KdIemZ3utTXsb4xbrunLXuBiyX82uq+qFLgRbsmJl7/iqV8ONQHcl7r6uuVTiU/qlgXz5C+Lmkoly8+w95VD7IlbSXF4uw0fJvRjwiJ/lO7J428L3Gr3DZQvKaBk7lR15UNYcEqNw00l1lr2m6kjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OGBO0HXPhnvsCxbxCRm847xG3xpA1974HHfgcE+axLM=;
 b=NONV7fgwINkSjk5FghGuKDUOWSiq5/DJusm+8ZoMUm7myY21Ze3ULZoiXZsUPsJA7db/BcFce3INnFlJ9pUiKFm8Ip6gJJ0I7kWIQ3jSKsdkNgXwgTmMxvyE65D+DoTKK8GWE3B97JHhDbG1QXAZMAQ4vbLY1gKF5DllRNC8fMiuTfmjIXMiFgP1arUfh6rrgr0mxV2c1GnpO/JgfCRlfBIqvmMTrK44odXiipyC3PAwF0HPL0t8ZY//smvhaXNBc6evhSLvvselMTcyz+ZQA0sVScamgrFDtAifFOqbPjGhFDEh/qStk/cdqwLLz1bEpLXgYqW/lwuX27bVM0xQlQ==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Julien Grall <julien@xen.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "sstabellini@kernel.org" <sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        "jbeulich@suse.com"
	<jbeulich@suse.com>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
        "paul@xen.org"
	<paul@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v7 5/7] xen/arm: do not map PCI ECAM and MMIO space to
 Domain-0's p2m
Thread-Topic: [PATCH v7 5/7] xen/arm: do not map PCI ECAM and MMIO space to
 Domain-0's p2m
Thread-Index: AQHX4QlG/0qanoOdY0qH6GEAgA+cfqwo7b2AgAAbcwA=
Date: Wed, 8 Dec 2021 18:58:48 +0000
Message-ID: <db0106db-f951-048a-20df-7e2fb51e1be2@epam.com>
References: <20211124075942.2645445-1-andr2000@gmail.com>
 <20211124075942.2645445-6-andr2000@gmail.com>
 <dc367640-b445-9c47-6d66-9c6a8cdbc85f@xen.org>
In-Reply-To: <dc367640-b445-9c47-6d66-9c6a8cdbc85f@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bcc3d372-8b74-4621-6d8b-08d9ba7cc4c1
x-ms-traffictypediagnostic: AM0PR03MB4305:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB43051E11EA455A14CA72A6CDE76F9@AM0PR03MB4305.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 XMzM+HOmz2ghfoFVIKAwlPDaj3Jr4hIhnXiD4lA9x6cUNTB2/CXpMU1x4YEybIHnKWQtgeO2OPk71nyyO7LjEHjBJZa5O1S3uZtDTU+G0RkqGkPiPCrmKaBLe1mI/2++BOpU0BBjM8vlWjQhTnPjNtKfYXefC9cCoK48nvkmf3UxS+NuRrvNahRgh+3uuXicifyFffB6QU6HJE5yebeDe6aWIBc3uRnbt/mCaHEz5BJmGMvMSMVgA/E6MmvcDyf1qGmorzApqqcyekBTeqG4rE7GUZhC6+pReUHGCLHMMrtxXyFhjP4jyr4yfIHwnP4IfJDOs1FC8z++cN412ZGf6fpvGcJMby7vyMnsoIt+n0Fy5HLOp8t3lC74fhORWsxh6+H1su4TBRnad9WZ/TD3l0OB+PwgLtvqQY0yFXFiwoo+7Mn2u6dlLIDrCL705+UIzldZhI2Gkl5wDOjOuDYgkhNdKmgz8Emhxbx4oDpjq9k5yTajQTB0JVxbrAvcVE5vCyY1sAMndNKXg/LHmvRL9S1EPIORbyKk5Z4AuiZWGPuR4FvOhGC7MRZakb2/yZ/aalqSjgaYtc4TMuFfQLeZNx5dIJCNDytBK2eFzTpZ0tPlh3xY7AsQLm348m6FUel1myaXU1Mi6c8heGKwviwRnJHejDbre5Sh1nXPTNRvC2jgZ2N7hcl1fLFcTLQqG4DPyIfQxRL2F+UYqGI2GytvP9qAiFVSC8unALo+q9CrxARfYenHZJ0mKE5yoq5azw1M7oiMyQEMYP6434i3znBfKayoWYMtTum3+IsMeIchn2d2ukJiEkPixGbw6i/FeyitCGeolO5CeHRMr785CoSGRg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(966005)(8936002)(66446008)(38070700005)(110136005)(76116006)(2906002)(91956017)(66476007)(66556008)(64756008)(54906003)(186003)(316002)(122000001)(86362001)(38100700002)(6512007)(5660300002)(6486002)(31686004)(83380400001)(107886003)(31696002)(36756003)(4326008)(26005)(53546011)(71200400001)(7416002)(6506007)(2616005)(55236004)(8676002)(508600001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MC9xcEhqbE1mYThBU1g2a1dyYjRwT0JnM3kvOGpBWXdwNFEzcjZuWmhvVUpx?=
 =?utf-8?B?ZU9lRkpaa2VRNDJwYTcrRmR0c2JLem96WnFxclRwZ1FDNmVONHUyeDRzdE1v?=
 =?utf-8?B?ait5RkxEYkVpZjFXaEh0MFRpNTZzTHZFbmNMWVM0eU5FM2phSlJvNW85MCsv?=
 =?utf-8?B?UGxsUVZNY0o3YzAvTSs0VVduVFBxcUxzdG1JQ0xQcldkQ3dSeDlOc2Y3a0Fz?=
 =?utf-8?B?OEJFVmdodW0raFpSTXJTSUlLQXA2Ky9WZFBpRXQxMFBXc1VOQzhNZTNFVVR5?=
 =?utf-8?B?RkUwTTFKN3hKUVFLN0dFTmdGWFBadTBlQzFhdHN5dzVXWTNmL1lVZjRhQVVv?=
 =?utf-8?B?YlYrT0p0dDc4U1NWY2Q2N2ExSzZBaHY5YVZGWVN4dW9YbmpPaVFzNnZoaTls?=
 =?utf-8?B?N3BESFRrNy82MnpIQ0FMcmg5anVWdVdJTHV3QlhkRTVhUVk4TUtJUzFOSVFM?=
 =?utf-8?B?cWE1d05KZWRETkEzakhqVXVhQVRZWENRdHRoMHZiSXFETjBkWE5SZFRsR0pJ?=
 =?utf-8?B?UnJrL3pGdE83WnVhVGNVVmRJS3czT3AySnNHT21obGEwM3A2L0FDSk9rUWsx?=
 =?utf-8?B?ZmVrYVFtM2RZSGpUeXUwR2hkQWJhVmFDekpveUl4eGhocXlOaXBhMHM1ZmxU?=
 =?utf-8?B?MEtybERnT0daaTBobHFKVnpUMitGR1YwZ0c2UW51U1NyY3VGM3hMdFQrWS80?=
 =?utf-8?B?aUFuS0hheFBuQitxaW9wcGtlbWZmdTcveGNhSzVHeXlGNnFjM1dmQ0RiMnRC?=
 =?utf-8?B?QUhlSVJuS0VHQndYUUlINCtIQUFOYkNTRTRnRGE0bFNuYkU2MmlpNmpuWm5p?=
 =?utf-8?B?Nk8xZkYyRFVjK202UU1xeTBSYi9pSEwybWNidnk3UnJPNElGektmUVBoS2Jv?=
 =?utf-8?B?blRJZ2V5NXd3ck02ZnZQbGdOVFViamo2R1NidnZhYjd1UWVsK1UvK2NqVDl3?=
 =?utf-8?B?bG9BeUszRW4xenZSTjdJUk9FdnVjMCtzMlpGS0tIWHFvejNhd2JoS0NubVZk?=
 =?utf-8?B?N0ZnelZ6RmtXVDRZODdqT3F5eVFEc2lBdlNlRldicDFSV1lGQ1FYNThIb3Jv?=
 =?utf-8?B?K2tIUzE2UmNaRzA5R0pVT09UWlFTQ2dmRnlIUFZzbTU2VWlhd1pkZG9vckZQ?=
 =?utf-8?B?a05yckw1QWQ0RlpzTTRCRDlWVW9BNi9LeXZOeDdPbFUxSWlvMWR5RHhHLzQw?=
 =?utf-8?B?OG8wUVhxNUNYRG9CQWNxN0p0VVdUYkJjQmdOdlhsTWFOVnFtUVV3YnJmdith?=
 =?utf-8?B?ejA2Tk5KMjNpQkVhUmdiTTJhREp3L3l0a1JvWThrMjF5cmtpQUhsMnBvMm1J?=
 =?utf-8?B?dWU3MFhITzVJUVZaVU1CNzVYSFNCVU5wZjd4VFNWNCtSTnFNdi9XNng1UFNz?=
 =?utf-8?B?VmNiQVNDV3BRdUxRdm1Ic0tMd0hqYVZzcktPbWlzOURta0FZbFY3MjZJN0RU?=
 =?utf-8?B?ZEIzbmVVSUFMNkZ3cTZQTXRDU1MyTFNWVWxFNUorZVZpdE5aR3BBR0dyM29M?=
 =?utf-8?B?cjVhd29YeTdYb3dZMlozWjlxUkxpWXp0ckx5bk5tUjVyZUZZbDBIaHNRdzJw?=
 =?utf-8?B?d1lORTRIZHhWeEY5ODgxTzVmSVBsNGhIS29rRHZQNHd4eGJOZ3AyRndWQ1pN?=
 =?utf-8?B?OGpseHJ1d2pLMzFMQmN1Njg2ZnJ0cWhXNCtNa2hKN1FFczNWU1d6dGxQUlE1?=
 =?utf-8?B?Vm1vdThyV2Z6K2tsMUlkL0dycExOY2piSG1wV3dUMGZyK1hJYmdQMjk3SzVV?=
 =?utf-8?B?WHpTb2lwMzF5TFIrNlErTGEvM2kzSEg4dTFrcjZJeG5iaXBXOHd3UGpld28r?=
 =?utf-8?B?WDRkMEpFdmwyaW9Ca3d2b3QzaE05RkR0YmJYUGFVeUx6aktHWUtWcnpnVEMy?=
 =?utf-8?B?M0t0S1A5SUdnL3Mwb09yeWh1dWxjYWdxZVpXOTVDdUEyMUNwa1FRY2doVzR6?=
 =?utf-8?B?WUZudUtnWWd4Y2dKaEE0VFNZV3hLZkI5ZjhJZlN5bVBVREU3QVJaVFRObk1V?=
 =?utf-8?B?TVdua0FBRWk1ZmVpdml0Z1JRTE9yL3lLUlZ5WGNrQ054ZmQ5OXNnSHAvcjJr?=
 =?utf-8?B?bjc2THFCYUJSVGY3cFFWK2RvNjNQbW9oWmFTNlU3eEVKSk80MU9DYjNlNW9p?=
 =?utf-8?B?TTdqWVlDQ1lvV2NVUXhkcUVFNmJBb0hieEJIeXpHR3ZqeGFIS1k4M1JRSzBq?=
 =?utf-8?B?WFJ5N0M0aURhcWpGSUN6NWx2azl0ekQ0NjRIZHgreTQ1cUI1TkdrMHJNVFJY?=
 =?utf-8?B?RXNEczNMODIvNWYwK0dYeFAwcnRWQUlKSVh4cm0zNWljRXVqRXRLTlV1TXpM?=
 =?utf-8?B?dC9vOTN6QXZWVFdiMGp1bDJFWmplQVIzRDdFS0NtRnh5SXk5Q1Zwdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4C38AA772CD3AA449C2F0BD8F1A07961@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcc3d372-8b74-4621-6d8b-08d9ba7cc4c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2021 18:58:48.8732
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v2rrfzl1RLgC63XrEDhC2EX6hi6dPWy/l5flu7SQ9ljdR6fy+xeSpbu8JDs0dtkZugQ1/yf/kBnvwJwj/7ART7YytDUOLJ7t333r8HLwCzXe1FKvJhm66zud70stW18O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4305
X-Proofpoint-GUID: jEvbaLuU4UwViXQq_utJP0L8xVk1u95r
X-Proofpoint-ORIG-GUID: jEvbaLuU4UwViXQq_utJP0L8xVk1u95r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-08_07,2021-12-08_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 mlxlogscore=999 adultscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2112080107

SGksIEp1bGllbiENCg0KT24gMDguMTIuMjEgMTk6MjAsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4g
SGkgT2xla3NhbmRyLA0KPg0KPiBPbiAyNC8xMS8yMDIxIDA3OjU5LCBPbGVrc2FuZHIgQW5kcnVz
aGNoZW5rbyB3cm90ZToNCj4+IEZyb206IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2Fu
ZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4+DQo+PiBQQ0kgaG9zdCBicmlkZ2VzIGFyZSBz
cGVjaWFsIGRldmljZXMgaW4gdGVybXMgb2YgaW1wbGVtZW50aW5nIFBDSQ0KPj4gcGFzc3Rocm91
Z2guIEFjY29yZGluZyB0byBbMV0gdGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gZGVwZW5kcyBv
bg0KPj4gRG9tYWluLTAgdG8gcGVyZm9ybSB0aGUgaW5pdGlhbGl6YXRpb24gb2YgdGhlIHJlbGV2
YW50IFBDSSBob3N0DQo+PiBicmlkZ2UgaGFyZHdhcmUgYW5kIHBlcmZvcm0gUENJIGRldmljZSBl
bnVtZXJhdGlvbi4gSW4gb3JkZXIgdG8NCj4+IGFjaGlldmUgdGhhdCBvbmUgb2YgdGhlIHJlcXVp
cmVkIGNoYW5nZXMgaXMgdG8gbm90IG1hcCBhbGwgdGhlIG1lbW9yeQ0KPj4gcmFuZ2VzIGluIG1h
cF9yYW5nZV90b19kb21haW4gYXMgd2UgdHJhdmVyc2UgdGhlIGRldmljZSB0cmVlIG9uIHN0YXJ0
dXANCj4+IGFuZCBwZXJmb3JtIHNvbWUgYWRkaXRpb25hbCBjaGVja3MgaWYgdGhlIHJhbmdlIG5l
ZWRzIHRvIGJlIG1hcHBlZCB0bw0KPj4gRG9tYWluLTAuDQo+Pg0KPj4gVGhlIGdlbmVyaWMgUENJ
IGhvc3QgY29udHJvbGxlciBkZXZpY2UgdHJlZSBiaW5kaW5nIHNheXMgWzJdOg0KPj4gLSByYW5n
ZXM6IEFzIGRlc2NyaWJlZCBpbiBJRUVFIFN0ZCAxMjc1LTE5OTQsIGJ1dCBtdXN0IHByb3ZpZGUN
Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIGF0IGxlYXN0IGEgZGVmaW5pdGlvbiBvZiBub24tcHJl
ZmV0Y2hhYmxlIG1lbW9yeS4gT25lDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCBvciBib3RoIG9m
IHByZWZldGNoYWJsZSBNZW1vcnkgYW5kIElPIFNwYWNlIG1heSBhbHNvDQo+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBiZSBwcm92aWRlZC4NCj4+DQo+PiAtIHJlZ8KgwqAgOiBUaGUgQ29uZmlndXJh
dGlvbiBTcGFjZSBiYXNlIGFkZHJlc3MgYW5kIHNpemUsIGFzIGFjY2Vzc2VkDQo+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBmcm9tIHRoZSBwYXJlbnQgYnVzLsKgIFRoZSBiYXNlIGFkZHJlc3MgY29y
cmVzcG9uZHMgdG8NCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRoZSBmaXJzdCBidXMgaW4gdGhl
ICJidXMtcmFuZ2UiIHByb3BlcnR5LsKgIElmIG5vDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCAi
YnVzLXJhbmdlIiBpcyBzcGVjaWZpZWQsIHRoaXMgd2lsbCBiZSBidXMgMCAodGhlIGRlZmF1bHQp
Lg0KPj4NCj4+IMKgRnJvbSB0aGUgYWJvdmUgbm9uZSBvZiB0aGUgbWVtb3J5IHJhbmdlcyBmcm9t
IHRoZSAicmFuZ2VzIiBwcm9wZXJ0eQ0KPj4gbmVlZHMgdG8gYmUgbWFwcGVkIHRvIERvbWFpbi0w
IGF0IHN0YXJ0dXAgYXMgTU1JTyBtYXBwaW5nIGlzIGdvaW5nIHRvDQo+PiBiZSBoYW5kbGVkIGR5
bmFtaWNhbGx5IGJ5IHZQQ0kgYXMgd2UgYXNzaWduIFBDSSBkZXZpY2VzLCBlLmcuIGVhY2gNCj4+
IGRldmljZSBhc3NpZ25lZCB0byBEb21haW4tMC9ndWVzdCB3aWxsIGhhdmUgaXRzIE1NSU9zIG1h
cHBlZC91bm1hcHBlZA0KPj4gYXMgbmVlZGVkIGJ5IFhlbi4NCj4+DQo+PiBUaGUgInJlZyIgcHJv
cGVydHkgY292ZXJzIG5vdCBvbmx5IEVDQU0gc3BhY2UsIGJ1dCBtYXkgYWxzbyBoYXZlIG90aGVy
DQo+PiB0aGVuIHRoZSBjb25maWd1cmF0aW9uIG1lbW9yeSByYW5nZXMgZGVzY3JpYmVkLCBmb3Ig
ZXhhbXBsZSBbM106DQo+PiAtIHJlZzogU2hvdWxkIGNvbnRhaW4gcmNfZGJpLCBjb25maWcgcmVn
aXN0ZXJzIGxvY2F0aW9uIGFuZCBsZW5ndGguDQo+PiAtIHJlZy1uYW1lczogTXVzdCBpbmNsdWRl
IHRoZSBmb2xsb3dpbmcgZW50cmllczoNCj4+IMKgwqDCoCAicmNfZGJpIjogY29udHJvbGxlciBj
b25maWd1cmF0aW9uIHJlZ2lzdGVyczsNCj4+IMKgwqDCoCAiY29uZmlnIjogUENJZSBjb25maWd1
cmF0aW9uIHNwYWNlIHJlZ2lzdGVycy4NCj4+DQo+PiBUaGlzIHBhdGNoIG1ha2VzIGl0IHBvc3Np
YmxlIHRvIG5vdCBtYXAgYWxsIHRoZSByYW5nZXMgZnJvbSB0aGUNCj4+ICJyYW5nZXMiIHByb3Bl
cnR5IGFuZCBhbHNvIEVDQU0gZnJvbSB0aGUgInJlZyIuIEFsbCB0aGUgcmVzdCBmcm9tIHRoZQ0K
Pj4gInJlZyIgcHJvcGVydHkgc3RpbGwgbmVlZHMgdG8gYmUgbWFwcGVkIHRvIERvbWFpbi0wLCBz
byB0aGUgUENJDQo+PiBob3N0IGJyaWRnZSByZW1haW5zIGZ1bmN0aW9uYWwgaW4gRG9tYWluLTAu
IFRoaXMgaXMgZG9uZSBieSBmaXJzdA0KPj4gc2tpcHBpbmcgdGhlIG1hcHBpbmdzIHdoaWxlIHRy
YXZlcnNpbmcgdGhlIGRldmljZSB0cmVlIGFzIGl0IGlzIGRvbmUgZm9yDQo+PiB1c3VhbCBkZXZp
Y2VzIGFuZCB0aGVuIGJ5IGNhbGxpbmcgYSBkZWRpY2F0ZWQgcGNpX2hvc3RfYnJpZGdlX21hcHBp
bmdzDQo+PiBmdW5jdGlvbiB3aGljaCBvbmx5IG1hcHMgTU1JT3MgcmVxdWlyZWQgYnkgdGhlIGhv
c3QgYnJpZGdlcyBsZWF2aW5nIHRoZQ0KPj4gcmVnaW9ucywgbmVlZGVkIGZvciB2UENJIHRyYXBz
LCB1bm1hcHBlZC4NCj4+DQo+PiBbMV0gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNo
aXZlcy9odG1sL3hlbi1kZXZlbC8yMDIwLTA3L21zZzAwNzc3Lmh0bWwNCj4+IFsyXSBodHRwczov
L3d3dy5rZXJuZWwub3JnL2RvYy9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGNp
L2hvc3QtZ2VuZXJpYy1wY2kudHh0DQo+PiBbM10gaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2Mv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BjaS9oaXNpbGljb24tcGNpZS50eHQN
Cj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRy
X2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+DQo+IFJldmlld2VkLWJ5OiBKdWxpZW4gR3JhbGwg
PGpncmFsbEBhbWF6b24uY29tPg0KPg0KPiBJIGhhdmVuJ3QgY29tbWl0dGVkIGJlY2F1c2UgaXQg
aXMgbm90IGNsZWFyIHdoZXRoZXIgdGhpcyBwYXRjaCBkZXBlbmRzIG9uIGVhcmxpZXIgcGF0Y2hl
cyB0aGF0IGFyZSBzdGlsbCB1bmRlciByZXZpZXcuIENhbiB5b3UgYWR2aXNlPw0KSSB3aWxsIHJl
c2VuZCB0aGUgd2hvbGUgc2VyaWVzIChsZWZ0b3ZlcnMpLCBzbyBubyBuZWVkIHRvIGNvbW1pdCBu
b3cNCg0KVGhhbmsgeW91LA0KT2xla3NhbmRyDQo+DQo+IENoZWVycywNCj4NCg==

