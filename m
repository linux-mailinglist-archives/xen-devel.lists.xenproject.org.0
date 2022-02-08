Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CE04AD4CF
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 10:27:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267833.461591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHMmT-0004e2-2I; Tue, 08 Feb 2022 09:27:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267833.461591; Tue, 08 Feb 2022 09:27:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHMmS-0004an-Um; Tue, 08 Feb 2022 09:27:24 +0000
Received: by outflank-mailman (input) for mailman id 267833;
 Tue, 08 Feb 2022 09:27:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1FiY=SX=epam.com=prvs=40383cc40e=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nHMmR-0004ad-EZ
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 09:27:23 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50c38e97-88c1-11ec-8f75-fffcc8bd4f1a;
 Tue, 08 Feb 2022 10:27:21 +0100 (CET)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2186j5tc014738;
 Tue, 8 Feb 2022 09:27:18 GMT
Received: from eur02-am5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2053.outbound.protection.outlook.com [104.47.4.53])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3e3kgu0pye-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Feb 2022 09:27:18 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by VE1PR03MB5551.eurprd03.prod.outlook.com (2603:10a6:803:11e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Tue, 8 Feb
 2022 09:27:13 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77%3]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 09:27:13 +0000
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
X-Inumbo-ID: 50c38e97-88c1-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TF+cdFs4akvt4ZY5VLfy5Ug2QvCHpWhD7KRszuNGIP/gIYIbHXnGoLZXjTxYTqAEYWXNMxFWqNyTtZjFMb/8MB3KvpPmvyqDS9PHtYxnue8cR1nywdiJ4tx1x7/Hj9SeNxmXADHqheB1EEiUw5cnxM+uX6FXGbUPVLA1YLwjk0BwwxHQQXu/8eQsv5bmjSiOUFuPq4q8G1jb6Xl8GaMuqMApydPk/9do067Kcdxb4UpvUj03l4QUQb69XilZLh2E8Dx0IJP+A1O7xaUnFZ7I45c9bX100IY9DWFPrzoU1dQ/EtjMtP9paQLd3EyStP0nDTq78XOiYxeb4vz1oHstoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FxSDBzBTgfZZtmNTecDwRQeJQiQYVePpn6Ji/7sO4XQ=;
 b=kxl0lDDzdQF4Bl5IEApb+JENK6l7arL/XsL8hkj9okPrRTAzcYAIs3e23auEMQvWr+22tB/q3eOZZACGxzjJdwsAVTAxxGx40Dk09xmlgwTx8+NKpJBjzfjbpAf29tYavElQZ18Tfkx7PsAmbN2zkeBKAZqiovjm5gZRK+5mE2iEAnOJQH7dUFhDl4WBCiZazvZ0qttc7SbU0L721GuLoQ7TH3gtmboXkZExxg89vuEGgmCIFiF1Vs/erUIAHiY3CXIVTB2yf/JmpMC6XiMoGqg/dWp5rdtu6DrkqRgsKpNmGoNKgnNY7KNq6BQflhijZid1XEmj0zVXd6p6iJyt6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FxSDBzBTgfZZtmNTecDwRQeJQiQYVePpn6Ji/7sO4XQ=;
 b=irrpnejAsu+ZUkApZz3MX8IAsij9MbPeTH6bl4rL+17LI4r+jpcp6xOwTeh1mUm5QiPDDDm9TXAHDfUKUb1y9RE5xp0MoeD5RVq1mi618zSV4NDxZoSCnyOaT7wBjPihstcsFaXgdCRTdzAH4unEeMxU8v0NWzj/U8zFl1s41Urbe5sMCJ/OXDjG2N30cTRfM7hqoNcQnE+RMZWOQyrV3mFNFbzJwOt0TB79Qltd0FDDIyi1LYDSzFiEHyTkqeS3RkA0NJHzZJCpC9Wk7JZaCNGj/f0D2ND1GvN5+0AExEg4R2mI54w+jAV8eXCutNYl1R2iJV3oU0ahUc1tD0b2Gw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>,
        "roger.pau@citrix.com"
	<roger.pau@citrix.com>
CC: "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
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
	<xen-devel@lists.xenproject.org>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v6 05/13] vpci: add hooks for PCI device assign/de-assign
