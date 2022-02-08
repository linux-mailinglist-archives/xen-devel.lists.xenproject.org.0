Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CE84AD2C8
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 09:07:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267647.461389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHLWj-0003Qb-RO; Tue, 08 Feb 2022 08:07:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267647.461389; Tue, 08 Feb 2022 08:07:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHLWj-0003Nv-OB; Tue, 08 Feb 2022 08:07:05 +0000
Received: by outflank-mailman (input) for mailman id 267647;
 Tue, 08 Feb 2022 08:07:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1FiY=SX=epam.com=prvs=40383cc40e=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nHLWi-0003Np-Cg
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 08:07:04 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 179122a4-88b6-11ec-8eb8-a37418f5ba1a;
 Tue, 08 Feb 2022 09:07:01 +0100 (CET)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2187LXe3005776;
 Tue, 8 Feb 2022 08:06:58 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2113.outbound.protection.outlook.com [104.47.18.113])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3e3m2cg59s-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Feb 2022 08:06:58 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AS8PR03MB6853.eurprd03.prod.outlook.com (2603:10a6:20b:23e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Tue, 8 Feb
 2022 08:06:54 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77%3]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 08:06:54 +0000
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
X-Inumbo-ID: 179122a4-88b6-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dGhhjEl03bpK8yDFzAnWTrz5mCFThOW7Ey22Boue175fXNsO5yMJxuYAiibwucOrvxsuRVahPbkZ0KkJRW8WLKlUGRoqk8B6rsgwEC333HFlgcgXAoLesWMNxadwPnCJSyF3eMRfqtEzkZ6y/NXdERghacKUEq2y8r8gfsG3J3FZxX12wgGN3sZdJnSQ/RKFd1qpZl3NKZdOPCiWIl95PdOvPpTWhVhYHgcV3zNAKn/Jel56cTM/EG6CNn/XwBQU9+XJP/y3mooJ4NV8iM7+1nZr0jbd8l7FU+n8YQgq6qwm50kawBN9ifH2J7vjxaKjwCw1YJtzZEIj1xdw/xT3gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WOppeeF7lJW9AgRbC1oJFoap/cAQXccHD6FCmvHzk7g=;
 b=UD++qDNa1+6QxezPjVfGc5I8E6djBpCwchUN4+x/woEabW/6LITQANhShbwul1jqVwlESa1n0Onf9aeI7q3Ab1fsZh+gEGYuSZg3mISd2gSSPSsrOinuFuU5r3dMiyasOQdCQyE8qdfSP4VS7cBrAueuST0P5gAbx/TbDj6niD5EJN2lmFCo+htikjS4deHnuITcXw3kGficjCEyKe9Bx3I7ksc+QXtrBqDzh2PSePCc6ttnVlLpcJoJ2H+wZTINqrgs+fYtJuZ9sF0V9NaVEpWW/S5aZYUs1PvtPT0UR+SWrBf0ISP27eoWUFKO3gaH6skGlXo3G9YZCgF6eRKs7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WOppeeF7lJW9AgRbC1oJFoap/cAQXccHD6FCmvHzk7g=;
 b=L7rs6cRpy4a8DQGTyKxeFykw57NnTZbNybbj6NbRFZTQ/cd20TvB5BjaX0hTe6Cj0C2VOKyRKSy3NbOsH//LT2bnrzs41okLjoYopN6nR9InxpFrblfLcNPGmUmTz5v/6Qrb7TKw60qja93fRzWrWj8+k2g8bZ/Lm2bPwpbh2fhHYCRfsvOgWjeWGfrQbP/u2cEd4/3CnP3YLZCG/irwCHkdHDCClYElnoy+keb+Pa8apHsGn6wYlBBEUWNTvzkK84OzqSpg4l+uAU8y8GQygv2I4bhiPFAHuSuGdaV0cjndAdFMCKoarpfHW5psDOpe1wPwj4C/ILvDgC4IdJpd1Q==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>,
        "paul@xen.org" <paul@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v6 06/13] vpci/header: implement guest BAR register
 handlers
