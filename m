Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 122BF4B4D91
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 12:15:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271439.465877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJZKX-0007ZT-Bo; Mon, 14 Feb 2022 11:15:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271439.465877; Mon, 14 Feb 2022 11:15:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJZKX-0007W0-7h; Mon, 14 Feb 2022 11:15:41 +0000
Received: by outflank-mailman (input) for mailman id 271439;
 Mon, 14 Feb 2022 11:15:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YsDI=S5=epam.com=prvs=4044e07e7c=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nJZKV-0007Vu-NX
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 11:15:39 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6fa17b9f-8d87-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 12:15:38 +0100 (CET)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21EAmCi0026083;
 Mon, 14 Feb 2022 11:15:33 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2177.outbound.protection.outlook.com [104.47.17.177])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3e7nkg8358-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 11:15:33 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB7712.eurprd03.prod.outlook.com (2603:10a6:20b:3dd::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18; Mon, 14 Feb
 2022 11:15:28 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::fc4d:4749:5d1:eb73]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::fc4d:4749:5d1:eb73%4]) with mapi id 15.20.4975.018; Mon, 14 Feb 2022
 11:15:27 +0000
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
X-Inumbo-ID: 6fa17b9f-8d87-11ec-b215-9bbe72dcb22c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RD1QfVsGYdfRZFS1m85A6QuOk+P6vv7KlivCkXC6/U0jRt+PL6ax56Oma0aOo79F5yRFLSKq3hREZcJJ0hiq+mzuH7afiYBOfY5UJCyrRMMHvDke7SacLRfq6i7lCQdpCxn6OvTlBDZh4KNi7nRU8UukYtouVH+WCvdTHjlDxcbK8HR+DERf52dwWgCWFDbkh8f0nTgA29z0BxPcJD4xi9B6d4DQLiHxpHkBxuOOi+AOO34ozOGByTfyi5ICux25IgbqUoV+2nZkB9w5xAhErq6vLLpYaO2HW8GkNyqmKl7JvbPp+9zC5U7H6DIR+eelzYYSswKuazpRhfamkcJsXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BhNrOzYs5sJctlI2hMYOJh0hNztlBRy0Yi+1k1h84sc=;
 b=PuZlzSYjovFotSODMhYc/jp924ILeQEvSHrL9G2DAopZCpbIeb1WgIQ/sGvSuVR3rOmneKr4++ZZAn73WeltM2B1rOiZcVBKKV+gdVF+fBnlhlKEcFhrAOiyHMbFf+0RzO6Ogd25lGLK1+IZ7iWIQJ3G5IKf7VQwjmmnACHCYv6hmEwAnNU0Y/rpYwx29xgl3w4Vka1B8XJrqkOGNJwtrS4tNebzapwJ5v08oT206OXXILtAWseerx29+KJQAU1dpyealj7IPu/mEqPjK4vcZ12gEnkdvBcp7V9poyOI/mrEt82ji+2w0/6B9emaRsUreYtkXGK08a5GHm7A0lpvEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BhNrOzYs5sJctlI2hMYOJh0hNztlBRy0Yi+1k1h84sc=;
 b=HJwkHTlBkP+iRxD71RrnQYLE3OGvkVNAt438pUukpkRj/2AVu3Rcm+s5J29t4k0scAjL9j+iiAWVRTtI6t0ESFba2b1sYrmAQO7I4Q9S9ZY0WNx4wtq6QnfuaPpS69EL9GsYyuQnuIG4RIMCZ8mnzDWwXLlOGphuwZRYbNaBk9sZkQDzQZsV2P0ji6rOTj2DuRloUEQNRYAGdm3xNfEED859cYKM2HW8Kw5MMe09tOprbIykxjsry1gX5qTK2hrqvu2ZevNdm3qpuj2EXEAkKiaupD0hBf9BxT1A6IsbJxi3CfzSWSpkFxLC2MaEMKNyRwrhbgFlCfDFbVjJtfbMgw==
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
Thread-Index: 
 AQHYHboQT3cBWYI1/EGunE7hOwop6ayM95MAgAD+qQCAAEaDAIAElIcAgAAQEwCAAAV1AIAABOQAgAABMIA=
