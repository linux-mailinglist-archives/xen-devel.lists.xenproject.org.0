Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F80A5F7929
	for <lists+xen-devel@lfdr.de>; Fri,  7 Oct 2022 15:44:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.418014.662779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogndu-0003cI-4Z; Fri, 07 Oct 2022 13:43:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 418014.662779; Fri, 07 Oct 2022 13:43:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogndu-0003Zw-1W; Fri, 07 Oct 2022 13:43:58 +0000
Received: by outflank-mailman (input) for mailman id 418014;
 Fri, 07 Oct 2022 13:43:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7mFU=2I=epam.com=prvs=2279168535=oleksandr_tyshchenko@srs-se1.protection.inumbo.net>)
 id 1ognds-0003Zp-DX
 for xen-devel@lists.xenproject.org; Fri, 07 Oct 2022 13:43:56 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14ecc8ac-4646-11ed-964a-05401a9f4f97;
 Fri, 07 Oct 2022 15:43:54 +0200 (CEST)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 297C3Ctd026667;
 Fri, 7 Oct 2022 13:43:49 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2106.outbound.protection.outlook.com [104.47.17.106])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3k25xujtg0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Oct 2022 13:43:49 +0000
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com (2603:10a6:10:ed::15)
 by PAXPR03MB7665.eurprd03.prod.outlook.com (2603:10a6:102:200::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.38; Fri, 7 Oct
 2022 13:43:45 +0000
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::93be:22b1:654c:e4bc]) by DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::93be:22b1:654c:e4bc%5]) with mapi id 15.20.5676.038; Fri, 7 Oct 2022
 13:43:45 +0000
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
X-Inumbo-ID: 14ecc8ac-4646-11ed-964a-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dHgYzhxgM9JFR738bbFdoLHdspKOqdBZtbUGkRQ44V08mNVA62c9tT7uaVdLVkjO9cfAOss9xnnKIe2U2f93VzcR2ZvrFjmHuqfvq2wGLVb01EFm0X9pdsFGjWFSseCHHK0nnvOivdASzxJkjIjrODpgXQ2AKn4ACX2assPa4svZq6SqiTBY/XnIwtdobmkKCmEEbvY76Y6XBQG1B0t6BbwrhQrI0KpJ5URP6Lm/iWXw0RCQmwH3tiZtOlsxw6FRX1Dt3KEveD/3+PhQtCa7RMkkjs8J4j+0LM3IseHTBCqLfJcc0T9V26Q6y8Y0cd68jAGaqeOHClrEeBIbXmg0VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ageGqafa2WfV5KWzPOBPd1p7qRBtGi7E0NIei/wk7e4=;
 b=eMuyOYcB93e2pQg+f7QzG/qRCUeegVT49W+8QIG339+x2uzZqeq9NVr6GiaMWeoFQPYNknvRJncA7rhBODa+6CiH/r2mVHHQ+XSKpSYm71kXRtBSnGmnYAtjilixHKJK8b07HKILVHkFmA4LAYiRTJ3FOa27egWQ+7VgW4/lT+FVxgdldUTpNTygK0L3v/yA0b1VuP0p4bNA1TvIJvsq7mc8OzT7taEmrM9PKUpDmNzsziw+MU2fSioCInIwp9Byf48SYmcmRlKolF7MV9+dGDfJTAmcjqFUI/xKFIePwQJP+TAnJi5Cc+kwprmrm004VY6MrWBWgcgeDlbuEWvSPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ageGqafa2WfV5KWzPOBPd1p7qRBtGi7E0NIei/wk7e4=;
 b=CKbeiYnQenb8UVjerRHczp8/GNLx+YzCd0To3k03m3obP27Vmi0CQmZ60fRVD72zcubpYAPfrrFNaUqnX5gYwTxnAx0m2oVDaNmevFsiNe8VcJk2xsUTzgQGya5Xk8LlgQHbuoKAyFQjs2T/DuVNV69W5fp1Qedajk+n1VZAIRl4AY48ICegYesHNYFfvY9fG4hgP1sAnwnKn5lKeERulVoAztJLqnl/FxeIHnVy7x6srt3C2RSN4bNpStBOL513TmCNIllGRSDdG9FUhmWo6tutciLyQvPb9nTvzsAnGoktwmko2vCCaudgrahXKmfLZQaLHipl8pzLDuhNcSk/Zw==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: Xenia Ragiadakou <burzalodowa@gmail.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: Stefano Stabellini <sstabellini@kernel.org>,
        Juergen Gross
	<jgross@suse.com>,
        Oleksandr Tyshchenko <olekstysh@gmail.com>
Subject: Re: [PATCH] xen/virtio: Convert PAGE_SIZE/PAGE_SHIFT/PFN_UP to Xen
 counterparts
Thread-Topic: [PATCH] xen/virtio: Convert PAGE_SIZE/PAGE_SHIFT/PFN_UP to Xen
 counterparts
