Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6024B6A6F
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 12:13:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273037.468082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJvl7-0000PR-PQ; Tue, 15 Feb 2022 11:12:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273037.468082; Tue, 15 Feb 2022 11:12:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJvl7-0000Mf-Ki; Tue, 15 Feb 2022 11:12:37 +0000
Received: by outflank-mailman (input) for mailman id 273037;
 Tue, 15 Feb 2022 11:12:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xOiq=S6=epam.com=prvs=4045782cdb=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nJvl5-0000M4-L6
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 11:12:35 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c4550cd-8e50-11ec-8eb8-a37418f5ba1a;
 Tue, 15 Feb 2022 12:12:34 +0100 (CET)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21FBCNsr021300;
 Tue, 15 Feb 2022 11:12:29 GMT
Received: from eur02-am5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2050.outbound.protection.outlook.com [104.47.4.50])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3e89uc08fm-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 11:12:29 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM6PR03MB3861.eurprd03.prod.outlook.com (2603:10a6:20b:22::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Tue, 15 Feb
 2022 11:12:24 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::fc4d:4749:5d1:eb73]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::fc4d:4749:5d1:eb73%4]) with mapi id 15.20.4975.019; Tue, 15 Feb 2022
 11:12:23 +0000
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
X-Inumbo-ID: 2c4550cd-8e50-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gIW29/VRX27Xk2HT6xmg6/DxQrdxKZI4TMX3z2YxmN3NTJRsrCi1+BRw7WfTvlc11oOUIMxBh0KxbrfHAy2q7PZ1zmbvS4zAu6kLJA29Cvk7NzWRSQulnFyfqjwxoEDDRkd0miHdOQwlBsRastRnjj+tcmornH/vBhAr4P2x0pFxp5DlVltFdFNsCgBbzBggpa12P6xk4satgPsdWdqN3De36/jagDzd3H+oo6ULGEPaC1m2E2dR90qhe66e/VMoDVHfUTugM69HhGNbtgurOM1d+BhL7n6zAyw0icIX+z1f3HCXWgYYMQfT2sSEh4xx8Rci0W5ZZnpcXzXi6r5MQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=71C3rfhDqF1ZAbUsu6sLgnzo8FjBJBXJh2rFodq2QT8=;
 b=cSjU3mdMxAjRdGgAyQKcxjCWda0xnAKrZ8x+AT8MDKGs+4vgyJLCgnlqwmhkAiM9WKXMHe0XTUxM5EcIX8wAswHccnfToC2Dm3wFKoKBSHUPHuLT1EdClJMjerkJkdbA5kkPqBGVZ4GZh06ve+2m6/G8bOgqG2+QrNaYq//2IMAh0eGgi35IeuK7tgU7wzLEo7DizZsmQhi9zODuJnMDZM/8JXW0SrBKsIYTST752RCwlsoxPtlPIzuNaR3x1adzuUnWSOvzk6OGu6xh6gfa8fqfPwuuemaw4gbEJt+6LAUycrqMO1LZhSVmREFCw4NeFOlRvpjPhHkIPNYKwiPgsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=71C3rfhDqF1ZAbUsu6sLgnzo8FjBJBXJh2rFodq2QT8=;
 b=DsA2AlruqSVWKNQ8CPTsIwBPwiEm93dSPNJS0zNjqypD/xpX173+3NWYQyT+yy7sCIAEnfvlm2s2C/HMF1KknDR1eP54y1Wdm2O5NNdTR4u5/EFJJ3oyJo5RIj5NxlL3rUgpAtmqjG8RCS5LOM2zpZozHn3K2mO+B3IcSPPmKLPLrIO4yP7HrR21RonJTW+4Ri7ApeqjFIXu95UL70pUwGFs9k5pFNoRi9U2ESBVekA17IOBcZfasRNgsLkz2KiHUXXDw0Lg6vrlgWGiADcAAB4EuxLCA0LCF+ZP1S4iFkDUgjjws7sWflfHpNcfHFfkgMNZzlOm64/0T+5OOmnv4g==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "jbeulich@suse.com" <jbeulich@suse.com>,
        "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org" <sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v2] vpci: introduce per-domain lock to protect vpci
 structure
