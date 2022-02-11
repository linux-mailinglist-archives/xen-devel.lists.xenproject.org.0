Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D2D4B2563
	for <lists+xen-devel@lfdr.de>; Fri, 11 Feb 2022 13:14:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.270489.464799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIUp4-0006Fd-5c; Fri, 11 Feb 2022 12:14:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 270489.464799; Fri, 11 Feb 2022 12:14:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIUp4-0006DR-0X; Fri, 11 Feb 2022 12:14:46 +0000
Received: by outflank-mailman (input) for mailman id 270489;
 Fri, 11 Feb 2022 12:14:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XOdK=S2=epam.com=prvs=4041dc41fc=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nIUp2-0006CC-IM
 for xen-devel@lists.xenproject.org; Fri, 11 Feb 2022 12:14:44 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31125c59-8b34-11ec-8eb8-a37418f5ba1a;
 Fri, 11 Feb 2022 13:14:43 +0100 (CET)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21BC8N1q020930;
 Fri, 11 Feb 2022 12:14:39 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2174.outbound.protection.outlook.com [104.47.17.174])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3e5qhqr1cc-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Feb 2022 12:14:39 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by DB6PR0302MB2727.eurprd03.prod.outlook.com (2603:10a6:4:ae::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Fri, 11 Feb
 2022 12:14:35 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::fc4d:4749:5d1:eb73]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::fc4d:4749:5d1:eb73%4]) with mapi id 15.20.4975.015; Fri, 11 Feb 2022
 12:14:35 +0000
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
X-Inumbo-ID: 31125c59-8b34-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fv26pfbdpMOnRE3T7wYassSTmzd5cBZfKnQ8tDDp/PM2aI80uubhN5VxCN8RKtInIgSEWVyrJh+NRhjE35MwCkShQjiki0hoDFXwTWf7IqC3peMxjglOiIhuzXKD/6hVksplTZYyz6TrvY64YLCiEPs/a3w7CmLLDkTPEquQqJALliqp6xUA/1XlkF3VeKwdpJEj7AzuevR47B3nLNNreSyzOyjiRjnJUctFu4Bx4zkwSGzXZCgRc4jusshQ3wP5ae1xwa+VE2EnBGB9dXw3O/3+3v4SOWdazdk96HNFtoRHfh6dfL0RY5H+ss2CEkCj3iQ+GN4UYfzvZRYqYx9Upg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ElQ75QBlI0Kxwoeo9HL4MsI7cdTdXqwa9XEr14uRJsw=;
 b=Dvd5Rss8brRYW8m5wc2Aa2gZLQoioxBKuHqUzEd+4NsKJQGijTra5Rgbdl9nNKPFS2oI/uEedxoJSRAlSKTplxq7lFivm6briD8JkOofhAxy6++XcAvszM6eZu5E3E4QhfnV+6/JQitWjKBmApBi3oL84LdMbpGDTPmv9KK7wWzC7iYDUBHWMR1TCWVRPwXNB+P4u3WHoFzRmPT5MlVk3B9xdqnWkGU+zE7gTRgiDYsD9kJwtyockZatCMQQsm7q4mWbZi7dwjZr38I6It9eriza5roFLyYs3+WjHQG23WaIGmqRbnHFGnnjIe5a3MCZIMSYH0sNnIh/PuPP+KFDzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ElQ75QBlI0Kxwoeo9HL4MsI7cdTdXqwa9XEr14uRJsw=;
 b=qXiXz6UTz7LdMRMvMaQ+HRUjEcabkU6hkRIplIxi1qIf/o8u7Rb3MccWOUH4wolKsXuJtyo9Viv3hWjXfz/6ed3oPACgTPmaWSvK3tS8JfU7Zx+1hJeqi3LbbK3bbFANW+GQx++tIm64Nom5jH1YQuJuZJnAsd7mHuarahb4r4e8vNm50JteAWdnDZc0iVbB8knJsViZgCsDrH6eaDrAxMoFjUq0JfOiNHi6nhf8CtLmpFE1GqeRrVe+Kb2j6P4atAxYNy6v0OpXMFZapwUgzwRZ7xpJZTwtO7fzERfwQbkk0SK2JQmm03Z9tQrqdN3HlEpfu8P0fGQfzkjlJxI+dw==
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
Subject: Re: [PATCH] vpci: introduce per-domain lock to protect vpci structure
Thread-Topic: [PATCH] vpci: introduce per-domain lock to protect vpci
 structure