Date: Mon, 14 Feb 2022 11:15:27 +0000
Message-ID: <746860aa-c403-1eca-0a75-587c5d10c8c2@epam.com>
References: <20220209133627.959649-1-andr2000@gmail.com>
 <YgU6Snk8GTytJXZp@Air-de-Roger>
 <c4666570-666e-6680-5ec2-adf1da51ad06@epam.com>
 <YgZLEMW9US9QjjYG@Air-de-Roger>
 <33fb1095-64ed-29ef-ba6b-cbde21d941f8@epam.com>
 <YgowIg5MvTaf2zsR@Air-de-Roger>
 <d8389a90-00c8-b34a-8488-b0f3fc5bde1b@epam.com>
 <Ygo40L4dMPJjZKRF@Air-de-Roger>
In-Reply-To: <Ygo40L4dMPJjZKRF@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2c245e28-f36f-4bd3-645d-08d9efab4e29
x-ms-traffictypediagnostic: AM9PR03MB7712:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM9PR03MB7712F58CEA50A3B595FCE73FE7339@AM9PR03MB7712.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 StQ2wwCZXQVQs7S/vNcUrOLW5eNgIhfwXSZyI7qL9G4sAcEApHXOBb+KVB81tdstX4vzuI4oGAOksff83eyHtPzSR3brwFSc5BQ2W96NgDVe60dleQPcwbhlDjrsCHV6EC42fZrreZMetQ0by4uVr2+h7hjPJz1MvLvN40d2cmW3jWp7U/hXB2NCZ9IBe+saNTHKKVYT/DhTSpUlu82RSxZRJoU/tAcxhYNCWCR+xDOScxsru1wXO3jammDZGD1wSLKwLO5vY/7kTHHmxhGbrwWwXe4S2NIQ09sRS6zuUYI2kSftUOaEqecQXLGFnjshigUbSZyvQ1BMaKOC6epnGXxneFMGmOnQt+NAktVPbMDxj9RFktpzMyk5ls5O5oQhWLovQKZYlS5Kv8+LBDJR8rwTvoqoj1o4l1SNPgmlFvhkC8aX1EAIOGn5kXvtkw0Zc9fTzfjwXg6uSb1dqAiBycIRfO5JwNA/EMirvdbHLpKzBCUu8d/YLaDFQK3IhkPwWs7ig4/galg+PVZUaWQ4Duk7sC4nn8Bvv2pYmZC8CLvVIEn2GfOubgyPPng3Rznoa3nusvaCg0oaPK31zx8QoO56a6DrIxF4w2gDn5gHecfZ+rJ0Hi8ngnlHrdaObAud/1x6Fdf4xxD68DDKqN1dtwUHHM9FabDua6xP7+yI+/bnJjnTpduIqvx9mqjIrAagnwXmp45yKFViWVxRmC/BduuVJS9OG/WOPWpRn62dUCBehP+O6q61XPCnNGs4C6nJ
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(76116006)(66446008)(91956017)(8676002)(83380400001)(71200400001)(38100700002)(66946007)(66556008)(36756003)(5660300002)(316002)(2616005)(107886003)(38070700005)(2906002)(26005)(186003)(86362001)(55236004)(53546011)(4326008)(8936002)(64756008)(31696002)(6506007)(6512007)(66476007)(6486002)(31686004)(508600001)(54906003)(6916009)(122000001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Yk0xM3p4WXNteTRWaFpUVGd6TEt1cmRlMVVKMWtCQ0lLSmZFUmRDRDQzYVpz?=
 =?utf-8?B?T3krVjVzaURyTWZTV0l3ck9uZ2dLQ0t0aU9lQ1k5blQzUk5LQXJKSm9YVWFE?=
 =?utf-8?B?ajEwL2NhV04vRGR0VjQzZXV4YmFHU3dJT3p2QTh4Wm5aZnByek81ejNQYVNJ?=
 =?utf-8?B?bm1YRExjQWNWWlR3RjZpRTRQNE5tREJPWjQ1ZVVvZjFyVDRhSndvTGlubER4?=
 =?utf-8?B?b3VKYlRJbkRDWEpPYWZGdDhhYUlrb01sMFNBaUZjbzFyZW1zTnB5V2pzWnNt?=
 =?utf-8?B?UzRPU01wTUo2bDFWUTVDalFaRDhOaURPOXdxTUYzMnVqTU5kS1Q5cmM4UzYr?=
 =?utf-8?B?alA5TlRyUGNpbEhzWFUrR1VrbkFRc2RIb1hZZDZQWkpBVWplT1B5RU1PZVl6?=
 =?utf-8?B?Wk01UjVTNTJ4V3lxSmE1dENEVzlLekE0SW5GalhrbWo4YUM5ajR0VXg4SlJO?=
 =?utf-8?B?b05RUmM3endHSi81MFNVbmZBVlNPaG4vNkhoMXNZRlY5dVNRY0lKS21zVUxo?=
 =?utf-8?B?bWZRVUVzRlZSSHJXNDdhR29WQ3V4M1o5Y1h6aTE1V0pJT3c4aVZ4aUlPZnEv?=
 =?utf-8?B?TUtORGU3b1pLOWFaOFhNNDZIVnhGYVNDYnB1SDdOM3lFem9MT0I2UGdFeXBw?=
 =?utf-8?B?ZmM1N3kvQ0p2MHF3NDVCUy93TlZybXdlSGthb3VDR2ZSVzYvVHI0VkR0dG5p?=
 =?utf-8?B?T1dURHlxSTBlbDRwb28rQkJQQjJuVXZBOWFodXBLVS90aGVnOUY0OFpraW1t?=
 =?utf-8?B?Z0Rlb1pZaHR2VnJGc0JoVWxWTExIdG1YMWIxYlBQQndYeWgzN3VwQmwyWm5U?=
 =?utf-8?B?VFdhOE9XaU9COW12MWZxWlV1djJlc3FTRFNKT3kwcitIelNFc2xvZlF2Uyt5?=
 =?utf-8?B?RnAwR0pzcjZwV1NhNk9NU3pXUlljWEdEc2Exbzd0bVE1ZzNiSDhFUk9lSFZB?=
 =?utf-8?B?K0I4SFpLYTFxL0xFMVF6WElsTlpUWk9QcURwOVVYNUFWRzNJRDI4clU2ZDRC?=
 =?utf-8?B?MG9Sd01mVGQ3dkZTelBBS0VNY3JWdlNxL3NuZmx2MXFHeUgzMWR2algrc0di?=
 =?utf-8?B?SENpSGdtanE2Y3pxZDhrYWI1V3RWUmRUN1JGaVE2RkErTTIxY2NPdjVkK2pa?=
 =?utf-8?B?UkhaVVhEcFN3UmdmRU5ZK3d2MDFteEVmUjFMSWtJcjFHYWVDc2VtUXBORlhI?=
 =?utf-8?B?MUw1dVVjcGdTMjJGaXA3UHhrOTBraGlYUnRmcXpJODhMU1k2MWZaOWU1QUtX?=
 =?utf-8?B?R3poSW9MTGp5d2QwcVdsSjVTbFRmYkxiRTErZ2lZZ3ZmK3p0RkJDVkdLRk0x?=
 =?utf-8?B?VVhXb2dsR3BxTHc5Qnp1Nm5oaFRPQnVucENGUmc1NVpCYlFTNXhubzhRREhp?=
 =?utf-8?B?aEVaWmhYUW55Rmpma2xkQ0ZOUDB1ZFd1dFVsQTBqY0VRL1hkenNYRUl2bVIz?=
 =?utf-8?B?WVR3b2YxMXQ3UndSelF2YjVyT2o1eURjTStKdzVsOGl0aUVSUXJRUks0NCtI?=
 =?utf-8?B?Vmk2aDU3eFJ5dW9uTlczTjBpSldiRFlUczlaV0tsUzVWR3BiTzROcFlpR1JU?=
 =?utf-8?B?Mk0yNVVnNlROZ0lreldYN1RvREk4bmNsMGVYZWxRdWJ6L0ZRZFg3UlUyNWlN?=
 =?utf-8?B?MVcvWHArTy9mMkhTMGhEOTRxR1NTbmEzcC9KamJ0Q3FMVlY4M2JBY2NzNDFi?=
 =?utf-8?B?b0FNZ3J6a3ZRQnJLVFZXUG5JMGxnWmR4RW5nUXd0U3YzdWdEdVhJczJ2andr?=
 =?utf-8?B?M0gxQ1JMWFhUY2V3c0ZwQkgrWnFFNCsrajNzS1pnSE50L1ZpdVBXZGRYaXVz?=
 =?utf-8?B?MHFWRXRlQmErMEQ5OEpFQkd1clFLY25yS2w0aDA1Y01uTHE2U0NFVnJDL29B?=
 =?utf-8?B?OUczMWlSQkJHYWVYTDAzTXBqaklKVDhaRklKMXZKOVlvcXpXM3JrRFB3Uy8w?=
 =?utf-8?B?WTNQcktxU09vTkR5V3FMcXozWVZERCtmb1JlNEpia3l0K1BSSFdoSzl3b0JG?=
 =?utf-8?B?K3VQTG12aHA0bERxUUlmSEpmeE1peTFuMk9qUEtCRFRBS2ozOGRzUTVzMWY3?=
 =?utf-8?B?ZnBwMEkxRkI4WVN4MEtObyt6Uzdjd2ZJN1RtYkhKVE5IMjY3TGFXQ3h1N1ZM?=
 =?utf-8?B?bzhyaFVmMm5TMnd3b3ptaURLN3JoUC96M3RWK0FBc0ZhSU9CUDEyOXNZR2Jj?=
 =?utf-8?B?a2VoTmlUNStNWlBraENTWUJ2bXhML1lsaEtYY3NDU1JIc3craXdmRjA1dUhH?=
 =?utf-8?B?UFFWblA0OG93cEFEckFpSlJ4NnNqUWJxNmdYdTh5cFRmMFZlL0NDaDEzUGhL?=
 =?utf-8?B?Njd0aTJLR1VSeGxyVmhoZ1dOWEowbnU0amFhWDBoZUdsMktNaFhLUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F958D472CD8D8848B694FF99B1326F56@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c245e28-f36f-4bd3-645d-08d9efab4e29
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2022 11:15:27.8011
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ozsD2QxKzeKltrVz2GF9gqLelEbcE20JMuZQQcnhR7ray6ekzplGIf6DvK0mgH/FhRVdx3X1UqJJdfKgkewO1yJLIj+uQaxJJ3IiQycf6zB/JVb+rjZmZnuuQZnBrk0g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7712
X-Proofpoint-ORIG-GUID: -vPnl3bXiATb0CjXpalXZLeo41THlwwo
X-Proofpoint-GUID: -vPnl3bXiATb0CjXpalXZLeo41THlwwo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-14_03,2022-02-14_03,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 spamscore=0 mlxlogscore=999
 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202140069

DQoNCk9uIDE0LjAyLjIyIDEzOjExLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBNb24s
IEZlYiAxNCwgMjAyMiBhdCAxMDo1Mzo0M0FNICswMDAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byB3cm90ZToNCj4+DQo+PiBPbiAxNC4wMi4yMiAxMjozNCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90
ZToNCj4+PiBPbiBNb24sIEZlYiAxNCwgMjAyMiBhdCAwOTozNjozOUFNICswMDAwLCBPbGVrc2Fu
ZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4gT24gMTEuMDIuMjIgMTM6NDAsIFJvZ2VyIFBh
dSBNb25uw6kgd3JvdGU6DQo+Pj4+PiArDQo+Pj4+Pj4+PiAgICAgICAgICBmb3IgKCBpID0gMDsg
aSA8IG1zaXgtPm1heF9lbnRyaWVzOyBpKysgKQ0KPj4+Pj4+Pj4gICAgICAgICAgew0KPj4+Pj4+
Pj4gICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCB2cGNpX21zaXhfZW50cnkgKmVudHJ5ID0gJm1z
aXgtPmVudHJpZXNbaV07DQo+Pj4+Pj4+IFNpbmNlIHRoaXMgZnVuY3Rpb24gaXMgbm93IGNhbGxl
ZCB3aXRoIHRoZSBwZXItZG9tYWluIHJ3bG9jayByZWFkDQo+Pj4+Pj4+IGxvY2tlZCBpdCdzIGxp
a2VseSBub3QgYXBwcm9wcmlhdGUgdG8gY2FsbCBwcm9jZXNzX3BlbmRpbmdfc29mdGlycXMNCj4+
Pj4+Pj4gd2hpbGUgaG9sZGluZyBzdWNoIGxvY2sgKGNoZWNrIGJlbG93KS4NCj4+Pj4+PiBZb3Ug
YXJlIHJpZ2h0LCBhcyBpdCBpcyBwb3NzaWJsZSB0aGF0Og0KPj4+Pj4+DQo+Pj4+Pj4gcHJvY2Vz
c19wZW5kaW5nX3NvZnRpcnFzIC0+IHZwY2lfcHJvY2Vzc19wZW5kaW5nIC0+IHJlYWRfbG9jaw0K
Pj4+Pj4+DQo+Pj4+Pj4gRXZlbiBtb3JlLCB2cGNpX3Byb2Nlc3NfcGVuZGluZyBtYXkgYWxzbw0K
Pj4+Pj4+DQo+Pj4+Pj4gcmVhZF91bmxvY2sgLT4gdnBjaV9yZW1vdmVfZGV2aWNlIC0+IHdyaXRl
X2xvY2sNCj4+Pj4+Pg0KPj4+Pj4+IGluIGl0cyBlcnJvciBwYXRoLiBTbywgYW55IGludm9jYXRp
b24gb2YgcHJvY2Vzc19wZW5kaW5nX3NvZnRpcnFzDQo+Pj4+Pj4gbXVzdCBub3QgaG9sZCBkLT52
cGNpX3J3bG9jayBhdCBsZWFzdC4NCj4+Pj4+Pg0KPj4+Pj4+IEFuZCBhbHNvIHdlIG5lZWQgdG8g
Y2hlY2sgdGhhdCBwZGV2LT52cGNpIHdhcyBub3QgcmVtb3ZlZA0KPj4+Pj4+IGluIGJldHdlZW4g
b3IgKnJlLWNyZWF0ZWQqDQo+Pj4+Pj4+IFdlIHdpbGwgbGlrZWx5IG5lZWQgdG8gcmUtaXRlcmF0
ZSBvdmVyIHRoZSBsaXN0IG9mIHBkZXZzIGFzc2lnbmVkIHRvDQo+Pj4+Pj4+IHRoZSBkb21haW4g
YW5kIGFzc2VydCB0aGF0IHRoZSBwZGV2IGlzIHN0aWxsIGFzc2lnbmVkIHRvIHRoZSBzYW1lDQo+
Pj4+Pj4+IGRvbWFpbi4NCj4+Pj4+PiBTbywgZG8geW91IG1lYW4gYSBwYXR0ZXJuIGxpa2UgdGhl
IGJlbG93IHNob3VsZCBiZSB1c2VkIGF0IGFsbA0KPj4+Pj4+IHBsYWNlcyB3aGVyZSB3ZSBuZWVk
IHRvIGNhbGwgcHJvY2Vzc19wZW5kaW5nX3NvZnRpcnFzPw0KPj4+Pj4+DQo+Pj4+Pj4gcmVhZF91
bmxvY2sNCj4+Pj4+PiBwcm9jZXNzX3BlbmRpbmdfc29mdGlycXMNCj4+Pj4+PiByZWFkX2xvY2sN
Cj4+Pj4+PiBwZGV2ID0gcGNpX2dldF9wZGV2X2J5X2RvbWFpbihkLCBzYmRmLnNlZywgc2JkZi5i
dXMsIHNiZGYuZGV2Zm4pOw0KPj4+Pj4+IGlmICggcGRldiAmJiBwZGV2LT52cGNpICYmIGlzX3Ro
ZV9zYW1lX3ZwY2kocGRldi0+dnBjaSkgKQ0KPj4+Pj4+IDxjb250aW51ZSBwcm9jZXNzaW5nPg0K
Pj4+Pj4gU29tZXRoaW5nIGFsb25nIHRob3NlIGxpbmVzLiBZb3UgbGlrZWx5IG5lZWQgdG8gY29u
dGludWUgaXRlcmF0ZSB1c2luZw0KPj4+Pj4gZm9yX2VhY2hfcGRldi4NCj4+Pj4gSG93IGRvIHdl
IHRlbGwgaWYgcGRldi0+dnBjaSBpcyB0aGUgc2FtZT8gSmFuIGhhcyBhbHJlYWR5IGJyb3VnaHQN
Cj4+Pj4gdGhpcyBxdWVzdGlvbiBiZWZvcmUgWzFdIGFuZCBJIHdhcyBhYm91dCB0byB1c2Ugc29t
ZSBJRCBmb3IgdGhhdCBwdXJwb3NlOg0KPj4+PiBwZGV2LT52cGNpLT5pZCA9IGQtPnZwY2lfaWQr
KyBhbmQgdGhlbiB3ZSB1c2UgcGRldi0+dnBjaS0+aWTCoCBmb3IgY2hlY2tzDQo+Pj4gR2l2ZW4g
dGhpcyBpcyBhIGRlYnVnIG1lc3NhZ2UgSSB3b3VsZCBiZSBPSyB3aXRoIGp1c3QgZG9pbmcgdGhl
DQo+Pj4gbWluaW1hbCBjaGVja3MgdG8gcHJldmVudCBYZW4gZnJvbSBjcmFzaGluZyAoaWU6IHBk
ZXYtPnZwY2kgZXhpc3RzKQ0KPj4+IGFuZCB0aGF0IHRoZSByZXN1bWUgTVNJIGVudHJ5IGlzIG5v
dCBwYXN0IHRoZSBjdXJyZW50IGxpbWl0LiBPdGhlcndpc2UNCj4+PiBqdXN0IHByaW50IGEgbWVz
c2FnZSBhbmQgbW92ZSBvbiB0byB0aGUgbmV4dCBkZXZpY2UuDQo+PiBBZ3JlZSwgSSBzZWUgbm8g
YmlnIGlzc3VlIChwcm9iYWJseSkgaWYgd2UgYXJlIG5vdCBhYmxlIHRvIHByaW50DQo+Pg0KPj4g
SG93IGFib3V0IHRoaXMgb25lOg0KPj4NCj4+IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy92cGNp
L2hlYWRlci5jIGIveGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYw0KPj4gaW5kZXggODA5YTZiNDc3
M2UxLi41MDM3M2YwNGRhODIgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vZHJpdmVycy92cGNpL2hlYWRl
ci5jDQo+PiArKysgYi94ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jDQo+PiBAQCAtMTcxLDEwICsx
NzEsMzEgQEAgc3RhdGljIGludCBfX2luaXQgYXBwbHlfbWFwKHN0cnVjdCBkb21haW4gKmQsIGNv
bnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2LA0KPj4gICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgcmFuZ2VzZXQgKm1lbSwgdWlu
dDE2X3QgY21kKQ0KPj4gICDCoHsNCj4+ICAgwqDCoMKgwqAgc3RydWN0IG1hcF9kYXRhIGRhdGEg
PSB7IC5kID0gZCwgLm1hcCA9IHRydWUgfTsNCj4+ICvCoMKgwqAgcGNpX3NiZGZfdCBzYmRmID0g
cGRldi0+c2JkZjsNCj4+ICAgwqDCoMKgwqAgaW50IHJjOw0KPj4NCj4+ICsgQVNTRVJUKHJ3X2lz
X3dyaXRlX2xvY2tlZCgmcGRldi0+ZG9tYWluLT52cGNpX3J3bG9jaykpOw0KPj4gKw0KPj4gICDC
oMKgwqDCoCB3aGlsZSAoIChyYyA9IHJhbmdlc2V0X2NvbnN1bWVfcmFuZ2VzKG1lbSwgbWFwX3Jh
bmdlLCAmZGF0YSkpID09IC1FUkVTVEFSVCApDQo+PiArwqDCoMKgIHsNCj4+ICsNCj4+ICvCoMKg
wqDCoMKgwqDCoCAvKg0KPj4gK8KgwqDCoMKgwqDCoMKgwqAgKiBwcm9jZXNzX3BlbmRpbmdfc29m
dGlycXMgbWF5IHRyaWdnZXIgdnBjaV9wcm9jZXNzX3BlbmRpbmcgd2hpY2gNCj4+ICvCoMKgwqDC
oMKgwqDCoMKgICogbWF5IG5lZWQgdG8gYWNxdWlyZSBwZGV2LT5kb21haW4tPnZwY2lfcndsb2Nr
IGluIHJlYWQgbW9kZS4NCj4+ICvCoMKgwqDCoMKgwqDCoMKgICovDQo+PiArwqDCoMKgwqDCoMKg
wqAgd3JpdGVfdW5sb2NrKCZwZGV2LT5kb21haW4tPnZwY2lfcndsb2NrKTsNCj4+ICAgwqDCoMKg
wqDCoMKgwqDCoCBwcm9jZXNzX3BlbmRpbmdfc29mdGlycXMoKTsNCj4+ICvCoMKgwqDCoMKgwqDC
oCB3cml0ZV9sb2NrKCZwZGV2LT5kb21haW4tPnZwY2lfcndsb2NrKTsNCj4+ICsNCj4+ICvCoMKg
wqDCoMKgwqDCoCAvKiBDaGVjayBpZiBwZGV2IHN0aWxsIGV4aXN0cyBhbmQgdlBDSSB3YXMgbm90
IHJlbW92ZWQgb3IgcmUtY3JlYXRlZC4gKi8NCj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAocGNpX2dl
dF9wZGV2X2J5X2RvbWFpbihkLCBzYmRmLnNlZywgc2JkZi5idXMsIHNiZGYuZGV2Zm4pICE9IHBk
ZXYpDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoIHZwY2kgaXMgTk9UIHRoZSBzYW1l
ICkNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHsNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgcmMgPSAwOw0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBi
cmVhazsNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0NCj4+ICvCoMKgwqAgfQ0KPj4gKw0K
Pj4gICDCoMKgwqDCoCByYW5nZXNldF9kZXN0cm95KG1lbSk7DQo+PiAgIMKgwqDCoMKgIGlmICgg
IXJjICkNCj4+ICAgwqDCoMKgwqDCoMKgwqDCoCBtb2RpZnlfZGVjb2RpbmcocGRldiwgY21kLCBm
YWxzZSk7DQo+Pg0KPj4gVGhpcyBvbmUgYWxzbyB3YW50cyBwcm9jZXNzX3BlbmRpbmdfc29mdGly
cXMgdG8gcnVuIHNvIGl0ICptaWdodCoNCj4+IHdhbnQgcGRldiBhbmQgdnBjaSBjaGVja3MuIEJ1
dCBhdCB0aGUgc2FtZSB0aW1lIGFwcGx5X21hcCBydW5zDQo+PiBhdCAoIHN5c3RlbV9zdGF0ZSA8
IFNZU19TVEFURV9hY3RpdmUgKSwgc28gZGVmZXJfbWFwIHdvbid0IGJlDQo+PiBydW5uaW5nIHll
dCwgdGh1cyBubyB2cGNpX3Byb2Nlc3NfcGVuZGluZyBpcyBwb3NzaWJsZSB5ZXQgKGluIHRlcm1z
DQo+PiBpdCBoYXMgc29tZXRoaW5nIHRvIGRvIHlldCkuIFNvLCBJIHRoaW5rIHdlIGp1c3QgbmVl
ZDoNCj4+DQo+PiAgIMKgwqDCoMKgwqDCoMKgIHdyaXRlX3VubG9jaygmcGRldi0+ZG9tYWluLT52
cGNpX3J3bG9jayk7DQo+PiAgIMKgwqDCoMKgwqDCoMKgIHByb2Nlc3NfcGVuZGluZ19zb2Z0aXJx
cygpOw0KPj4gICDCoMKgwqDCoMKgwqDCoCB3cml0ZV9sb2NrKCZwZGV2LT5kb21haW4tPnZwY2lf
cndsb2NrKTsNCj4+DQo+PiBhbmQgdGhpcyBzaG91bGQgYmUgZW5vdWdoDQo+IEdpdmVuIHRoZSBj
b250ZXh0IGFwcGx5X21hcCBpcyBjYWxsZWQgZnJvbSAoZG9tMCBzcGVjaWZpYyBpbml0IGNvZGUp
LA0KPiB0aGVyZSdzIG5vIG5lZWQgdG8gY2hlY2sgZm9yIHRoZSBwZGV2IHRvIHN0aWxsIGV4aXRz
LCBvciB3aGV0aGVyIHZwY2kNCj4gaGFzIGJlZW4gcmVjcmVhdGVkLCBhcyBpdCdzIG5vdCBwb3Nz
aWJsZS4gSnVzdCBhZGQgYSBjb21tZW50IHRvDQo+IGV4cGxpY2l0bHkgbm90ZSB0aGF0IHRoZSBj
b250ZXh0IG9mIHRoZSBmdW5jdGlvbiBpcyBzcGVjaWFsLCBhbmQgdGh1cw0KPiB0aGVyZSdzIG5v
IHBvc3NpYmlsaXR5IG9mIGVpdGhlciB0aGUgZGV2aWNlIG9yIHZwY2kgZ29pbmcgYXdheS4NCkRv
ZXMgaXQgcmVhbGx5IG5lZWQgd3JpdGVfdW5sb2NrL3dyaXRlX2xvY2sgZ2l2ZW4gdGhlIGNvbnRl
eHQ/Li4uDQpJIHRoaW5rIGl0IGRvZXNuJ3QgYXMgdGhlcmUgaXMgbm8gY2hhbmNlIGRlZmVyX21h
cCBpcyBjYWxsZWQsIHRodXMNCnByb2Nlc3NfcGVuZGluZ19zb2Z0aXJxcyAtPiB2cGNpX3Byb2Nl
c3NfcGVuZGluZyAtPiByZWFkX2xvY2sNCmlzIG5vdCBwb3NzaWJsZQ0KSSdsbCBqdXN0IGFkZCBh
IGNvbW1lbnQgYWJvdXQgdGhhdA0KPiBUaGFua3MsIFJvZ2VyLg0KVGhhbmsgeW91LA0KT2xla3Nh
bmRy