Thread-Topic: [PATCH v2] vpci: introduce per-domain lock to protect vpci
 structure
Thread-Index: AQHYIkOs9pmsZb0l5kefj1m3qdTVCayUboeAgAAGwYA=
Date: Tue, 15 Feb 2022 11:12:23 +0000
Message-ID: <c5b9b02c-93f8-d018-6048-9abf2e7de4dc@epam.com>
References: <20220215081135.1497470-1-andr2000@gmail.com>
 <YguE7RWOteSnvVNY@Air-de-Roger>
In-Reply-To: <YguE7RWOteSnvVNY@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3a4744e6-1d72-4fb0-0bfd-08d9f0740ae0
x-ms-traffictypediagnostic: AM6PR03MB3861:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM6PR03MB3861F82097A171E1909EB458E7349@AM6PR03MB3861.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ok6hWzkF3cpD69NETX06XIaT6P1YkpwxH/++WMH8HNJHfBGtuY5ClNKPT6OwUo4Lbqw276tPk2+UsxbC9RpHXlXroacAapInepyOsC2EHQiML54XA9jmsYMJrg189XkDaTmDTgmFm3Apl1XPVECDUIydQhEa7QXUQHtCeVfM6GwDT5s4vauH76NoJZclwuXtx+PHvPlEKwiRFjngaVxvJu1IostosLiZQAI69fJgL1wBwCisMkMfnmGodb73UXN4jsJN8NuhSI8zuc5BhRGW0StLNa7EXaiIsEDDIkM9i5KqmypWirQLlpCoP4N1Ikj9qeAJOnr0KY42GIPEI50jSpHpQ7y/zSWbRh+FQZIjsOeliG/IlkunhL5TXAKovv8SUNDtD5iXj0WIxandJLb3+kkPzdDv48YKSBjgA1cYjWmVLbcwWV0+3JnG4UkvJyKQDVnpCfo0PKab55F8mUQLLibrW1/mkNqOpePZm3i8PrHOQ9wEco5ZCFTFMbu8VCRP3AWKI5fntNzSmzu6Dcl6dKrvUPl8fv6C5VOHU9/k1QStJHJ7kLCh1olsN8dGqYaoZhzAWbsbGTRAUEvM68UqLmwRl9Fh4l/XXz4NWXQ8XKN64j+03ze0pavQGi0sU1QJ3y6THERACkWMSnkXx2OQblc4Z6U0XAZqWvfW/J1YmjdfukZUvW8m2aG2e6BiEZCwbNI0y2tJJWGqseeZxA1ZcF8tTj1ei+Bt2DvBNt+8zHiZBKtB7kwF+9MIeJQS9oOC
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(5660300002)(76116006)(122000001)(83380400001)(38070700005)(316002)(38100700002)(4326008)(64756008)(66446008)(91956017)(66476007)(66556008)(2906002)(8676002)(66946007)(8936002)(71200400001)(86362001)(55236004)(508600001)(31686004)(31696002)(36756003)(107886003)(6486002)(26005)(186003)(6512007)(2616005)(6506007)(53546011)(54906003)(6916009)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VTZ4QjJ0M2hMVzBTQXMzbE1zWUd4QVZmZ2lPWmoxcm1SRzc0ZXdHaXFLRzRJ?=
 =?utf-8?B?U2cxMTlyL0I0OTR5VXRrNmU5YndlTjdXR0hhcmI5LzRieUFwQytrZ0IvbkFR?=
 =?utf-8?B?T1MxYlRMQzVvS3JUdE51SEV1K3BVUHZ6SUplSXpLV3Y0N0duZHJYV2RYY3Z2?=
 =?utf-8?B?bW1IcmVZd2c3dVJzR2QrUDR1K2ZpVitaei9HaUUrNEUzMTVvTXlDdU5abjVt?=
 =?utf-8?B?bnNUNUtoeS9Pb3MxazNDWklDOElicHU0aXVnNmpWSTRJNUlSUjNsenNEcGNZ?=
 =?utf-8?B?TmNkY1pMNjNyRlpjMjZkVW9Eb2gvQ0FwTk90UHRrM3RpbVdZSGl6OHc2aGUr?=
 =?utf-8?B?YUZTU0FiT09sRmhLdjZ5K0kwa1NESDdEY0xsQ2tNbXdyKzMwWnFJVko2QnVq?=
 =?utf-8?B?RmRFdXdHbVBMeTlvNUFvVHFsLzZlRmI0RXRuY0s4ZzNjSGRoTCtMalZza2RU?=
 =?utf-8?B?c2o2K3puZk5OSVFKRUd4U1UvQXJTUmdQb2kzT21NWmlKR25HTVNWNHpxeGdY?=
 =?utf-8?B?a2w1U2ZEckJreFNoc0RzS2taaXpjMWgxb2ZrTlNuQWRyaUdmU2pQYS9vOXVH?=
 =?utf-8?B?VjV3am1vY2RFMXk1eVNmUmR2cEtJQUZoTFpPVFpOZ3VSZ3NkRFM5L1pQWEp5?=
 =?utf-8?B?ME0rMkxvWUMrKzg3TDg0bVRuSldxQlI2cDh3Y2w2R3VWMHpRZzJzNUhJQmk2?=
 =?utf-8?B?RGZBTWR3L09mT2Y2R1JCTTRwb01pVURCQnQybmlKcExhaGdVUFg3SmVRQWdI?=
 =?utf-8?B?TVpXOGpwT1BCb2lZZG5BakFYWExyUDJTWGl6NHVYOC9YWExMVzEybVRsTm5v?=
 =?utf-8?B?Q05XZ3FhcmM2VUtkVmNRMWZ0ZUpaT2p3dFAySy9XTFJtMzlOeGlydG5nSEtr?=
 =?utf-8?B?U0hBY3NqNkYvaXdzM3BDUzRlN3BSekZlZmhpcTJUUFllZmJZVGEvdm84SDlL?=
 =?utf-8?B?SDhKSW9kcERvU0dSa1ZybUxpUEgwWFdnZUhYbUVyMDluRTN2ckZtd2J0OUtn?=
 =?utf-8?B?akNKSWpteHZ3aWlqWGtqSWJScDlheFpOcUlyZVE1cnM3c09Icm5Db2FBZkJz?=
 =?utf-8?B?Mi9OckZvMHFRekpac2VxKzA0QXk1WWliTjFSekpRRUpVOXdIcDZ5RzE5NnZP?=
 =?utf-8?B?a1JkczJ4cXh2S3JJcitJNUs2cWVhN3FLSHZpVlk1c0RCekRBUEFNWURtbnZn?=
 =?utf-8?B?bUpPTDZEQkdTZFJHa24yc2NBV0RoSnZ4L1ZubWxubEc5YVg2TFFlN0NXWUVw?=
 =?utf-8?B?bk9mUXZaYWw0S2h4ZDlwS3hKMk9zV2syVXFMcVNvSm1TL0laVS9iVEpTdTRy?=
 =?utf-8?B?cWRCbkNJNWlucm4veDJNVzZHZkJ2aUZVRnVidDJzbGJMSlBBVkxHNjBrT2pv?=
 =?utf-8?B?dXVucVdxMm92N3p2M2p2VVBucmV6M21DVHFLYXFmWWdmZ2xBdDgxWXhSbWNu?=
 =?utf-8?B?S0tZQi90Zm82NzY5Ti9CbjU5WS9PNEF6Y2pnYldTek5ybTVrWTc4bjlZRUVa?=
 =?utf-8?B?Q2crdTc2YTYzaHU2K1kvd3dudGFJWlpuREhrWUw3d2pBeGJlUzJSVS9TRld6?=
 =?utf-8?B?UUkwRTFRbTJRUmUvSENGRFpZck40Sk1OTmlPa1lvY2hnSVJOOHZXVW9oSHJ1?=
 =?utf-8?B?aHBFQWpDMmdmMy9vSjZaeVBxYzdieWdkNHZhaEg0b2U2cWxWM3JWcmZFV081?=
 =?utf-8?B?UW01TzVidy9CNEFtNVowRWQ3NDFtT01xd2pTUlJHaTB6SjA5WWJ5MW91SnlU?=
 =?utf-8?B?WXl0aUl0b0hpM1lHMFZpemNTVEFqNWJHaEh3U0trbXRHRmo5eHZrSXFKVGlh?=
 =?utf-8?B?aHREdUp4cTJrRlpWZ0R1MEtMZjhRZkNyT05na1ZGL0Y2UTJ0NTFiL2VseHhU?=
 =?utf-8?B?TDdOUmoxS1lEbjZLREZNTDNRVzNnUnN5YVdqenFtVFp0NUhiVndHdWRVTm0x?=
 =?utf-8?B?aFBBMlk2YTBDR2FCWW9ZcERZYm1kWGhxOEUvV0ZsT0swWkxyQ1g0NXg0blVZ?=
 =?utf-8?B?WTJqazc1clo2eWdPVmFGVHRObFI3NDVINHNjVkRKZjJnc2hEeW01c2VOK1Rs?=
 =?utf-8?B?dUcvRkFSVEZDY2FzbUU2ZXRiZnI4My94cUZySzJJY3BpSGFSbllUby9zY0x5?=
 =?utf-8?B?aUo3WEdESnBDcWhsN0hCc291Y3g3bm50QllSS01pbExXUWd3aXU4bWhsaDcy?=
 =?utf-8?B?S3poR0Z2N08valFRRHpzRG01NXoyZ3dRa0dQVjJtYjBVMkFvSlhuUTU2WWhl?=
 =?utf-8?B?VFlJRzRzTGI4MjZxWG54R09oUGRXeUZBMkIyek5qUlFRcDF2US9BTlRNMm9C?=
 =?utf-8?B?Y1BINXR6NWswd0ROYUsvRlE1eEhQWkplZmRRaDg0R25lTXl3Y013dz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <25AE91D5EF35A847ACD3C37EA3537A3F@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a4744e6-1d72-4fb0-0bfd-08d9f0740ae0
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2022 11:12:23.7870
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gUqw+fDD3QKVm6GY08mQY+lFVa1hSrMza8CuT3Cbzb5HKV17hp+N64Q9vj9WGy82PK1slzrdiCeMwAwJUn+Bx9hSkr7izY8lz4lkKRhF+DleAgnkzpfns8sTdYs1O4X/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB3861
X-Proofpoint-GUID: q0jWNBErK4rS5YRkxsvlD5MKs1WRuApz
X-Proofpoint-ORIG-GUID: q0jWNBErK4rS5YRkxsvlD5MKs1WRuApz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-15_04,2022-02-14_04,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 phishscore=0 malwarescore=0 mlxlogscore=999 lowpriorityscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202150063