Thread-Index: AQHYHboQT3cBWYI1/EGunE7hOwop6ayM95MAgAEU1ACAADOqgIAABlcA
Date: Fri, 11 Feb 2022 12:14:35 +0000
Message-ID: <5e3119c5-0f0d-43c7-064b-61ba247832b1@epam.com>
References: <20220209133627.959649-1-andr2000@gmail.com>
 <YgU6Snk8GTytJXZp@Air-de-Roger>
 <878371dd-4269-6e44-4e73-344a74a04a84@epam.com>
 <YgZN2acOL5B+PYF5@Air-de-Roger>
In-Reply-To: <YgZN2acOL5B+PYF5@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c030b411-e84b-4170-2576-08d9ed581133
x-ms-traffictypediagnostic: DB6PR0302MB2727:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <DB6PR0302MB2727E422077242FADA2066D6E7309@DB6PR0302MB2727.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 GN08JvxCbW1KRTWSp15Htc1h4SuVnySd1TawJux7/JssJq1XLAoSEu14trkVhc+/wb6moFXsoWpJ3+CAi+woC3prBnTDBF+cSZaCWwKPVNuOW/CYfDLJBrWNlTmwdcyqMKHjWwnZ+FlUWn++cdxEeF3CT5K2qQEtJV2K8NfRpn3IjlZD7YgoyaX7RDbahR27UOYIuHx0G+shOVi23pTUMbZNDxqsL4o+lTMi03P9i2EXKfNRqnQo4xGg2jQBqXCldf6PH6P8lOk4pxYZswjsNZQTgNFAT4/o/9GpImhXEsJbKIdPaMfWZOp4VmRsF8q6GASTBGEg+fSR9WNlRrsti9kdRKVftFpp1yq32BOlxeSAt6JN1MFWnkVXYaR4rXvP/2rqYIGYPtDyJZuZoSHsXou/KmONFPO3xwh6B5JqYN0x/HHfiyqEVWJGnRUdN7Jgq2SjuVzLVpfShKnUW8v1ln/bQl5/JRuaFgQbdrnY+eM8WKMFzJJ1AdEMSNOkfrCHCodOHQxcg61Hd+l8pd/96HyC+6E46EXD//r5SCLit9IWBu+vEkFvXYTanu5horjlTAXdRejTn0o4kwp7x0L4jBxNikud9PIZtYMXJ2K+YMqfoWBMyt9+nZngCwak/SqXjtFV1P1CyFR8J7K9FBp5bx3tw0I1JoyWD9V6C9Kdo/xMPbOzsAxQcUnk92Tu0AxgjKg0XVYWRslRoN4r40G0eF4qObn8HKN/3OPtwLm8RP/3Vv74IbKc1N0MmWOOMl2I
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8676002)(8936002)(6506007)(4326008)(76116006)(6512007)(66946007)(71200400001)(6486002)(66446008)(31696002)(86362001)(53546011)(38100700002)(66556008)(508600001)(55236004)(54906003)(6916009)(122000001)(316002)(66476007)(91956017)(64756008)(36756003)(5660300002)(186003)(38070700005)(31686004)(2906002)(2616005)(26005)(107886003)(83380400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?R20rNE5IZ2J6L0xMUXNiU2JJVk40VnlQQzAzenIzeFNvaWV2MkEyM0FBeTBx?=
 =?utf-8?B?WHlMZTJxRXQ2U3BLeWJoejFzL3VQd0tUZ1YyakYvVEU0MXhTbllDdGVsVWZ2?=
 =?utf-8?B?R2xMQWwzOXhxSDMxdUd2cHQxbVRITTFaZzhrd3EwOHNmOEtaWVlZd2hWN2dw?=
 =?utf-8?B?NzlXdlFMVVFvOU5aNlB0OEZHdjhmdWpucjJKOG4yNEJxWkZBalpRNjh4WEMr?=
 =?utf-8?B?Rmtqb2VPb05uQnhCZzFxU2hUQThQbVgwdHg5VHNiL2lJRmlJSElLRE1uQmlC?=
 =?utf-8?B?a0duQW52TWRsRENTeVBzK0tPcW5ZSjRZMGlsMmtBZ25zYXJxeU9yQUZMMERx?=
 =?utf-8?B?Nm1XL1ZQVmtUNyt2UUlrcE1zbCt6UC9zcFBEYmVjbGpsaUVzZFJmNVVRLzg3?=
 =?utf-8?B?UkFUQVhhRDZnNlpLZklrRUcxY1RQZHdhMW9WdWYwbUJjWDBpMVVORWFtd3dT?=
 =?utf-8?B?VkpoTlV5OEQydy9RVmxndzFORjdkc2QwTUxWTmFVVXRKZGpUN0kxNTdkRXpS?=
 =?utf-8?B?bmovdWVpU3ZqWktwVk5rWkwwT01Ja0RZTGNDMjhzTlN6eTBDSWw2dU1qTWlS?=
 =?utf-8?B?MkxuajUyTlhvT08vQmQzb0FaRCtRVUtIQ241dVRkSWNpYTdib3k0YjM3aksx?=
 =?utf-8?B?S0FnMjRlYTJtbldBZEhUbVp5WGdUYmhGMUVxZmdoeW1yR0tXNWZ6ZE1rdHZl?=
 =?utf-8?B?N2k0RFplRFZSR1duZnNkdVRDNDk2KzBiUG9hMGZ5MFRFUFRJVDNQaDdFblVB?=
 =?utf-8?B?bFBiS0Q0K3dOakdybUxudndIRGJDbGthdG5JYWxzR1lMOTcrbytUUE1kK0RG?=
 =?utf-8?B?ZnFxVXhpYk10U0JjVWt2SHB5bmVpTHhIUVkwWCtjN1pTWTE2Q2VtVU9DWGlz?=
 =?utf-8?B?OFlPMy9RZ2FDNm9tR2NZZ1g0QW11Nys4bkhrNlRpd1J5aFphelFNeFFva2Rp?=
 =?utf-8?B?dU1VRE5XSVIzdVZ5ZTA1NEg2dnZEc3FoaXJ3RWpibkpNVmFESDhFMW5ZOWhq?=
 =?utf-8?B?L2U1SytwSXdYbldWUzUzcklLbTkvUGdqTHZ6a0lwNEo4a012TWVENFNsY21M?=
 =?utf-8?B?cE5SVDRoV0N1SHVCL1hPSVBpcUdpMUFUaDNyMUlNcTBTR0taMVRvSHpVUUNQ?=
 =?utf-8?B?bEtweGI0Tnl4a0VSR3ZTb2NjTXpuV3hjcVY5Qm9zZVpGK0Raclk1QlhPNzFz?=
 =?utf-8?B?WUMzYnRQejFodlpLSUM4aWptWW9lKy8vOUJCT1lvNXZodkRmWGNValcwL3dS?=
 =?utf-8?B?NkRCVXNJLzFsTzRpYVlwSmpwc3JjTHpQRTFxam9uOUJnMHNYTTlrU0FrVWd5?=
 =?utf-8?B?MnVUNkpJcjRDV1ZvTUUySDI5K3hmNm8ySHlWRWxiaTRxRkJoZ1dMYVkrYkh6?=
 =?utf-8?B?bUJBRXJVaEJSMHNEZzVQQmdmaUlBRVUwRFVDVi80cVI5bGVrcXltcFdHMlJ0?=
 =?utf-8?B?U0ZHSm5raG1mQTBBVFlOK0JXTGJNNndqalZhYjVzL0xNajBFQUxZWGxDd01W?=
 =?utf-8?B?dUFaSHYyRWZzSERMclFGWHo2Z3d6N0pUNVE2dDg2MVRwNUVaUHJxYXQzNkZ0?=
 =?utf-8?B?UUc5c1RJWmVRNjN3VzFOd3lMMzkwUnlLdjhpVjB3K1g5ZjV5ZHJTVXVTbVhX?=
 =?utf-8?B?K1VEVDU5MHRjZUxxam1iWXFDMlE2NWthbTU2NGs1cmRxUExWVlo2cWlham9l?=
 =?utf-8?B?c2lndFBoL2xmRXhONnI3TmU5WFFHZ0ZXQi9EUTJkMitVVWhpNHg5UDJESEpK?=
 =?utf-8?B?YXVOTHAyTFgydHJ0elkvTi9qZ3kwNWQvdWVRbUZBNnBrTXJkSERweTNoTDND?=
 =?utf-8?B?MHFjQU1wMVM5aVkwMVJ6Q0x6aXU0M0NYeWxNam1wZ3N6dnIzTEp4VTBhbE5o?=
 =?utf-8?B?Wm5Xb3M1N0phU0FRTndiZmNKNGpaTkw3MEtCbUNTZ3lWZzBCUTV1T0I2TjVo?=
 =?utf-8?B?b25YdmsvN0FGMkRJOXlLaWR2M1cvN0x5YXVXbkpMVW45NVVxNENUZnVtM25P?=
 =?utf-8?B?b0pPUjhpOTZ2K2R4YWhIMmZKVE5Bb2FtOHJ6VzV6VDB4SkYvZ0dMYWdVQ3NV?=
 =?utf-8?B?RkkvVWFFWFZyWmkxdUp3TGJUWVhYQU1KbnAzMHNPL2tHa3lLSXNaY2JhWm5S?=
 =?utf-8?B?b0pXSzRtMzA3Rmk2eDVvd1Q1OHlWSS9mcEVvaVRia2l0K2VEVm9qZ2hsQ3Fn?=
 =?utf-8?B?d0JqcnFERzJTUUJrcGlTN0VrNGZSRzdtendrSzIyVVhLUlpmR0RiK3FrbHNu?=
 =?utf-8?B?Ukk4dlhSakd1dnZzZ2w2eDRQTUJETWkzaVRzUkwwVkVXZ05QNkI3TlkwN01r?=
 =?utf-8?B?bVZJdzM4QUlPVjdKeGNRUUFUY1ZpWGtmbjN3SnhPOW1HcUt1MWlBUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3D5CFE355135764BA064F0FDE594816C@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c030b411-e84b-4170-2576-08d9ed581133
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2022 12:14:35.0324
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DwdvSAwfRXusi0jBftn9bmqo/A4PY/lddRe9X8xTzF1+XKMjAb87YJnApTTiDewSrrgkf90RnT9k54CXwdheOYH9lPbrG2bJPM3abhUGQaGXnS/UPMbryov/kO38t4pb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0302MB2727
X-Proofpoint-GUID: AQZXOoyWw-H5l7U_ruQ3TdkHOqJX3iWZ
X-Proofpoint-ORIG-GUID: AQZXOoyWw-H5l7U_ruQ3TdkHOqJX3iWZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-11_04,2022-02-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1015 bulkscore=0
 mlxlogscore=999 lowpriorityscore=0 priorityscore=1501 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202110071

DQoNCk9uIDExLjAyLjIyIDEzOjUxLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBGcmks
IEZlYiAxMSwgMjAyMiBhdCAwODo0Njo1OUFNICswMDAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byB3cm90ZToNCj4+DQo+PiBPbiAxMC4wMi4yMiAxODoxNiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90
ZToNCj4+PiBPbiBXZWQsIEZlYiAwOSwgMjAyMiBhdCAwMzozNjoyN1BNICswMjAwLCBPbGVrc2Fu
ZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4gRnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVu
a28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0KPj4+Pg0KPj4+PiBJbnRyb2R1
Y2UgYSBwZXItZG9tYWluIHJlYWQvd3JpdGUgbG9jayB0byBjaGVjayB3aGV0aGVyIHZwY2kgaXMg
cHJlc2VudCwNCj4+Pj4gc28gd2UgYXJlIHN1cmUgdGhlcmUgYXJlIG5vIGFjY2Vzc2VzIHRvIHRo
ZSBjb250ZW50cyBvZiB0aGUgdnBjaSBzdHJ1Y3QNCj4+Pj4gaWYgbm90LiBUaGlzIGxvY2sgY2Fu
IGJlIHVzZWQgKGFuZCBpbiBhIGZldyBjYXNlcyBpcyB1c2VkIHJpZ2h0IGF3YXkpDQo+Pj4+IHNv
IHRoYXQgdnBjaSByZW1vdmFsIGNhbiBiZSBwZXJmb3JtZWQgd2hpbGUgaG9sZGluZyB0aGUgbG9j
ayBpbiB3cml0ZQ0KPj4+PiBtb2RlLiBQcmV2aW91c2x5IHN1Y2ggcmVtb3ZhbCBjb3VsZCByYWNl
IHdpdGggdnBjaV9yZWFkIGZvciBleGFtcGxlLg0KPj4+IFNhZGx5IHRoZXJlJ3Mgc3RpbGwgYSBy
YWNlIGluIHRoZSB1c2FnZSBvZiBwY2lfZ2V0X3BkZXZfYnlfZG9tYWluIHdydA0KPj4+IHBjaV9y
ZW1vdmVfZGV2aWNlLCBhbmQgbGlrZWx5IHdoZW4gdlBDSSBnZXRzIGFsc28gdXNlZCBpbg0KPj4+
IHtkZX1hc3NpZ25fZGV2aWNlIEkgdGhpbmsuDQo+Pj4NCj4+IEhvdyBhYm91dCB0aGUgYmVsb3c/
IEl0IHNlZW1zIHRvIGd1YXJhbnRlZSB0aGF0IHdlIGNhbiBhY2Nlc3MgcGRldg0KPj4gd2l0aG91
dCBpc3N1ZXMgYW5kIHdpdGhvdXQgcmVxdWlyaW5nIHBjaWRldnNfbG9jayB0byBiZSB1c2VkPw0K
PiBIbSwgSSdtIHVuc3VyZSB0aGlzIGlzIGNvcnJlY3QuDQpZZXMsIHdlIG5lZWQgcGNpZGV2cyBh
cyByd2xvY2sgaW4gb3JkZXIgdG8gc29sdmUgdGhpcyByZWxpYWJseS4uLg0KPiAgIEl0J3MgaW4g
Z2VuZXJhbCBhIGJhZCBpZGVhIHRvIHVzZSBhDQo+IHBlci1kb21haW4gbG9jayBhcHByb2FjaCB0
byBwcm90ZWN0IHRoZSBjb25zaXN0ZW5jeSBvZiBlbGVtZW50cyBtb3ZpbmcNCj4gYmV0d2VlbiBk
b21haW5zLg0KPg0KPiBJbiBvcmRlciBmb3IgdGhpcyB0byBiZSBzYWZlIHlvdSB3aWxsIGxpa2Vs
eSBuZWVkIHRvIGhvbGQgYm90aCB0aGUNCj4gc291cmNlIGFuZCB0aGUgZGVzdGluYXRpb24gcGVy
LWRvbWFpbiBsb2NrcywgYW5kIHRoZW4geW91IGNvdWxkIGFsc28NCj4gZ2V0IGludG8gQUJCQSBs
b2NrIGlzc3VlcyB1bmxlc3MgeW91IGFsd2F5cyB0YWtlIHRoZSBsb2NrIGluIHRoZSBzYW1lDQo+
IG9yZGVyLg0KPg0KPiBJIHRoaW5rIGl0J3Mgc2FmZXIgdG8gdXNlIGEgZ2xvYmFsIGxvY2sgaW4g
dGhpcyBjYXNlIChwY2lkZXZzX2xvY2spLg0KPg0KPj4gZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJz
L3Bhc3N0aHJvdWdoL3BjaS5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMNCj4+IGlu
ZGV4IGU4YjA5ZDc3ZDg4MC4uZmQ0NjRhNThiM2IzIDEwMDY0NA0KPj4gLS0tIGEveGVuL2RyaXZl
cnMvcGFzc3Rocm91Z2gvcGNpLmMNCj4+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Bj
aS5jDQo+PiBAQCAtOTM3LDggKzkzNywxNCBAQCBzdGF0aWMgaW50IGRlYXNzaWduX2RldmljZShz
dHJ1Y3QgZG9tYWluICpkLCB1aW50MTZfdCBzZWcsIHVpbnQ4X3QgYnVzLA0KPj4gICDCoMKgwqDC
oCB9DQo+Pg0KPj4gICDCoMKgwqDCoCBkZXZmbiA9IHBkZXYtPmRldmZuOw0KPj4gKyNpZmRlZiBD
T05GSUdfSEFTX1ZQQ0kNCj4+ICvCoMKgwqAgd3JpdGVfbG9jaygmZC0+dnBjaV9yd2xvY2spOw0K
Pj4gKyNlbmRpZg0KPj4gICDCoMKgwqDCoCByZXQgPSBpb21tdV9jYWxsKGhkLT5wbGF0Zm9ybV9v
cHMsIHJlYXNzaWduX2RldmljZSwgZCwgdGFyZ2V0LCBkZXZmbiwNCj4+ICAgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBjaV90b19kZXYocGRldikpOw0KPj4gKyNp
ZmRlZiBDT05GSUdfSEFTX1ZQQ0kNCj4+ICvCoMKgwqAgd3JpdGVfdW5sb2NrKCZkLT52cGNpX3J3
bG9jayk7DQo+PiArI2VuZGlmDQo+PiAgIMKgwqDCoMKgIGlmICggcmV0ICkNCj4+ICAgwqDCoMKg
wqDCoMKgwqDCoCBnb3RvIG91dDsNCj4+DQo+PiBAQCAtMTQ3NCw2ICsxNDgwLDkgQEAgc3RhdGlj
IGludCBhc3NpZ25fZGV2aWNlKHN0cnVjdCBkb21haW4gKmQsIHUxNiBzZWcsIHU4IGJ1cywgdTgg
ZGV2Zm4sIHUzMiBmbGFnKQ0KPj4gICDCoMKgwqDCoCBjb25zdCBzdHJ1Y3QgZG9tYWluX2lvbW11
ICpoZCA9IGRvbV9pb21tdShkKTsNCj4+ICAgwqDCoMKgwqAgc3RydWN0IHBjaV9kZXYgKnBkZXY7
DQo+PiAgIMKgwqDCoMKgIGludCByYyA9IDA7DQo+PiArI2lmZGVmIENPTkZJR19IQVNfVlBDSQ0K
Pj4gK8KgwqDCoCBzdHJ1Y3QgZG9tYWluICpvbGRfZDsNCj4+ICsjZW5kaWYNCj4+DQo+PiAgIMKg
wqDCoMKgIGlmICggIWlzX2lvbW11X2VuYWJsZWQoZCkgKQ0KPj4gICDCoMKgwqDCoMKgwqDCoMKg
IHJldHVybiAwOw0KPj4gQEAgLTE0ODcsMTUgKzE0OTYsMzQgQEAgc3RhdGljIGludCBhc3NpZ25f
ZGV2aWNlKHN0cnVjdCBkb21haW4gKmQsIHUxNiBzZWcsIHU4IGJ1cywgdTggZGV2Zm4sIHUzMiBm
bGFnKQ0KPj4gICDCoMKgwqDCoCBBU1NFUlQocGRldiAmJiAocGRldi0+ZG9tYWluID09IGhhcmR3
YXJlX2RvbWFpbiB8fA0KPj4gICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHBkZXYtPmRvbWFpbiA9PSBkb21faW8pKTsNCj4+DQo+PiArI2lmZGVmIENPTkZJR19IQVNf
VlBDSQ0KPj4gK8KgwqDCoCAvKiBwZGV2LT5kb21haW4gaXMgZWl0aGVyIGh3ZG9tIG9yIGRvbV9p
by4gV2UgZG8gbm90IHdhbnQgdGhlIGxhdGVyLiAqLw0KPj4gK8KgwqDCoCBvbGRfZCA9IHBkZXYt
PmRvbWFpbiA9PSBoYXJkd2FyZV9kb21haW4gPyBwZGV2LT5kb21haW4gOiBOVUxMOw0KPj4gK8Kg
wqDCoCBpZiAoIG9sZF9kICkNCj4+ICvCoMKgwqDCoMKgwqDCoCB3cml0ZV9sb2NrKCZvbGRfZC0+
dnBjaV9yd2xvY2spOw0KPj4gKyNlbmRpZg0KPj4gKw0KPj4gICDCoMKgwqDCoCByYyA9IHBkZXZf
bXNpeF9hc3NpZ24oZCwgcGRldik7DQo+IEkgZG9uJ3QgdGhpbmsgeW91IG5lZWQgdGhlIHZwY2kg
bG9jayBmb3IgdGhpcyBvcGVyYXRpb24uDQo+DQo+PiAgIMKgwqDCoMKgIGlmICggcmMgKQ0KPj4g
K8KgwqDCoCB7DQo+PiArI2lmZGVmIENPTkZJR19IQVNfVlBDSQ0KPj4gK8KgwqDCoMKgwqDCoMKg
IGlmICggb2xkX2QgKQ0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgd3JpdGVfdW5sb2NrKCZv
bGRfZC0+dnBjaV9yd2xvY2spOw0KPj4gKyNlbmRpZg0KPj4gICDCoMKgwqDCoMKgwqDCoMKgIGdv
dG8gZG9uZTsNCj4+ICvCoMKgwqAgfQ0KPj4NCj4+ICAgwqDCoMKgwqAgcGRldi0+ZmF1bHQuY291
bnQgPSAwOw0KPj4NCj4+ICAgwqDCoMKgwqAgaWYgKCAocmMgPSBpb21tdV9jYWxsKGhkLT5wbGF0
Zm9ybV9vcHMsIGFzc2lnbl9kZXZpY2UsIGQsIGRldmZuLA0KPj4gICDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBjaV90b19kZXYocGRldiksIGZs
YWcpKSApDQo+PiArwqDCoMKgIHsNCj4+ICsjaWZkZWYgQ09ORklHX0hBU19WUENJDQo+PiArwqDC
oMKgwqDCoMKgwqAgaWYgKCBvbGRfZCApDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB3cml0
ZV91bmxvY2soJm9sZF9kLT52cGNpX3J3bG9jayk7DQo+PiArI2VuZGlmDQo+IExpa2UgSSd2ZSBt
ZW50aW9uZWQgYWJvdmUsIEknbSB1bnN1cmUgdGhpcyBpcyBjb3JyZWN0LiBZb3UgYXJlIGhvbGRp
bmcNCj4gdGhlIGxvY2sgb2YgdGhlIHByZXZpb3VzIGRvbWFpbiwgYnV0IGF0IHNvbWUgcG9pbnQg
dGhlIGRldmljZSB3aWxsIGJlDQo+IGFzc2lnbmVkIHRvIGEgbmV3IGRvbWFpbiwgc28gdGhhdCBj
aGFuZ2Ugd29uJ3QgYmUgcHJvdGVjdGVkIGJ5IHRoZQ0KPiBsb2NrIG9mIHRoZSBuZXcgZG9tYWlu
Lg0KPg0KPiBUaGFua3MsIFJvZ2VyLg0K