Thread-Topic: [PATCH v6 05/13] vpci: add hooks for PCI device assign/de-assign
Thread-Index: AQHYGZFdYv4W1RdbQkeQtzN+PyKqmqyITGQAgAENNICAAAt2AIAAA+uA
Date: Tue, 8 Feb 2022 09:27:13 +0000
Message-ID: <e225553b-b29c-0448-fb9f-f8b513d9f77d@epam.com>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-6-andr2000@gmail.com>
 <16cea1df-3d0f-d404-2b88-aab47ad5548b@suse.com>
 <3fe6dbe3-51c6-f87f-23f9-cf2e1a924326@epam.com>
 <582ee8f9-7b01-4adc-6a8a-ce8b1dffd534@suse.com>
In-Reply-To: <582ee8f9-7b01-4adc-6a8a-ce8b1dffd534@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3ecb9794-dc91-408d-0988-08d9eae530e1
x-ms-traffictypediagnostic: VE1PR03MB5551:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VE1PR03MB5551239BDD9EE0C625B9DA00E72D9@VE1PR03MB5551.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 azaOhIKSaklYjJfaU5YlGvwymJI0ogl/2SOlmpO2rvrwPcizSXriHpNNhkNan2BHU6Gv/ZVxLZjGN+Ot95Ozb0TAp7Y5Jg9QQ2gdfI7e06hYg9CoAog/oZpIn52lr7KVe6bna0YkSNLUBR1JWfxi75NLXG/r2pkBMB9Rxlg8Rm8scvxMmTRXxgdUh/cf9ebmnvHq3WAQbGTWf1k85XCCG+J7xEUodAIdUVWaF9QVidAfQrFj2WAxiK6nyMney+Lzw0V4sEXSyPqihNzpNNpggcyLVm0PGTAcNZfKTf4fIowaGQIwpZcvu1avgqrPpXYiRzq20zjAueNPLb7/GHmDcYRbuakNpwxgxvR4+yvlfsHrykJDOMsePiR2E5gttX4oOW2xfdQpGMYr4Dvrr7cvOvi1b8xKHDh1J+pLrjG9TY2H1Oau+PWaVCsfF914283/HC+HOKeIma1yEWzGOCGUmwFVRYEhwEb8sq5/MpNh/MofKBEuBUiGi0Y7OYO511jQwWM7EygUFoXlK1YpG4yPfo7V0S4oI7FmRg1iyAEhQNfOvWyHqOvCnRQhktZlTqE6jlFFxqruyLmyp1nDeTkUkJDJ1u0aYJTe7Vhvxl67OQttbMspEnlHT6yilz9FKazpfyTi0L/2s2PLmxBVGV9eK6Wl6S2UJj7ZJoFEBvKvNYm7EnE5KO/c8AH/N4mFQqFrtu9NC4OUraoy+k5swCOAg6gRFiPIjBToMKifxjZ3q0szNO1zF1mld9OpYxq8km6U
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(4326008)(508600001)(66556008)(66946007)(91956017)(110136005)(64756008)(66446008)(8936002)(8676002)(54906003)(6512007)(83380400001)(38070700005)(186003)(6486002)(26005)(122000001)(2906002)(66476007)(76116006)(316002)(31686004)(36756003)(31696002)(107886003)(55236004)(6506007)(2616005)(53546011)(86362001)(38100700002)(5660300002)(71200400001)(7416002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Zjd6TWwyWE1wWkQyeXcycnB0dWp6bWpud2wyOVFXbUpuZEJCQUY3WGRxZmQ0?=
 =?utf-8?B?dmNOVWVCVy9ia2h4RUZ2TWZpYUt2cVBKMDcvL21WeEdIbTEzdFovdFVZS3VJ?=
 =?utf-8?B?MU5SWFFaZ3creGhlZVRlYWJPUEVlazdENHFWZmFBRzJxbnVtem1CWHhaTUkz?=
 =?utf-8?B?OHIxeHY1WWh3NndELzc5T3E1cjMwTGpLazB3QkdjZHZ6bHhEd1NuTjBQSEdZ?=
 =?utf-8?B?VFR6SFd6aVhLOXgxenYrOWVkZzlJT1dvOE9aMDlCVXBUWk12WDdwZE93bW9V?=
 =?utf-8?B?UG1ZR09NY1Y5eFZpamtxUkhoQng1WjJPbi82TVl2SUoyQUNMczhUWDZ5VGF3?=
 =?utf-8?B?VVF2KzhjQjgwalc5ZXZXVU5xbWZSTnFCb09qSlA5L1ZIY1lPd3czaFV3YjRT?=
 =?utf-8?B?clBrVXRFN3BUREkyTVAySTZnYnBFN3BiMVRyUHdnTHBuenJvVGszb3NvRWE4?=
 =?utf-8?B?ZExqTjZLUG9DUzI4Sm8rZi9DZVhTZ2VXK0tjdXkzekJBMkptd2QwRk4xaWVP?=
 =?utf-8?B?WForT0VyUVRHNTA3enpmWmJMTmx2dlliMEtUeUthektLZDlVUHVNTjlNakZj?=
 =?utf-8?B?aFRuYlg3SDdYV1ArWVYrazgvYmRMNDhhQWEwdUtFTE9TU01wSWdHWnZvUW1i?=
 =?utf-8?B?eUtPdTNjMHV4TmdsT2Qzc243OURYbU5Ld2FUeXBZOVI4bllNNW9lL0FQakdY?=
 =?utf-8?B?My9pb2g2SVR2R2FqSy9lRmVYN05US08vdjEvNTA3eXZ0K240L3lVbnA5Rm91?=
 =?utf-8?B?Wm01elBZeTY5OUsrMzhRUTVPMVdtTzVjYTR4cktzakUweHZWZnlmY2I4dDFS?=
 =?utf-8?B?MVhBbWI1VjR5bUFhSDJsWlI3S0xzNnFxdVRxdEJKeWNVNzBIVVp3bmdJaUhp?=
 =?utf-8?B?MVI1UVY5YlZnOE1Jb3JFZEQzZi9JenVCSUZURmNrcHAwRFhGZXdIQmNMc0NH?=
 =?utf-8?B?RXR1OXZlcjR0TU0vMnRjcGFWNjRhMy9WeWIyQ28rMG1VRFJYcDFLSzZXUXBT?=
 =?utf-8?B?KzIxcHQxRDZVN1F0WVhEdzhMOHpQbElVVDN5VFVuWjQrSTBuamcxaUJ0UW40?=
 =?utf-8?B?bVpweUFtcDBrYXU1T1BnT3lMcS9FUGo5bjBRWm1sRS8rM2FoTTVNKzhJVXFq?=
 =?utf-8?B?cmx5eVJKeXJ3blJISG5lNnBVSVhIckZCVzh3a01GaWlZa2d4b2ZLNE5HTGlv?=
 =?utf-8?B?YUR0ZTNKNTk3QTJRTjNoSCtnZkNteWd3aEtzV0oyWlh6R01ocUJVUGRVNVlz?=
 =?utf-8?B?N1hSYyttaGtjbjAwRzRqNk1Fam5rKy9WT1QvSS9wQlVjNTZCeEVpOGdlTEVk?=
 =?utf-8?B?ZHZEUkJiMnRPMEFqd2VVKzVwZWEra2RXL0EvRXpJL0xkeEc2L2VkbVdwamhl?=
 =?utf-8?B?MEg2YVVWK2ZFeTdPOVV3RVl5SzBxbHhMWXVIYk10ZzJSOWFaVWxQYzF6MHdp?=
 =?utf-8?B?Q0Q5VFNjNGd5Y25UeUZtMXI0enhpRVRzdHErTWRZL2ZLNVVHeXdyam9kTDJx?=
 =?utf-8?B?YzJpY3czV1ZVTFZEY0ppSGMxSENkM0Qvay9iTU1NTHZUUXA4ZE56NEo0SG9U?=
 =?utf-8?B?SU1QNk9WQzQ4SDlKRVFlbk9KSHE4Mk5jU2FGWWQ2eW5ub3huSGt0bnBvNHdp?=
 =?utf-8?B?N3ZoRXVOM2ZBcXRxWFhaekpqZUl6UXlLaWRMVUd6b0p2M3F0SEllZ1pyWmZw?=
 =?utf-8?B?RXlBVHdiTnlWUjdLY1hQMlh1Mm9VS3ZyQ1V5aGRnbXpheFdvUVEzREQxLy81?=
 =?utf-8?B?ZEg1YVdoQmFqOXNyZWdoTmN1NlI5b3Ftb2dkazljU3lWRkU2VGpkaUhzcEFm?=
 =?utf-8?B?bllQQkxCY2JIVUhtQUNTUUQrT0s1dkdWdVQ4M2FqaUdyTzNEUUtXMFdwQS90?=
 =?utf-8?B?V3RxVk9sTGtZekx2TGc1dnhjMlYyRWNqQU9sb0NWeStDYWdRanV2SUlPNEU4?=
 =?utf-8?B?MjhKS2wzWVd4NzBnMzFmd2JlWXVFSGhUNmdSYmFlVGV6Q1U0dC9mTkdYcWlU?=
 =?utf-8?B?VXZ4L3BkK1dVYlVqZmRRcS8yRHA3alNrMFhFMHpmYWRpOTdvaEVLT3BKdE9K?=
 =?utf-8?B?UG5pamZnU1I5ZFB6UlhDK3VvZkZqRzlVOTNFd013QXdtQVMyakJYYk9vTlly?=
 =?utf-8?B?YlVZY0tqcmsyakwzVE5IR2J3U2dyMm1SWkFLKzRWMDlyU0JTWHVvdWFYdWhS?=
 =?utf-8?B?bjI3dHVOSHZUSEhXWVY4cHJuZnlZWm44VEpLQ1VkdUdBeC9qUnpvVGNoaS9o?=
 =?utf-8?B?L0xxOVdjbDU5NSt3aWhuNWpLOEZ6TGdyWXMxMk1Qb2hmZWNFblcra3Noam9O?=
 =?utf-8?B?UlZOaWh5VEpCZENUT2JLODR6R3RpckVReUpoZmxwVHcxK3JiYWxmTU1CVW0x?=
 =?utf-8?Q?CN/W41RXj9tGzpIg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <00F47753509D4B4BB5F9BB8991AAD47B@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ecb9794-dc91-408d-0988-08d9eae530e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 09:27:13.6682
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: URdZH47c7uZ11NqVJZDZyoAoz4e2/QAl0fiRimcvUyeP4OhuH6HbQTIJBZlX28XZCMZFXbRQt0ZWi1Z2+XGars8EFEbVkM1YJhaYI7pufYpJu/xybHGxpSAFPdR8Uxsb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR03MB5551
X-Proofpoint-GUID: 22HjuRQ5-HeOE_O-CL8TwFGFHYab1NCL
X-Proofpoint-ORIG-GUID: 22HjuRQ5-HeOE_O-CL8TwFGFHYab1NCL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-08_02,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=999
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202080053

DQoNCk9uIDA4LjAyLjIyIDExOjEzLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDguMDIuMjAy
MiAwOTozMiwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBPbiAwNy4wMi4yMiAx
ODoyOCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMDQuMDIuMjAyMiAwNzozNCwgT2xla3Nh
bmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+IEBAIC0xNTA3LDYgKzE1MTEsOCBAQCBzdGF0
aWMgaW50IGFzc2lnbl9kZXZpY2Uoc3RydWN0IGRvbWFpbiAqZCwgdTE2IHNlZywgdTggYnVzLCB1
OCBkZXZmbiwgdTMyIGZsYWcpDQo+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBjaV90
b19kZXYocGRldiksIGZsYWcpOw0KPj4+PiAgICAgICAgfQ0KPj4+PiAgICANCj4+Pj4gKyAgICBy
YyA9IHZwY2lfYXNzaWduX2RldmljZShkLCBwZGV2KTsNCj4+Pj4gKw0KPj4+PiAgICAgZG9uZToN
Cj4+Pj4gICAgICAgIGlmICggcmMgKQ0KPj4+PiAgICAgICAgICAgIHByaW50ayhYRU5MT0dfR19X
QVJOSU5HICIlcGQ6IGFzc2lnbiAoJXBwKSBmYWlsZWQgKCVkKVxuIiwNCj4+PiBUaGVyZSdzIG5v
IGF0dGVtcHQgdG8gdW5kbyBhbnl0aGluZyBpbiB0aGUgY2FzZSBvZiBnZXR0aW5nIGJhY2sgYW4N
Cj4+PiBlcnJvci4gSVNUUiB0aGlzIGJlaW5nIGRlZW1lZCBva2F5IG9uIHRoZSBiYXNpcyB0aGF0
IHRoZSB0b29sIHN0YWNrDQo+Pj4gd291bGQgdGhlbiB0YWtlIHdoYXRldmVyIGFjdGlvbiwgYnV0
IHdoYXRldmVyIGl0IGlzIHRoYXQgaXMgc3VwcG9zZWQNCj4+PiB0byBkZWFsIHdpdGggZXJyb3Jz
IGhlcmUgd2FudHMgc3BlbGxpbmcgb3V0IGluIHRoZSBkZXNjcmlwdGlvbi4NCj4+IFdoeT8gSSBk
b24ndCBjaGFuZ2UgdGhlIHByZXZpb3VzbHkgZXhwZWN0ZWQgZGVjaXNpb24gYW5kIGltcGxlbWVu
dGF0aW9uDQo+PiBvZiB0aGUgYXNzaWduX2RldmljZSBmdW5jdGlvbjogSSB1c2UgZXJyb3IgcGF0
aHMgYXMgdGhleSB3ZXJlIHVzZWQgYmVmb3JlDQo+PiBmb3IgdGhlIGV4aXN0aW5nIGNvZGUuIFNv
LCBJIHNlZSBubyBjbGVhciByZWFzb24gdG8gc3RyZXNzIHRoYXQgdGhlIGV4aXN0aW5nDQo+PiBh
bmQgbmV3IGNvZGUgcmVsaWVzIG9uIHRoZSB0b29sc3RhY2sNCj4gU2F5aW5nIGhhbGYgYSBzZW50
ZW5jZSBvbiB0aGlzIGlzIGhlbHBpbmcgcmV2aWV3Lg0KT2sNCj4NCj4+PiBXaGF0J3MgaW1wb3J0
YW50IGlzIHRoYXQgbm8gY2FsbGVyIHVwIHRoZSBjYWxsIHRyZWUgbWF5IGJlIGxlZnQgd2l0aA0K
Pj4+IHRoZSBpbXByZXNzaW9uIHRoYXQgdGhlIGRldmljZSBpcyBzdGlsbCBvd25lZCBieSB0aGUg
b3JpZ2luYWwNCj4+PiBkb21haW4uIFdpdGggaG93IHlvdSBoYXZlIGl0LCB0aGUgZGV2aWNlIGlz
IGdvaW5nIHRvIGJlIG93bmVkIGJ5IHRoZQ0KPj4+IG5ldyBkb21haW4sIGJ1dCBub3QgcmVhbGx5
IHVzYWJsZS4NCj4+IFRoaXMgaXMgbm90IHRydWU6IHZwY2lfYXNzaWduX2RldmljZSB3aWxsIGNh
bGwgdnBjaV9kZWFzc2lnbl9kZXZpY2UNCj4+IGludGVybmFsbHkgaWYgaXQgZmFpbHMuIFNvLCB0
aGUgZGV2aWNlIHdvbid0IGJlIGFzc2lnbmVkIGluIHRoaXMgY2FzZQ0KPiBOby4gVGhlIGRldmlj
ZSBpcyBhc3NpZ25lZCB0byB3aGF0ZXZlciBwZGV2LT5kb21haW4gaG9sZHMuIENhbGxpbmcNCj4g
dnBjaV9kZWFzc2lnbl9kZXZpY2UoKSB0aGVyZSBtZXJlbHkgbWFrZXMgc3VyZSB0aGF0IHRoZSBk
ZXZpY2Ugd2lsbA0KPiBoYXZlIF9ub18gdlBDSSBkYXRhIGFuZCBob29rcyBpbiBwbGFjZSwgcmF0
aGVyIHRoYW4gc29tZXRoaW5nDQo+IHBhcnRpYWwuDQpTbywgdGhpcyBwYXRjaCBpcyBvbmx5IGRl
YWxpbmcgd2l0aCB2cGNpIGFzc2lnbi9kZS1hc3NpZ24NCkFuZCBpdCByb2xscyBiYWNrIHdoYXQg
aXQgZGlkIGluIGNhc2Ugb2YgYSBmYWlsdXJlDQpJdCBhbHNvIHJldHVybnMgcmMgaW4gYXNzaWdu
X2RldmljZSB0byBzaWduYWwgaXQgaGFzIGZhaWxlZA0KV2hhdCBlbHNlIGlzIGV4cGVjdGVkIGZy
b20gdGhpcyBwYXRjaD8/DQo+DQo+Pj4+IC0tLSBhL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jDQo+
Pj4+ICsrKyBiL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jDQo+Pj4+IEBAIC05OSw2ICs5OSwzMyBA
QCBpbnQgdnBjaV9hZGRfaGFuZGxlcnMoc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+Pj4+ICAgIA0K
Pj4+PiAgICAgICAgcmV0dXJuIHJjOw0KPj4+PiAgICB9DQo+Pj4+ICsNCj4+Pj4gKyNpZmRlZiBD
T05GSUdfSEFTX1ZQQ0lfR1VFU1RfU1VQUE9SVA0KPj4+PiArLyogTm90aWZ5IHZQQ0kgdGhhdCBk
ZXZpY2UgaXMgYXNzaWduZWQgdG8gZ3Vlc3QuICovDQo+Pj4+ICtpbnQgdnBjaV9hc3NpZ25fZGV2
aWNlKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4+PiArew0KPj4+
PiArICAgIGludCByYzsNCj4+Pj4gKw0KPj4+PiArICAgIGlmICggIWhhc192cGNpKGQpICkNCj4+
Pj4gKyAgICAgICAgcmV0dXJuIDA7DQo+Pj4+ICsNCj4+Pj4gKyAgICByYyA9IHZwY2lfYWRkX2hh
bmRsZXJzKHBkZXYpOw0KPj4+PiArICAgIGlmICggcmMgKQ0KPj4+PiArICAgICAgICB2cGNpX2Rl
YXNzaWduX2RldmljZShkLCBwZGV2KTsNCj4+Pj4gKw0KPj4+PiArICAgIHJldHVybiByYzsNCj4+
Pj4gK30NCj4+Pj4gKw0KPj4+PiArLyogTm90aWZ5IHZQQ0kgdGhhdCBkZXZpY2UgaXMgZGUtYXNz
aWduZWQgZnJvbSBndWVzdC4gKi8NCj4+Pj4gK3ZvaWQgdnBjaV9kZWFzc2lnbl9kZXZpY2Uoc3Ry
dWN0IGRvbWFpbiAqZCwgc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+Pj4+ICt7DQo+Pj4+ICsgICAg
aWYgKCAhaGFzX3ZwY2koZCkgKQ0KPj4+PiArICAgICAgICByZXR1cm47DQo+Pj4+ICsNCj4+Pj4g
KyAgICB2cGNpX3JlbW92ZV9kZXZpY2UocGRldik7DQo+Pj4+ICt9DQo+Pj4+ICsjZW5kaWYgLyog
Q09ORklHX0hBU19WUENJX0dVRVNUX1NVUFBPUlQgKi8NCj4+PiBXaGlsZSBmb3IgdGhlIGxhdHRl
ciBmdW5jdGlvbiB5b3UgbG9vayB0byBuZWVkIHR3byBwYXJhbWV0ZXJzLCBkbyB5b3UNCj4+PiBy
ZWFsbHkgbmVlZCB0aGVtIGFsc28gaW4gdGhlIGZvcm1lciBvbmU/DQo+PiBEbyB5b3UgbWVhbiBp
bnN0ZWFkIG9mIHBhc3NpbmcgZCB3ZSBjb3VsZCBqdXN0IHVzZSBwZGV2LT5kb21haW4/DQo+PiBp
bnQgdnBjaV9hc3NpZ25fZGV2aWNlKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4gK3sNCj4+ICvC
oMKgwqAgaW50IHJjOw0KPj4gKw0KPj4gK8KgwqDCoCBpZiAoICFoYXNfdnBjaShwZGV2LT5kb21h
aW4pICkNCj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gMDsNCj4gWWVzLg0KPg0KPj4gWWVzLCB3
ZSBwcm9iYWJseSBjYW4sIGJ1dCB0aGUgcmVzdCBvZiBmdW5jdGlvbnMgY2FsbGVkIGZyb20gYXNz
aWduX2RldmljZQ0KPj4gYXJlIGFjY2VwdGluZyBib3RoIGQgYW5kIHBkZXYsIHNvIG5vdCBzdXJl
IHdoeSB3b3VsZCB3ZSB3YW50IHRoZXNlDQo+PiB0d28gYmUgYW55IGRpZmZlcmVudC4gQW55IGdv
b2QgcmVhc29uIG5vdCB0byBjaGFuZ2Ugb3RoZXJzIGFzIHdlbGwgdGhlbj8NCj4gWWVzOiBQcmlv
ciB0byB0aGUgY2FsbCBvZiB0aGUgLT5hc3NpZ25fZGV2aWNlKCkgaG9vaywgZCAhPSBwZGV2LT5k
b21haW4uDQo+IEl0IGlzIHRoZSBfcHVycG9zZV8gb2YgdGhpcyBmdW5jdGlvbiB0byBjaGFuZ2Ug
b3duZXJzaGlwIG9mIHRoZSBkZXZpY2UuDQpUaGlzIGNhbiBiZSBkb25lIGFuZCBtYWtlcyBzZW5z
ZS4NCkBSb2dlciB3aGljaCB3YXkgZG8geW91IHdhbnQgdGhpcz8NCj4NCj4gSmFuDQo+DQpUaGFu
ayB5b3UsDQpPbGVrc2FuZHI=