DQoNCk9uIDE1LjAyLjIyIDEyOjQ4LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBUdWUs
IEZlYiAxNSwgMjAyMiBhdCAxMDoxMTozNUFNICswMjAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byB3cm90ZToNCj4+IEZyb206IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5k
cnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4+DQo+PiBJbnRyb2R1Y2UgYSBwZXItZG9tYWluIHJlYWQv
d3JpdGUgbG9jayB0byBjaGVjayB3aGV0aGVyIHZwY2kgaXMgcHJlc2VudCwNCj4+IHNvIHdlIGFy
ZSBzdXJlIHRoZXJlIGFyZSBubyBhY2Nlc3NlcyB0byB0aGUgY29udGVudHMgb2YgdGhlIHZwY2kg
c3RydWN0DQo+PiBpZiBub3QuIFRoaXMgbG9jayBjYW4gYmUgdXNlZCAoYW5kIGluIGEgZmV3IGNh
c2VzIGlzIHVzZWQgcmlnaHQgYXdheSkNCj4+IHNvIHRoYXQgdnBjaSByZW1vdmFsIGNhbiBiZSBw
ZXJmb3JtZWQgd2hpbGUgaG9sZGluZyB0aGUgbG9jayBpbiB3cml0ZQ0KPj4gbW9kZS4gUHJldmlv
dXNseSBzdWNoIHJlbW92YWwgY291bGQgcmFjZSB3aXRoIHZwY2lfcmVhZCBmb3IgZXhhbXBsZS4N
Cj4+DQo+PiAxLiBQZXItZG9tYWluJ3MgdnBjaV9yd2xvY2sgaXMgdXNlZCB0byBwcm90ZWN0IHBk
ZXYtPnZwY2kgc3RydWN0dXJlDQo+PiBmcm9tIGJlaW5nIHJlbW92ZWQuDQo+Pg0KPj4gMi4gV3Jp
dGluZyB0aGUgY29tbWFuZCByZWdpc3RlciBhbmQgUk9NIEJBUiByZWdpc3RlciBtYXkgdHJpZ2dl
cg0KPj4gbW9kaWZ5X2JhcnMgdG8gcnVuLCB3aGljaCBpbiB0dXJuIG1heSBhY2Nlc3MgbXVsdGlw
bGUgcGRldnMgd2hpbGUNCj4+IGNoZWNraW5nIGZvciB0aGUgZXhpc3RpbmcgQkFSJ3Mgb3Zlcmxh
cC4gVGhlIG92ZXJsYXBwaW5nIGNoZWNrLCBpZiBkb25lDQo+PiB1bmRlciB0aGUgcmVhZCBsb2Nr
LCByZXF1aXJlcyB2cGNpLT5sb2NrIHRvIGJlIGFjcXVpcmVkIG9uIGJvdGggZGV2aWNlcw0KPj4g
YmVpbmcgY29tcGFyZWQsIHdoaWNoIG1heSBwcm9kdWNlIGEgZGVhZGxvY2suIEl0IGlzIG5vdCBw
b3NzaWJsZSB0bw0KPj4gdXBncmFkZSByZWFkIGxvY2sgdG8gd3JpdGUgbG9jayBpbiBzdWNoIGEg
Y2FzZS4gU28sIGluIG9yZGVyIHRvIHByZXZlbnQNCj4+IHRoZSBkZWFkbG9jaywgY2hlY2sgd2hp
Y2ggcmVnaXN0ZXJzIGFyZSBnb2luZyB0byBiZSB3cml0dGVuIGFuZCBhY3F1aXJlDQo+PiB0aGUg
bG9jayBpbiB0aGUgYXBwcm9wcmlhdGUgbW9kZSBmcm9tIHRoZSBiZWdpbm5pbmcuDQo+Pg0KPj4g
QWxsIG90aGVyIGNvZGUsIHdoaWNoIGRvZXNuJ3QgbGVhZCB0byBwZGV2LT52cGNpIGRlc3RydWN0
aW9uIGFuZCBkb2VzIG5vdA0KPj4gYWNjZXNzIG11bHRpcGxlIHBkZXZzIGF0IHRoZSBzYW1lIHRp
bWUsIGNhbiBzdGlsbCB1c2UgYSBjb21iaW5hdGlvbiBvZiB0aGUNCj4+IHJlYWQgbG9jayBhbmQg
cGRldi0+dnBjaS0+bG9jay4NCj4+DQo+PiAzLiBPcHRpbWl6ZSBpZiBST00gQkFSIHdyaXRlIGxv
Y2sgcmVxdWlyZWQgZGV0ZWN0aW9uIGJ5IGNhY2hpbmcgb2Zmc2V0DQo+PiBvZiB0aGUgUk9NIEJB
UiByZWdpc3RlciBpbiB2cGNpLT5oZWFkZXItPnJvbV9yZWcgd2hpY2ggZGVwZW5kcyBvbg0KPj4g
aGVhZGVyJ3MgdHlwZS4NCj4+DQo+PiA0LiBSZWR1Y2UgbG9ja2VkIHJlZ2lvbiBpbiB2cGNpX3Jl
bW92ZV9kZXZpY2UgYXMgaXQgaXMgbm93IHBvc3NpYmxlDQo+PiB0byBzZXQgcGRldi0+dnBjaSB0
byBOVUxMIGVhcmx5IHJpZ2h0IGFmdGVyIHRoZSB3cml0ZSBsb2NrIGlzIGFjcXVpcmVkLg0KPj4N
Cj4+IDUuIFJlZHVjZSBsb2NrZWQgcmVnaW9uIGluIHZwY2lfYWRkX2hhbmRsZXJzIGFzIGl0IGlz
IHBvc3NpYmxlIHRvDQo+PiBpbml0aWFsaXplIG1hbnkgbW9yZSBmaWVsZHMgb2YgdGhlIHN0cnVj
dCB2cGNpIGJlZm9yZSBhc3NpZ25pbmcgaXQgdG8NCj4+IHBkZXYtPnZwY2kuDQo+Pg0KPj4gNi4g
dnBjaV97YWRkfHJlbW92ZX1fcmVnaXN0ZXIgYXJlIHJlcXVpcmVkIHRvIGJlIGNhbGxlZCB3aXRo
IHRoZSB3cml0ZSBsb2NrDQo+PiBoZWxkLCBidXQgaXQgaXMgbm90IGZlYXNpYmxlIHRvIGFkZCBh
biBhc3NlcnQgdGhlcmUgYXMgaXQgcmVxdWlyZXMNCj4+IHN0cnVjdCBkb21haW4gdG8gYmUgcGFz
c2VkIGZvciB0aGF0LiBTbywgYWRkIGEgY29tbWVudCBhYm91dCB0aGlzIHJlcXVpcmVtZW50DQo+
PiB0byB0aGVzZSBhbmQgb3RoZXIgZnVuY3Rpb25zIHdpdGggdGhlIGVxdWl2YWxlbnQgY29uc3Ry
YWludHMuDQo+Pg0KPj4gNy4gRHJvcCBjb25zdCBxdWFsaWZpZXIgd2hlcmUgdGhlIG5ldyByd2xv
Y2sgaXMgdXNlZCBhbmQgdGhpcyBpcyBhcHByb3ByaWF0ZS4NCj4+DQo+PiA4LiBEbyBub3QgY2Fs
bCBwcm9jZXNzX3BlbmRpbmdfc29mdGlycXMgd2l0aCBhbnkgbG9ja3MgaGVsZC4gRm9yIHRoYXQg
dW5sb2NrDQo+PiBwcmlvciB0aGUgY2FsbCBhbmQgcmUtYWNxdWlyZSB0aGUgbG9ja3MgYWZ0ZXIu
IEFmdGVyIHJlLWFjcXVpcmluZyB0aGUNCj4+IGxvY2sgdGhlcmUgaXMgbm8gbmVlZCB0byBjaGVj
ayBpZiBwZGV2LT52cGNpIGV4aXN0czoNCj4+ICAgLSBpbiBhcHBseV9tYXAgYmVjYXVzZSBvZiB0
aGUgY29udGV4dCBpdCBpcyBjYWxsZWQgKG5vIHJhY2UgY29uZGl0aW9uDQo+PiAgICAgcG9zc2li
bGUpDQo+PiAgIC0gZm9yIE1TSS9NU0ktWCBkZWJ1ZyBjb2RlIGJlY2F1c2UgaXQgaXMgY2FsbGVk
IGF0IHRoZSBlbmQgb2YNCj4+ICAgICBwZGV2LT52cGNpIGFjY2VzcyBhbmQgbm8gZnVydGhlciBh
Y2Nlc3MgdG8gcGRldi0+dnBjaSBpcyBtYWRlDQo+Pg0KPj4gOS4gQ2hlY2sgZm9yICFwZGV2LT52
cGNpIGluIHZwY2lfe3JlYWR8d3JpdGV9IGFmdGVyIGFjcXVpcmluZyB0aGUgbG9jaw0KPj4gYW5k
IGlmIHNvLCBhbGxvdyByZWFkaW5nIG9yIHdyaXRpbmcgdGhlIGhhcmR3YXJlIHJlZ2lzdGVyIGRp
cmVjdGx5LiBUaGlzIGlzDQo+PiBhY2NlcHRhYmxlIGFzIHdlIG9ubHkgZGVhbCB3aXRoIERvbTAg
YXMgb2Ygbm93LiBPbmNlIERvbVUgc3VwcG9ydCBpcw0KPj4gYWRkZWQgdGhlIHdyaXRlIHdpbGwg
bmVlZCB0byBiZSBpZ25vcmVkIGFuZCByZWFkIHJldHVybiBhbGwgMCdzIGZvciB0aGUNCj4+IGd1
ZXN0cywgd2hpbGUgRG9tMCBjYW4gc3RpbGwgYWNjZXNzIHRoZSByZWdpc3RlcnMgZGlyZWN0bHku
DQo+Pg0KPj4gMTAuIEludHJvZHVjZSBwY2lkZXZzX3RyeWxvY2ssIHNvIHRoZXJlIGlzIGEgcG9z
c2liaWxpdHkgdG8gdHJ5IGxvY2tpbmcNCj4+IHRoZSBwY2lkZXYncyBsb2NrLg0KPj4NCj4+IDEx
LiBVc2UgcGNpZGV2J3MgbG9jayBhcm91bmQgZm9yX2VhY2hfcGRldiBhbmQgcGNpX2dldF9wZGV2
X2J5X2RvbWFpbg0KPj4gd2hpbGUgYWNjZXNzaW5nIHBkZXZzIGluIHZwY2kgY29kZS4NCj4gU28g
aWYgeW91IHVzZSB0aGUgcGNpZGV2c19sb2NrIHRoZW4gaXQncyBpbXBvc3NpYmxlIGZvciB0aGUg
cGRldiBvcg0KPiBwZGV2LT52cGNpIHRvIGJlIHJlbW92ZWQgb3IgcmVjcmVhdGVkLCBhcyB0aGUg
cGNpZGV2cyBsb2NrIHByb3RlY3RzDQo+IGFueSBkZXZpY2Ugb3BlcmF0aW9ucyAoYWRkLCByZW1v
dmUsIGFzc2lnbiwgZGVhc3NpZ24pLg0KPg0KPiBJdCdzIGhvd2V2ZXIgbm90IE9LIHRvIHVzZSB0
aGUgcGNpZGV2cyBsb2NrIGluIHZwY2lfe3JlYWQsd3JpdGV9DQo+IGFzLWlzLCBhcyB0aGUgaW50
cm9kdWNlZCBjb250ZW50aW9uIGlzIElNTyBub3QgYWNjZXB0YWJsZS4NCj4NCj4gVGhlIG9ubHkg
dmlhYmxlIG9wdGlvbiBJIHNlZSBoZXJlIGlzIHRvOg0KPg0KPiAgIDEuIE1ha2UgdGhlIHBjaWRl
dnMgbG9jayBhIHJ3bG9jazogc3dpdGNoIGN1cnJlbnQgY2FsbGVycyB0byB0YWtlIHRoZQ0KPiAg
ICAgIGxvY2sgaW4gd3JpdGUgbW9kZSwgZGV0ZWN0IGFuZCBmaXh1cCBhbnkgaXNzdWVzIHRoYXQg
Y291bGQgYXJpc2UNCj4gICAgICBmcm9tIHRoZSBsb2NrIG5vdCBiZWluZyByZWN1cnNpdmUgYW55
bW9yZS4NCj4gICAyLiBUYWtlIHRoZSBsb2NrIGluIHJlYWQgbW9kZSBhcm91bmQgdnBjaV97cmVh
ZCx3cml0ZX0gc2VjdGlvbnMgdGhhdA0KPiAgICAgIHJlbHkgb24gcGRldiAoaW5jbHVkaW5nIHRo
ZSBoYW5kbGVycykuDQo+DQo+IFRoZXNlIGl0ZW1zIHNob3VsZCBiZSBhdCBsZWFzdCB0d28gc2Vw
YXJhdGUgcGF0Y2hlcy4gTGV0J3Mgbm90IG1peCB0aGUNCj4gY29udmVyc2lvbiBvZiBwY2lkZXZz
IGxvY2tzIHdpdGggdGhlIGFkZGl0aW9uIG9mIHZQQ0kgc3VwcG9ydC4NCj4NCj4gSSB0aGluayB3
aXRoIHRoYXQgd2UgY291bGQgZ2V0IGF3YXkgd2l0aG91dCByZXF1aXJpbmcgYSBwZXItZG9tYWlu
DQo+IHJ3bG9jaz8gSnVzdCBkb2luZyBsb2NrIG9yZGVyaW5nIGluIG1vZGlmeV9iYXJzIHJlZ2Fy
ZGluZw0KPiB0bXAtPnZwY2ktPmxvY2sgdnMgcGRldi0+dnBjaS0+bG9jay4gTmVpdGhlciBwZGV2
IG9yIHZwY2kgY2FuIGdvIGF3YXkNCj4gd2hpbGUgaG9sZGluZyB0aGUgcGNpZGV2cyBsb2NrLg0K
Pg0KPiBTb3J0aW5nIHRoZSBzaXR1YXRpb24gaW4gbW9kaWZ5X2JhcnMgc2hvdWxkIGFsc28gYmUg
ZG9uZSBhcyBhIHNlcGFyYXRlDQo+IHBhdGNoIG9uIHRvcCBvZiAxLiBhbmQgMi4NClNvLCB0byBt
YWtlIGl0IGNyeXN0YWwgY2xlYXI6IHdlIGNhbiBkbyB3aXRoIHRoZSBsb2NraW5nIGFzIGluIHRo
aXMNCnBhdGNoIGFuZCBpbnN0ZWFkIHdlIG5lZWQgdG8gY29udmVydCBwY2lkZXZzIGxvY2sgaW50
byByd2xvY2suDQpNZWFuaW5nIHRoYXQgSSBuZWVkIHRvIGRyb3AgdGhpcyBwYXRjaC4NCg0KVGhl
biwgMyBwYXRjaGVzIHRvIGZvbGxvdzoNCjEuIHBjaWRldnMgYXMgcndsb2NrDQoyLiB2cGNpX3ty
ZWFkfHdyaXRlfSBhbmQgdGhlIHJlc3QgdXNpbmcgbmV3IHBjaWRldnMgcndsb2NrDQozLiBsb2Nr
IG9yZGVyaW5nIGluIG1vZGlmeV9iYXJzDQoNCklzIGl0IHdoYXQgd2Ugd2FudD8NCg0KVGhhbmsg
eW91LA0KT2xla3NhbmRy