Thread-Index: AQHY2Xx9ME9woenUJk6IqJF2QACToq4Bp86AgAA2I4CAAKgkgIAAbJWA
Date: Fri, 7 Oct 2022 13:43:45 +0000
Message-ID: <816da52a-f646-c114-fa6d-9320152a0e79@epam.com>
References: <20221006120912.1948459-1-olekstysh@gmail.com>
 <96a16b32-0950-b538-65e5-9955ed8cc529@gmail.com>
 <b3b8047e-b4a5-1e75-2a55-a7beecf8ca7d@epam.com>
 <7f54bdab-c68f-0d38-93f4-007408151f01@gmail.com>
In-Reply-To: <7f54bdab-c68f-0d38-93f4-007408151f01@gmail.com>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR03MB6108:EE_|PAXPR03MB7665:EE_
x-ms-office365-filtering-correlation-id: b187242e-f9a0-480d-9051-08daa869f4c0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 jlwQKT5UaCRqtrz86xToFAsjtG+GWxXGEdfLzurWJtXHTeItKDHdWWh35ofqElXpSJDbu//61R+BVO/VlXj6ovGz9O/SP0ajeKh2OXgTbXLSwbuTErB3AfObNYaryK00MF+hbaBx8LC8KVT8q5JaeudAiPMio2qjk8ilK1V3e12tTLr/xs8OiNGqcZCg+zl/glWjH12LyEjl7A/zb7ZiVdYRhGv9R2ERDOJhUvjWGqTFpEiCxaOAqBBO7P6NhLs0tVW1Nb2i8k9HR+u/zd0BYuIpftJXPwL4Z9Srg4GhH/oHhGaOyM0WZPmh0vWN/rNhGsq4CHJyF1PNIgeWhe2uQraz0ISYCSvojAj4gItrG+P2Ko8mr7QKOECkGQjp1qqmfDyztKAxixJG/Zrowp7kIdZ3rRFvKMUx4qaCOyocBu+uAWN9OL3IF025YEpsx3Dl1cOp0ACRpzsGZ1WO/kakHEyF7TKs5LYuSb9VlwuKTZ3dqldnl1O62MQvjNFV8hG9Z9B+IQd6+D6Yvj5lVYH0jEL/Msoy9qZ0dBZ4kMNxrymW9yyffVu3+EqKZqbjoAEUKHZTlqNRHqa5tk8FWbkN58CDkVDALJSalinQVYOAUdHS4E2bWtMvLtZdDx99x3jzxgIAS8r5JBHxeuz8mbavyagBL/pPbJX2Ou9aYJCI/LHRMb7qPCMUW6vLpjhWZCeZYi94s+T3XJHoXvuq6ZMY4yfBNh5i8HaczO+X/w4MJngLgySNrg62xE6CHHmgNFhpUbfHy5Mnjq0x/YwSVCjsZc74ITpg23uxl+noZk5fTKMefMOPkxxr7ITweeCTcF4aPnf5YSWl7UYnKSibNyXIOA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR03MB6108.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(39860400002)(136003)(376002)(366004)(451199015)(5660300002)(66476007)(8936002)(36756003)(2906002)(66556008)(66946007)(66446008)(4326008)(8676002)(41300700001)(122000001)(76116006)(64756008)(31696002)(38070700005)(6512007)(38100700002)(6506007)(26005)(86362001)(53546011)(110136005)(186003)(55236004)(2616005)(6486002)(966005)(71200400001)(478600001)(54906003)(91956017)(316002)(83380400001)(31686004)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eUhmcUZnMXY3a1VIM0V3bHZQbVhCV3BZTm4yRW1Cb3NjV2VtSEZnMVlJVlN4?=
 =?utf-8?B?KzlKQWVWOUNrcjkzRW5HUXFmYUtWSHNLelhUdDNTOVpaZ1EwOG1VMFY2b0RO?=
 =?utf-8?B?MWUxY1I3ZVYvVFM5MjdlRFllb3Z2ejQ3QlFGd0VxSmQ2MklISzJpWXViQXRr?=
 =?utf-8?B?MThxYzJTaTBnU1JxdnBDZTdsd2lTL2JsbFVsbGwwMlM5ZmVzRTRsSlcwMVZB?=
 =?utf-8?B?UnN6MlJLZHhPZ1REOGswY0g2U2ZuclpYeURBTCtEVW9tUEZjbi9QOGlGM3Z3?=
 =?utf-8?B?Z1F2a0NHaXVkTWdaODc3Rk9jS3p5ZTNxYmhtUjQzeG9rN3d0QTBLZVVnYVB4?=
 =?utf-8?B?eGQxQUdxRldaVnZWL29VOVdvUmg1Q1hyeFNQRFQ3MmcySUdwbDQyb2QxQUdR?=
 =?utf-8?B?K0NJR0JkZnIrdHlROTlEN1Z1SGtXaUtRckVKQmlPUjcvQVRjUGdKaG1MOWp2?=
 =?utf-8?B?UThPQWZuekl6YUx6RWE3RXZuNHd3aEsyYUlsSFQ1NzdEazRPK01BZnh3NHpX?=
 =?utf-8?B?eVZ3aTBsL1B3dXh2RVVXcll1dzhHazN1eUdDVmFLRW82U0Mva01OQWYyUGpU?=
 =?utf-8?B?blpMbXNxTkU1RFBCUUpMZGlDZkZPRXk2QlZCMGFyVVd1VGhiOHA4Y3NUUStJ?=
 =?utf-8?B?SkRJN1pkVU1xVGx1REZjb09GdUx0OEZSaTVhcXlvODljZlE4R3JuaDN4REZO?=
 =?utf-8?B?bGxvazF4SDl6VXpWTldFanBzWDRlYU5QZk04WVc2dVV6RTRvWGhnUmhZaERv?=
 =?utf-8?B?KzF6dWpJMGo2TElKNytPUFN3SmU1RndadWhRSjdvNGllMXhqKzFoMmEwb3pK?=
 =?utf-8?B?bTdEL0lMWUpFcTBjTXJFQjdIN1dUbHlQL2xpMFJ0VHJJd05mRG9UVXdpUC9G?=
 =?utf-8?B?aEFFVnM5WDlRZnJ1K1B3SlUxbXN1Ti92aU9QdHlGak4rN1pqTGNVRkxSaS8v?=
 =?utf-8?B?R2l4WWRqWGNLd1ZOcVlheGJHR2V0TnJzb1pNcE5LdXVpVk1qai9mTmNQblhV?=
 =?utf-8?B?NXBLNElqckNLZStBZEY1YTRML3V3V05qRURzN3NDeGUvUmp4S0NWNyt0cnR5?=
 =?utf-8?B?Q0tzYU4ybXdIOUsvS2NrZ3BHRmJQVy82aEJaTzVPNEorYjlFRS8wSmRnYTBq?=
 =?utf-8?B?NjQ3ZllrM0tjeFQ3dHd5aW9OUXBOWU5Vais2U2ZKdDZyQ1YwRi94VFRxSzN3?=
 =?utf-8?B?clpNOHY1WUgrUnJiUE8vcGFTblBtc2UxNmJXcjRTZzkweUpleEF5Sk1pZU9Q?=
 =?utf-8?B?UFFpd3ozMGdwakRwUkVDN0tCYTNsaWtQQmxxSi9PSDJLQTIrMVpEeStFTUsw?=
 =?utf-8?B?clN2Z094a2JHQlFmODNzRXp0R3JSRUFZRm1ucDc2OFlEaUh0VERnYlZXV0Rv?=
 =?utf-8?B?Snh5RTNtTmN6bmRlMDR5OHAvS0FXQzB2Zmc2clpZUFVEWi9uTTRJaU52a2VP?=
 =?utf-8?B?WmMzNFRvUS9BVU1lbU1nZmRFYW1tUmZOQXM3YytYOUoxOWwvODQ4ajN6bHhF?=
 =?utf-8?B?bXRFUmpsUW5rc1RTZitWODdBaWZZQVUzbnQ2WjZTUG41TmVqVmZ0NEFsUUtH?=
 =?utf-8?B?NCtOZDBROSs0bkZsdUtjeXVzb2VnWVg5NnB6VUgyWlkvNDFZTWdOdWgzTXhn?=
 =?utf-8?B?elBiUTQzMDVUdVp4RlFzenlaZG5paTBxamlpQzhlU0pKS0hzQjhNZWJHeWti?=
 =?utf-8?B?SlA2MHNlZnQzaytEUEhNVFZqcUlZUEhseHBoWEprS3YrQmlDaGRrQTkybTRX?=
 =?utf-8?B?aFFxNDBMMEcyUzY1dS94c2s4U2VDOVNyVVF1OXJKNkhtcnExUWx3ZTNzSU1R?=
 =?utf-8?B?Yko1NThmaHJ3WG13aEpjbmJDMFM1Q1YrVDdWaWNkMnFncG55WTJtR3RvTXo1?=
 =?utf-8?B?Z09sZDBxS1ltWHJoVnl1ak5pZVV0RjM3MzMxMHdmNlIwTFM1akRhS3U4N3V6?=
 =?utf-8?B?c0N1b2VHbkZIMHNMZEFwaGh2eWNxNDh4RUpodVNESGhLVG00Z3ZzVWtxT1dt?=
 =?utf-8?B?QTVvaktBSFlCVlZaOThFY3gwa29LdU4rYko2Uk85d2hscUxqaHZSODdxNmxj?=
 =?utf-8?B?bnA3VEZ1b0NSNzZiV3NwVmJDOXFjZ2JOWmlnTHh4bm5XQVF3OGNlOFExVC9F?=
 =?utf-8?B?LzZCYzhHdjBBd3lhSUovZzJqb0ptZFR3UDNERnRpUEJxd0E5LzI4MTdBM3c2?=
 =?utf-8?Q?O5DGyhy//ZdVfdd2JRsGojI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6DDCF0E2747369479AA8C31F2EBA0B63@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR03MB6108.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b187242e-f9a0-480d-9051-08daa869f4c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2022 13:43:45.7170
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4CcHGLOMN1PCUmsK1Qy/pqDHcrQ+pxNtZiZNFWvxvnAjGgMgR3MDfrmfOyTxuCDTjW0hMiQ8B8WYVgrQ4lPhoBzXSFQ2khMy6UGbgxC3zuI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7665
X-Proofpoint-GUID: -GWXMvlHkov0-YrL2Wli5m05ssVUlkpa
X-Proofpoint-ORIG-GUID: -GWXMvlHkov0-YrL2Wli5m05ssVUlkpa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-06_05,2022-10-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0
 mlxlogscore=999 mlxscore=0 phishscore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210070083