Thread-Topic: [PATCH v6 06/13] vpci/header: implement guest BAR register
 handlers
Thread-Index: AQHYGZFd6D+qnME8W0+wTH+v8YZ8DayIVt4AgAD7qYA=
Date: Tue, 8 Feb 2022 08:06:54 +0000
Message-ID: <66992013-f438-246b-451d-d96f6eea22c0@epam.com>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-7-andr2000@gmail.com>
 <61d85343-9a37-6409-449d-a662ae5258c5@suse.com>
In-Reply-To: <61d85343-9a37-6409-449d-a662ae5258c5@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e97eb72d-50c9-49a4-8cd9-08d9ead9f860
x-ms-traffictypediagnostic: AS8PR03MB6853:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AS8PR03MB68530D910C75B79ACE7D0793E72D9@AS8PR03MB6853.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Gp5VNZHkHpTd3ayonkU7Csq1GC0zRaUYLvenyhTjWD+AJzx6O5/q8QYvxzgEi1QUiQg3dIox/EMKdM/Z3WL0AYf7ZUurF9MnRIi0Kn7M6iBKDM86y18ZqCxOhCsft/YMWfdRt3RL7gzcwUczLYmCi/kNwjJn+UoZyLkOx76wGMrjndFchoeDbj56W3b9KdWEPRtUw64XilwHF7gYYnefYou1LguRkkvnFzNd8d/oUPMi6WotJkDicSyAQET0ic5EYNaMPayPlpOqYf+UpzdtVYtfi7TWfFuNAs90Ec95zw6CaPnkNrcTtmbAFZ/U1yGFx+B1jrj9LxWq/ZMaX7l+ka7Jl/2ZDBCmMsEb7HSIuHcVikB3JAovdIzz/8uwT4w+/OOavz6B88B6eAAL5fi5m1rIj+LZPRFJwH7p6A+BteqZQA9fuG7sXJDtQP4O9DDdtw84tAL8xqsVhYe7bd9v4+KlJEwEs+siqydD/XeuLNUCO8TgRqdfGWvLlD7RhT9j0DFX/6LXwNg7ZL6OshS6b6mopJ9y09GHE+4Foy7J2gFnQTU7vGxfTAupzNGiJMYFhLyHm3xuLnV/GZU1WY2xjnvLlYua+miJauleWjSmaHAqOrw3Gbv37framXI/0zpy1KMfDIqkonQ5iDYjPAS1k/SccDjb/7jxbusUsJPKHiCFQORJk20TdfRfERRew7QFyqlvJS8zLMhITg77LMFHSuqdx8+clqwqpV2M7dYn5yZ57gYCcS6FnN+GB60P12LQ
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(107886003)(26005)(31686004)(53546011)(8676002)(36756003)(64756008)(6506007)(8936002)(76116006)(66946007)(91956017)(6512007)(86362001)(508600001)(83380400001)(186003)(66446008)(71200400001)(66556008)(66476007)(2616005)(7416002)(5660300002)(31696002)(4326008)(54906003)(316002)(2906002)(6486002)(55236004)(38070700005)(122000001)(6916009)(38100700002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NUpuVTlUNW56RGRDZlAzb0wvajVQS1hHS2lTLzdOcXhwM2hJaGxFWEZqYmw1?=
 =?utf-8?B?bTZpcnV1Y2hCSy9rY1NqZjZXOWEvZi8wUWt5VjdNRE1JRFNnZ0l4SDVSTURC?=
 =?utf-8?B?dEZucTRtb2tHNjV0NFMrRTF4SE8zNXFyUG9LUk9oNDNSQi9aSm55WnJrNU5y?=
 =?utf-8?B?S1pTM3NDZ2ZBMHpLTlNvOWVUME51TjFRcDJsZG5jVFd6Y2QzWW1LbVp6YTla?=
 =?utf-8?B?OU9GTjVCYXU1SGJ3SHdjMmNPakp2cVFHQnJxT0s1Q2ViclFpWXNudU53Zkd3?=
 =?utf-8?B?RUJrdWJqWjBtV290emc1OGR1WjJhZWV6M0FKMnkwQnZ0aWpUU2pUZWZncG1n?=
 =?utf-8?B?MWRsdFV6WHNab1p5M0ZTUlk4RDJ3TytsTC9sSnJ2TEI2MEpkSE9ZRGNBZzk2?=
 =?utf-8?B?Y3BCNjhsUXoxYktzWTFMdG9zN2hpdGZicUZCTG1taHk2WkY3eEQxMG5lUXQ3?=
 =?utf-8?B?bXBYVkV6L21FNmdaOHZsb2kvVnRVbGkvN1kzNjZtQm9qQ09iQlZBRldidWhK?=
 =?utf-8?B?cDA2STlrb3gxSkdyL25GRGxVM3M0K3J5MXpRUmh3QmpscXJiUlJFQ2ZLNXhN?=
 =?utf-8?B?NXNnWEIzcm9pVzdZcUJrUGtDcUo2WFg0RHptU1RQUkltNWk3R0tMdHp3Rncy?=
 =?utf-8?B?bDc5YnNPTDlBL2l6TnMxRnhrMDJHOGR2S3ZtT1h1a1Fkamh2ci80UDVVQlNC?=
 =?utf-8?B?cm5oOG15SXZhK25PWTU4M3FpbWhGQWo0dlQwdzJRSkJvQWxUOGsrbzZpWjVR?=
 =?utf-8?B?TW11T3VTS29aVXM5bkRUNDdwUU5raXFubXRWOTdZbkhaazBaLzgxNHk1N1Zw?=
 =?utf-8?B?N0l1bDFtcGgycTk2Sk9Td3g2aVVVZVppTFdpKzBHYUtzbElWMFBtN1J5MU43?=
 =?utf-8?B?SytQT3FKaEwwbkJFNFczandZVnlhbjU0TGY4eXpHa3VIN0xVZDU3OUFnZjFm?=
 =?utf-8?B?eUIzd0ZzeUp1ZDNBbERpYWltcmRFbzU3d3R1Qmw1S3RUb3Vzeks2ZVdrNTE5?=
 =?utf-8?B?MzNOVU1udzVkY1FUSVJqZDhWYk9CUUtlcG5xR2dmV2ZFbUFtd1pXQUQvbjlZ?=
 =?utf-8?B?R3lOQmd5Nk9meDZvVXpJNk8zd0NYYzJtbXdwQjRqZTljMThqNWc4NUI1bVNY?=
 =?utf-8?B?VkdDSzFzZFk3TkZGdlFNNFdYck1yN1VMMXBvTHVrSXpXbVlISVo4U1RLSlpS?=
 =?utf-8?B?OUZiZ1hxSWZId21yWndGN21FSXJWay8wRzVQZnIrbFRBVmdVYlBVWU16eFNI?=
 =?utf-8?B?M3JyS2NKSWJCaEF0QlcwdUtMSWJ4UWNNSHZjekZpODIzRXNBSDdKVnNPaHNZ?=
 =?utf-8?B?bk0yTWl1bDF0Q25wZHA0RkxDVjIwRlZ1WXVOeEpYMDdKTTZXcHBLV1ZvVXE0?=
 =?utf-8?B?TXU1SStMVFlaVmw3OCt1ZkxLN2dQMjVWSFNpQ2E4WlRSZjZ0R0pDcE1xbnV6?=
 =?utf-8?B?TU1RZUdmc0pJbEVOQ1RDM3N6eUU5VzBURjVoTE8vOWRaVFFLNXdNaEZxUDJ1?=
 =?utf-8?B?S3hlOTFOTVNaVjVObURVWE9zcFVnQkxSOFRZZDNLMENQU0JZeTFsR1NMeXFi?=
 =?utf-8?B?QUJ5YWJJSStydVF2Q3ZsSUs4WTVKVzMyUENPVU5UUy9RNTJucjQwbldFa0Vr?=
 =?utf-8?B?S0kwVlJWSnIyZXNSTXkxYUhxemdPZXBYbnVqQkNRdkVRN0xjVmRlZlRNRFYy?=
 =?utf-8?B?L3ZHYXB3d3BPZTlhTXJudDdSeGxzaWlIanpPV3hGa2JSRzNjRzdQVjRMcWdD?=
 =?utf-8?B?aWhzdjdVVlJRMFB1bmFqczlGTXZlTFg3YXpUMkNzOFlENzdaeVZkaXduaEJw?=
 =?utf-8?B?UW4wR0hMTkJ2dXN6cnc4ZXhOTEdNN2ZvQTJ2OTZ6VU9hb2hsMlljdHE5Wmk4?=
 =?utf-8?B?VzJDWUdjbm1UZjRQZDNLcTcxUm9CM1hTbEhSb1JFckQ2cVplN0dqdFdZTjh2?=
 =?utf-8?B?QTZuMFVMZDVBSWVSc3Y0Y3ljdE1oM0FqSUw2QXV4R3pvMzN3QjQvSkhreFNi?=
 =?utf-8?B?eWZ4N3V0dk91Um9tT29tMHJHa21NbWdZRlI3MGJSZ3JzMXdiUlE3VEd5TE8z?=
 =?utf-8?B?WktyOGtQV3BvNEt1NGc5L005cWU3elZidGNHbjEwVzFiZllmTUhwdGxKSzc2?=
 =?utf-8?B?UDVkZWJ1NHFTaGVoL2Fwa2tuQ1NWTGcxNEhvRC9qWTBneFdIWEliNjloRjlL?=
 =?utf-8?B?cmhpMVRvVys2MGtCM1JOejRiVjdjcWpIRjJ5ZjVMcDQ4UG40S2MxY2ZKdU5I?=
 =?utf-8?B?TWIybmJUTlVhSWxhS1k0SDhUSDNHSkVXRnhtSFMzTC85QjVZd0VJQXFsMXow?=
 =?utf-8?B?YVNqY01ja05Zb0lubm9JV1FxdFREM1NFNE1Cdk44dFd4Mm45cG9pcU13MkxS?=
 =?utf-8?Q?YV2o1t36MRa4Df2s=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FBF4676D0F96FA48A371CF7F443F69CA@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e97eb72d-50c9-49a4-8cd9-08d9ead9f860
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 08:06:54.4109
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WoCL5v/RDnGFP8Cd9OVs1s7YT9PBmqmHW0aD+pLcNOpSwpcT0Vpa3zki8fnyO9m6LTmGKxqMoqFBkPazwTGf85T8jNRE6avK7Yx/ySlzGmNeIlv55jLVBYJBhHh5LPxz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6853
X-Proofpoint-GUID: 2QKAIB8pUn5Ls55dh079If4wnwX5yq1C
X-Proofpoint-ORIG-GUID: 2QKAIB8pUn5Ls55dh079If4wnwX5yq1C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-08_02,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 mlxscore=0 malwarescore=0 spamscore=0 mlxlogscore=976
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202080043

DQoNCk9uIDA3LjAyLjIyIDE5OjA2LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDQuMDIuMjAy
MiAwNzozNCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiArc3RhdGljIHVpbnQz
Ml90IGd1ZXN0X2Jhcl9pZ25vcmVfcmVhZChjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldiwNCj4+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCByZWcs
IHZvaWQgKmRhdGEpDQo+PiArew0KPj4gKyAgICByZXR1cm4gMDsNCj4+ICt9DQo+PiArDQo+PiAr
c3RhdGljIGludCBiYXJfaWdub3JlX2FjY2Vzcyhjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldiwg
dW5zaWduZWQgaW50IHJlZywNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVj
dCB2cGNpX2JhciAqYmFyKQ0KPj4gK3sNCj4+ICsgICAgaWYgKCBpc19oYXJkd2FyZV9kb21haW4o
cGRldi0+ZG9tYWluKSApDQo+PiArICAgICAgICByZXR1cm4gMDsNCj4+ICsNCj4+ICsgICAgcmV0
dXJuIHZwY2lfYWRkX3JlZ2lzdGVyKHBkZXYtPnZwY2ksIGd1ZXN0X2Jhcl9pZ25vcmVfcmVhZCwg
TlVMTCwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZywgNCwgYmFyKTsNCj4+
ICt9DQo+IEZvciB0aGVzZSB0d28gZnVuY3Rpb25zOiBJJ20gbm90IHN1cmUgImlnbm9yZSIgaXMg
YW4gYXBwcm9wcmlhdGUNCj4gdGVybSBoZXJlLiB1bnVzZWRfYmFyX3JlYWQoKSBhbmQgdW51c2Vk
X2JhcigpIG1heWJlPyBPciwNCj4gY29uc2lkZXJpbmcgd2UgYWxyZWFkeSBoYXZlIFZQQ0lfQkFS
X0VNUFRZLCBzL3VudXNlZC9lbXB0eS8gPyBJJ20NCj4gYWxzbyBub3Qgc3VyZSB3ZSByZWFsbHkg
bmVlZCB0aGUgaXNfaGFyZHdhcmVfZG9tYWluKCkgY2hlY2sgaGVyZToNCj4gUmV0dXJuaW5nIDAg
Zm9yIERvbTAgaXMgZ29pbmcgdG8gYmUgZmluZSBhcyB3ZWxsOyB0aGVyZSdzIG5vIG5lZWQNCj4g
dG8gZmV0Y2ggdGhlIHZhbHVlIGZyb20gYWN0dWFsIGhhcmR3YXJlLiBUaGUgb25lIGV4Y2VwdGlv
biBtaWdodA0KPiBiZSBmb3IgZGV2aWNlcyB3aXRoIGJ1Z2d5IEJBUiBiZWhhdmlvciAuLi4NCldl
bGwsIEkgdGhpbmsgdGhpcyBzaG91bGQgYmUgb2ssIHNvIHRoZW4NCi0gcy9ndWVzdF9iYXJfaWdu
b3JlX3JlYWQvZW1wdHlfYmFyX3JlYWQNCi0gcy9iYXJfaWdub3JlX2FjY2Vzcy9lbXB0eV9iYXIN
Ci0gbm8gaXNfaGFyZHdhcmVfZG9tYWluIGNoZWNrDQo+DQo+PiBAQCAtNTE2LDYgKzU5NCwxMSBA
QCBzdGF0aWMgaW50IGluaXRfYmFycyhzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+ICAgICAgICAg
ICBpZiAoICh2YWwgJiBQQ0lfQkFTRV9BRERSRVNTX1NQQUNFKSA9PSBQQ0lfQkFTRV9BRERSRVNT
X1NQQUNFX0lPICkNCj4+ICAgICAgICAgICB7DQo+PiAgICAgICAgICAgICAgIGJhcnNbaV0udHlw
ZSA9IFZQQ0lfQkFSX0lPOw0KPj4gKw0KPj4gKyAgICAgICAgICAgIHJjID0gYmFyX2lnbm9yZV9h
Y2Nlc3MocGRldiwgcmVnLCAmYmFyc1tpXSk7DQo+PiArICAgICAgICAgICAgaWYgKCByYyApDQo+
PiArICAgICAgICAgICAgICAgIHJldHVybiByYzsNCj4gRWxzZXdoZXJlIHRoZSBjb21tYW5kIHJl
Z2lzdGVyIGlzIHJlc3RvcmVkIG9uIGVycm9yIHBhdGhzLg0KT2ssIEkgd2lsbCByZXN0b3JlDQo+
DQo+IEphbg0KPg0KVGhhbmsgeW91LA0KT2xla3NhbmRy