DQpPbiAwNy4xMC4yMiAxMDoxNSwgWGVuaWEgUmFnaWFkYWtvdSB3cm90ZToNCj4NCj4gT24gMTAv
Ny8yMiAwMDoxMywgT2xla3NhbmRyIFR5c2hjaGVua28gd3JvdGU6DQo+DQo+IEhpIE9sZWtzYW5k
cg0KDQoNCkhlbGxvIFhlbmlhDQoNCg0KPg0KPj4NCj4+IE9uIDA2LjEwLjIyIDIwOjU5LCBYZW5p
YSBSYWdpYWRha291IHdyb3RlOg0KPj4NCj4+IEhlbGxvIFhlbmlhDQo+Pg0KPj4+DQo+Pj4gT24g
MTAvNi8yMiAxNTowOSwgT2xla3NhbmRyIFR5c2hjaGVua28gd3JvdGU6DQo+Pj4+IEZyb206IE9s
ZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNoZW5rb0BlcGFtLmNvbT4NCj4+Pj4N
Cj4+Pj4gQWx0aG91Z2ggWEVOX1BBR0VfU0laRSBpcyBlcXVhbCB0byBQQUdFX1NJWkUgKDRLQikg
Zm9yIG5vdywgaXQgd291bGQNCj4+Pj4gYmUgbW9yZSBjb3JyZWN0IHRvIHVzZSBYZW4gc3BlY2lm
aWMgI2RlZmluZS1zIGFzIFhFTl9QQUdFX1NJWkUgY2FuDQo+Pj4+IGJlIGNoYW5nZWQgYXQgc29t
ZSBwb2ludCBpbiB0aGUgZnV0dXJlLg0KPj4+Pg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2Fu
ZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+DQo+Pj4+IC0tLQ0K
Pj4+PiBDYzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPj4+PiBDYzogWGVuaWEg
UmFnaWFkYWtvdSA8YnVyemFsb2Rvd2FAZ21haWwuY29tPg0KPj4+Pg0KPj4+PiBBcyBpdCB3YXMg
cHJvcG9zZWQgYXQ6DQo+Pj4+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2xv
cmUua2VybmVsLm9yZy94ZW4tZGV2ZWwvMjAyMjEwMDUxNzQ4MjMuMTgwMDc2MS0xLW9sZWtzdHlz
aEBnbWFpbC5jb20vX187ISFHRl8yOWRiY1FJVUJQQSF6SHQteFpfN3RaY19FTTZ6dmEyMUVfWWd3
SWlFZWltRldmc0pJcFB3QXUtVEJjbnpRaFhIcWxLem1YbXdJY0k2dUl4X2FySE5aaWFaZUh0XzQy
OF84cC1EeU1wZCQgDQo+Pj4+DQo+Pj4+IFtsb3JlWy5da2VybmVsWy5db3JnXQ0KPj4+Pg0KPj4+
PiBTaG91bGQgZ28gaW4gb25seSBhZnRlciB0aGF0IHNlcmllcy4NCj4+Pj4gLS0tDQo+Pj4+IMKg
wqAgZHJpdmVycy94ZW4vZ3JhbnQtZG1hLW9wcy5jIHwgMjAgKysrKysrKysrKy0tLS0tLS0tLS0N
Cj4+Pj4gwqDCoCAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25z
KC0pDQo+Pj4+DQo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi9ncmFudC1kbWEtb3BzLmMg
Yi9kcml2ZXJzL3hlbi9ncmFudC1kbWEtb3BzLmMNCj4+Pj4gaW5kZXggYzY2ZjU2ZDI0MDEzLi41
MzkyZmRjMjVkY2EgMTAwNjQ0DQo+Pj4+IC0tLSBhL2RyaXZlcnMveGVuL2dyYW50LWRtYS1vcHMu
Yw0KPj4+PiArKysgYi9kcml2ZXJzL3hlbi9ncmFudC1kbWEtb3BzLmMNCj4+Pj4gQEAgLTMxLDEy
ICszMSwxMiBAQCBzdGF0aWMgREVGSU5FX1hBUlJBWV9GTEFHUyh4ZW5fZ3JhbnRfZG1hX2Rldmlj
ZXMsDQo+Pj4+IFhBX0ZMQUdTX0xPQ0tfSVJRKTsNCj4+Pj4gwqDCoCDCoCBzdGF0aWMgaW5saW5l
IGRtYV9hZGRyX3QgZ3JhbnRfdG9fZG1hKGdyYW50X3JlZl90IGdyYW50KQ0KPj4+PiDCoMKgIHsN
Cj4+Pj4gLcKgwqDCoCByZXR1cm4gWEVOX0dSQU5UX0RNQV9BRERSX09GRiB8ICgoZG1hX2FkZHJf
dClncmFudCA8PCANCj4+Pj4gUEFHRV9TSElGVCk7DQo+Pj4+ICvCoMKgwqAgcmV0dXJuIFhFTl9H
UkFOVF9ETUFfQUREUl9PRkYgfCAoKGRtYV9hZGRyX3QpZ3JhbnQgPDwNCj4+Pj4gWEVOX1BBR0Vf
U0hJRlQpOw0KPj4+PiDCoMKgIH0NCj4+Pg0KPj4+IFdpdGggdGhpcyBjaGFuZ2UsIGNhbiB0aGUg
b2Zmc2V0IGFkZGVkIHRvIHRoZSBkbWEgaGFuZGxlLCBnZW5lcmF0ZWQgYnkNCj4+PiBncmFudF90
b19kbWEoKSwgYmUgdGhlIG9mZnNldCBpbiB0aGUgcGFnZT8gQ291bGRuJ3QgaXQgY29ycnVwdCB0
aGUNCj4+PiBncmFudCByZWY/DQo+Pg0KPj4NCj4+IEdvb2QgcG9pbnQsIGluZGVlZCwgSSB0aGlu
ayBpdCBjb3VsZCBjb3JydXB0IGlmIGd1ZXN0IHVzZXMgYSBkaWZmZXJlbnQNCj4+IHRoYW4gWGVu
IHBhZ2UgZ3JhbnVsYXJpdHkgKGkuZSA2NEtCKS4NCj4+DQo+Pg0KPj4+DQo+Pj4+IMKgwqAgwqAg
c3RhdGljIGlubGluZSBncmFudF9yZWZfdCBkbWFfdG9fZ3JhbnQoZG1hX2FkZHJfdCBkbWEpDQo+
Pj4+IMKgwqAgew0KPj4+PiAtwqDCoMKgIHJldHVybiAoZ3JhbnRfcmVmX3QpKChkbWEgJiB+WEVO
X0dSQU5UX0RNQV9BRERSX09GRikgPj4NCj4+Pj4gUEFHRV9TSElGVCk7DQo+Pj4+ICvCoMKgwqAg
cmV0dXJuIChncmFudF9yZWZfdCkoKGRtYSAmIH5YRU5fR1JBTlRfRE1BX0FERFJfT0ZGKSA+Pg0K
Pj4+PiBYRU5fUEFHRV9TSElGVCk7DQo+Pj4+IMKgwqAgfQ0KPj4+PiDCoMKgIMKgIHN0YXRpYyBz
dHJ1Y3QgeGVuX2dyYW50X2RtYV9kYXRhICpmaW5kX3hlbl9ncmFudF9kbWFfZGF0YShzdHJ1Y3QN
Cj4+Pj4gZGV2aWNlICpkZXYpDQo+Pj4+IEBAIC03OSw3ICs3OSw3IEBAIHN0YXRpYyB2b2lkICp4
ZW5fZ3JhbnRfZG1hX2FsbG9jKHN0cnVjdCBkZXZpY2UNCj4+Pj4gKmRldiwgc2l6ZV90IHNpemUs
DQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGxv
bmcgYXR0cnMpDQo+Pj4+IMKgwqAgew0KPj4+PiDCoMKgwqDCoMKgwqAgc3RydWN0IHhlbl9ncmFu
dF9kbWFfZGF0YSAqZGF0YTsNCj4+Pj4gLcKgwqDCoCB1bnNpZ25lZCBpbnQgaSwgbl9wYWdlcyA9
IFBGTl9VUChzaXplKTsNCj4+Pj4gK8KgwqDCoCB1bnNpZ25lZCBpbnQgaSwgbl9wYWdlcyA9IFhF
Tl9QRk5fVVAoc2l6ZSk7DQo+Pj4+IMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nIHBmbjsNCj4+
Pj4gwqDCoMKgwqDCoMKgIGdyYW50X3JlZl90IGdyYW50Ow0KPj4+PiDCoMKgwqDCoMKgwqAgdm9p
ZCAqcmV0Ow0KPj4+PiBAQCAtOTEsMTQgKzkxLDE0IEBAIHN0YXRpYyB2b2lkICp4ZW5fZ3JhbnRf
ZG1hX2FsbG9jKHN0cnVjdCBkZXZpY2UNCj4+Pj4gKmRldiwgc2l6ZV90IHNpemUsDQo+Pj4+IMKg
wqDCoMKgwqDCoCBpZiAodW5saWtlbHkoZGF0YS0+YnJva2VuKSkNCj4+Pj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqAgcmV0dXJuIE5VTEw7DQo+Pj4+IMKgwqAgLcKgwqDCoCByZXQgPSBhbGxvY19wYWdl
c19leGFjdChuX3BhZ2VzICogUEFHRV9TSVpFLCBnZnApOw0KPj4+PiArwqDCoMKgIHJldCA9IGFs
bG9jX3BhZ2VzX2V4YWN0KG5fcGFnZXMgKiBYRU5fUEFHRV9TSVpFLCBnZnApOw0KPj4+PiDCoMKg
wqDCoMKgwqAgaWYgKCFyZXQpDQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBOVUxM
Ow0KPj4+PiDCoMKgIMKgwqDCoMKgwqAgcGZuID0gdmlydF90b19wZm4ocmV0KTsNCj4+Pj4gwqDC
oCDCoMKgwqDCoMKgIGlmIChnbnR0YWJfYWxsb2NfZ3JhbnRfcmVmZXJlbmNlX3NlcShuX3BhZ2Vz
LCAmZ3JhbnQpKSB7DQo+Pj4+IC3CoMKgwqDCoMKgwqDCoCBmcmVlX3BhZ2VzX2V4YWN0KHJldCwg
bl9wYWdlcyAqIFBBR0VfU0laRSk7DQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBmcmVlX3BhZ2VzX2V4
YWN0KHJldCwgbl9wYWdlcyAqIFhFTl9QQUdFX1NJWkUpOw0KPj4+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoCByZXR1cm4gTlVMTDsNCj4+Pj4gwqDCoMKgwqDCoMKgIH0NCj4+Pj4gwqDCoCBAQCAtMTE2
LDcgKzExNiw3IEBAIHN0YXRpYyB2b2lkIHhlbl9ncmFudF9kbWFfZnJlZShzdHJ1Y3QgZGV2aWNl
DQo+Pj4+ICpkZXYsIHNpemVfdCBzaXplLCB2b2lkICp2YWRkciwNCj4+Pj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRtYV9hZGRyX3QgZG1hX2hhbmRsZSwgdW5z
aWduZWQgbG9uZyBhdHRycykNCj4+Pj4gwqDCoCB7DQo+Pj4+IMKgwqDCoMKgwqDCoCBzdHJ1Y3Qg
eGVuX2dyYW50X2RtYV9kYXRhICpkYXRhOw0KPj4+PiAtwqDCoMKgIHVuc2lnbmVkIGludCBpLCBu
X3BhZ2VzID0gUEZOX1VQKHNpemUpOw0KPj4+PiArwqDCoMKgIHVuc2lnbmVkIGludCBpLCBuX3Bh
Z2VzID0gWEVOX1BGTl9VUChzaXplKTsNCj4+Pj4gwqDCoMKgwqDCoMKgIGdyYW50X3JlZl90IGdy
YW50Ow0KPj4+PiDCoMKgIMKgwqDCoMKgwqAgZGF0YSA9IGZpbmRfeGVuX2dyYW50X2RtYV9kYXRh
KGRldik7DQo+Pj4+IEBAIC0xMzgsNyArMTM4LDcgQEAgc3RhdGljIHZvaWQgeGVuX2dyYW50X2Rt
YV9mcmVlKHN0cnVjdCBkZXZpY2UNCj4+Pj4gKmRldiwgc2l6ZV90IHNpemUsIHZvaWQgKnZhZGRy
LA0KPj4+PiDCoMKgIMKgwqDCoMKgwqAgZ250dGFiX2ZyZWVfZ3JhbnRfcmVmZXJlbmNlX3NlcShn
cmFudCwgbl9wYWdlcyk7DQo+Pj4+IMKgwqAgLcKgwqDCoCBmcmVlX3BhZ2VzX2V4YWN0KHZhZGRy
LCBuX3BhZ2VzICogUEFHRV9TSVpFKTsNCj4+Pj4gK8KgwqDCoCBmcmVlX3BhZ2VzX2V4YWN0KHZh
ZGRyLCBuX3BhZ2VzICogWEVOX1BBR0VfU0laRSk7DQo+Pj4+IMKgwqAgfQ0KPj4+PiDCoMKgIMKg
IHN0YXRpYyBzdHJ1Y3QgcGFnZSAqeGVuX2dyYW50X2RtYV9hbGxvY19wYWdlcyhzdHJ1Y3QgZGV2
aWNlICpkZXYsDQo+Pj4+IHNpemVfdCBzaXplLA0KPj4+PiBAQCAtMTY4LDcgKzE2OCw3IEBAIHN0
YXRpYyBkbWFfYWRkcl90IHhlbl9ncmFudF9kbWFfbWFwX3BhZ2Uoc3RydWN0DQo+Pj4+IGRldmlj
ZSAqZGV2LCBzdHJ1Y3QgcGFnZSAqcGFnZSwNCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nIGF0dHJzKQ0KPj4+PiDCoMKgIHsN
Cj4+Pj4gwqDCoMKgwqDCoMKgIHN0cnVjdCB4ZW5fZ3JhbnRfZG1hX2RhdGEgKmRhdGE7DQo+Pj4+
IC3CoMKgwqAgdW5zaWduZWQgaW50IGksIG5fcGFnZXMgPSBQRk5fVVAob2Zmc2V0ICsgc2l6ZSk7
DQo+Pj4+ICvCoMKgwqAgdW5zaWduZWQgaW50IGksIG5fcGFnZXMgPSBYRU5fUEZOX1VQKG9mZnNl
dCArIHNpemUpOw0KPj4+DQo+Pj4gVGhlIG9mZnNldCwgaGVyZSwgcmVmZXJzIHRvIHRoZSBvZmZz
ZXQgaW4gdGhlIHBhZ2UgLi4uDQo+Pj4NCj4+Pj4gwqDCoMKgwqDCoMKgIGdyYW50X3JlZl90IGdy
YW50Ow0KPj4+PiDCoMKgwqDCoMKgwqAgZG1hX2FkZHJfdCBkbWFfaGFuZGxlOw0KPj4+PiDCoMKg
IEBAIC0yMDAsOCArMjAwLDggQEAgc3RhdGljIHZvaWQgeGVuX2dyYW50X2RtYV91bm1hcF9wYWdl
KHN0cnVjdA0KPj4+PiBkZXZpY2UgKmRldiwgZG1hX2FkZHJfdCBkbWFfaGFuZGxlLA0KPj4+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGxv
bmcgYXR0cnMpDQo+Pj4+IMKgwqAgew0KPj4+PiDCoMKgwqDCoMKgwqAgc3RydWN0IHhlbl9ncmFu
dF9kbWFfZGF0YSAqZGF0YTsNCj4+Pj4gLcKgwqDCoCB1bnNpZ25lZCBsb25nIG9mZnNldCA9IGRt
YV9oYW5kbGUgJiAoUEFHRV9TSVpFIC0gMSk7DQo+Pj4+IC3CoMKgwqAgdW5zaWduZWQgaW50IGks
IG5fcGFnZXMgPSBQRk5fVVAob2Zmc2V0ICsgc2l6ZSk7DQo+Pj4+ICvCoMKgwqAgdW5zaWduZWQg
bG9uZyBvZmZzZXQgPSBkbWFfaGFuZGxlICYgflhFTl9QQUdFX01BU0s7DQo+Pj4NCj4+PiAuLi4g
d2hpbGUsIGhlcmUsIGl0IHJlZmVycyB0byB0aGUgb2Zmc2V0IGluIHRoZSBncmFudC4NCj4+PiBT
bywgdGhlIGNhbGN1bGF0ZWQgbnVtYmVyIG9mIGdyYW50cyBtYXkgZGlmZmVyLg0KPj4NCj4+IEdv
b2QgcG9pbnQsIEkgdGhpbmsgeW91IGFyZSByaWdodCwgc28gd2UgbmVlZCB0byBhZGRpdGlvbmFs
bHkgdXNlDQo+PiB4ZW5fb2Zmc2V0X2luX3BhZ2UoKSBtYWNybyBpbiB4ZW5fZ3JhbnRfZG1hX21h
cF9wYWdlKCksDQo+Pg0KPj4gc29tZXRoaW5nIGxpa2UgdGhhdCB0byBiZSBzcXVhc2hlZCB3aXRo
IGN1cnJlbnQgcGF0Y2g6DQo+Pg0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi9ncmFu
dC1kbWEtb3BzLmMgYi9kcml2ZXJzL3hlbi9ncmFudC1kbWEtb3BzLmMNCj4+IGluZGV4IDlkNWVj
YTZkNjM4YS4uYmI5ODRkYzA1ZGViIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy94ZW4vZ3JhbnQt
ZG1hLW9wcy5jDQo+PiArKysgYi9kcml2ZXJzL3hlbi9ncmFudC1kbWEtb3BzLmMNCj4+IEBAIC0x
NjksNyArMTY5LDcgQEAgc3RhdGljIGRtYV9hZGRyX3QgeGVuX2dyYW50X2RtYV9tYXBfcGFnZShz
dHJ1Y3QNCj4+IGRldmljZSAqZGV2LCBzdHJ1Y3QgcGFnZSAqcGFnZSwNCj4+IMKgIMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcgYXR0cnMpDQo+PiDCoCDCoHsNCj4+IMKgIMKg
wqDCoMKgwqDCoMKgIHN0cnVjdCB4ZW5fZ3JhbnRfZG1hX2RhdGEgKmRhdGE7DQo+PiAtwqDCoMKg
wqDCoMKgIHVuc2lnbmVkIGludCBpLCBuX3BhZ2VzID0gWEVOX1BGTl9VUChvZmZzZXQgKyBzaXpl
KTsNCj4+ICvCoMKgwqDCoMKgwqAgdW5zaWduZWQgaW50IGksIG5fcGFnZXMgPSBYRU5fUEZOX1VQ
KHhlbl9vZmZzZXRfaW5fcGFnZShvZmZzZXQpDQo+PiArIHNpemUpOw0KPj4gwqAgwqDCoMKgwqDC
oMKgwqAgZ3JhbnRfcmVmX3QgZ3JhbnQ7DQo+PiDCoCDCoMKgwqDCoMKgwqDCoCBkbWFfYWRkcl90
IGRtYV9oYW5kbGU7DQo+Pg0KPj4gQEAgLTE5MSw3ICsxOTEsNyBAQCBzdGF0aWMgZG1hX2FkZHJf
dCB4ZW5fZ3JhbnRfZG1hX21hcF9wYWdlKHN0cnVjdA0KPj4gZGV2aWNlICpkZXYsIHN0cnVjdCBw
YWdlICpwYWdlLA0KPj4gwqAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgeGVuX3BhZ2VfdG9fZ2ZuKHBhZ2UpICsgaSwgZGlyID09
DQo+PiBETUFfVE9fREVWSUNFKTsNCj4+IMKgIMKgwqDCoMKgwqDCoMKgIH0NCj4+DQo+PiAtwqDC
oMKgwqDCoMKgIGRtYV9oYW5kbGUgPSBncmFudF90b19kbWEoZ3JhbnQpICsgb2Zmc2V0Ow0KPj4g
K8KgwqDCoMKgwqDCoCBkbWFfaGFuZGxlID0gZ3JhbnRfdG9fZG1hKGdyYW50KSArIHhlbl9vZmZz
ZXRfaW5fcGFnZShvZmZzZXQpOw0KPj4NCj4+IMKgIMKgwqDCoMKgwqDCoMKgIHJldHVybiBkbWFf
aGFuZGxlOw0KPj4gwqAgwqB9DQo+Pg0KPj4gRGlkIEkgZ2V0IHlvdXIgcG9pbnQgcmlnaHQ/DQo+
Pg0KPg0KPiBJIHRoaW5rIGl0ICdzIG1vcmUgY29tcGxpY2F0ZWQgdGhhbiB0aGF0Lg0KPiBMZXQn
cyBzYXkgdGhhdCB0aGUgb2Zmc2V0IGluIHBhZ2UgaXMgPiBYRU5fUEFHRV9TSVpFLCB0aGVuIHRo
ZSANCj4gY2FsY3VsYXRpb24gb2YgdGhlIG51bWJlciBvZiBncmFudHMgd29uJ3QgdGFrZSBpbnRv
IGFjY291bnQgdGhlIHBhcnQgDQo+IG9mIHRoZSBvZmZzZXQgdGhhdCBpcyBtdWx0aXBsZSBvZiB0
aGUgWEVOX1BBR0VfU0laRSBpLmUgaXQgd2lsbCANCj4gY2FsY3VsYXRlIG9ubHkgdGhlIHN0cmlj
dGx5IG5lY2Vzc2FyeSBudW1iZXIgb2YgZ3JhbnRzLg0KPiBCdXQgeGVuX2dyYW50X2RtYV9tYXBf
cGFnZSgpIGdyYW50cyBhY2Nlc3MgdG8gdGhlIHdob2xlIHBhZ2UgYmVjYXVzZSwgDQo+IGFzIGl0
IGNhbiBiZSBvYnNlcnZlZCBpbiB0aGUgY29kZSBzbmlwcGV0IGJlbG93LCBpdCBkb2VzIG5vdCB0
YWtlIGludG8gDQo+IGFjY291bnQgdGhlIHBhZ2Ugb2Zmc2V0Lg0KPg0KPiBmb3IgKGkgPSAwOyBp
IDwgbl9wYWdlczsgaSsrKSB7DQo+IMKgIGdudHRhYl9ncmFudF9mb3JlaWduX2FjY2Vzc19yZWYo
Z3JhbnQgKyBpLCBkYXRhLT5iYWNrZW5kX2RvbWlkLCANCj4geGVuX3BhZ2VfdG9fZ2ZuKHBhZ2Up
ICsgaSwgZGlyID09IERNQV9UT19ERVZJQ0UpOw0KPiB9DQoNCg0KVGhhbmtzLCB2YWxpZCBwb2lu
dC4gQWdyZWUgaXQncyBpbmRlZWQgbW9yZSBjb21wbGljYXRlZC4gSSB3aWxsIGNvbW1lbnQgDQpv
biB0aGF0IGxhdGVyLiBJIGhhdmUganVzdCBwdXNoZWQgYW5vdGhlciBmaXgsIGl0IGlzIG5vdCBy
ZWxhdGVkIHRvIA0KWEVOX1BBR0VfU0laRSBkaXJlY3RseSwgYnV0IGFsc28gYWJvdXQgcGFnZSBv
ZmZzZXQgPiBQQUdFX1NJWkUNCg0Kc28gdG91Y2hlcyB0aGUgc2FtZSBjb2RlIGFuZCBzaG91bGQg
YmUgcHJlcmVxOg0KDQpodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMjEwMDcxMzI3MzYu
MjI3NTU3NC0xLW9sZWtzdHlzaEBnbWFpbC5jb20vDQoNCg0KPg0KPj4+DQo+Pj4NCj4+Pj4gK8Kg
wqDCoCB1bnNpZ25lZCBpbnQgaSwgbl9wYWdlcyA9IFhFTl9QRk5fVVAob2Zmc2V0ICsgc2l6ZSk7
DQo+Pj4+IMKgwqDCoMKgwqDCoCBncmFudF9yZWZfdCBncmFudDsNCj4+Pj4gwqDCoCDCoMKgwqDC
oMKgIGlmIChXQVJOX09OKGRpciA9PSBETUFfTk9ORSkpDQo+Pj4NCj4+DQo+PiBUaGFuayB5b3Uu
DQo+Pg0KPj4NCj4NCi0tIA0KUmVnYXJkcywNCg0KT2xla3NhbmRyIFR5c2hjaGVua28NCg==

