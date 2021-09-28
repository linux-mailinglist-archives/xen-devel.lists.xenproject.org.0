Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4E641AB41
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 10:54:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197826.351086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV8sQ-0007Rl-RM; Tue, 28 Sep 2021 08:54:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197826.351086; Tue, 28 Sep 2021 08:54:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV8sQ-0007OI-NN; Tue, 28 Sep 2021 08:54:14 +0000
Received: by outflank-mailman (input) for mailman id 197826;
 Tue, 28 Sep 2021 08:54:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7uFz=OS=epam.com=prvs=0905849383=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mV8sP-0007OA-Ta
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 08:54:13 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 45b2ca14-2f09-4759-940e-c07ea932a28e;
 Tue, 28 Sep 2021 08:54:12 +0000 (UTC)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18S8hrRK019874; 
 Tue, 28 Sep 2021 08:54:10 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2108.outbound.protection.outlook.com [104.47.17.108])
 by mx0a-0039f301.pphosted.com with ESMTP id 3bbyswr1dg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Sep 2021 08:54:10 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by VI1PR0302MB3373.eurprd03.prod.outlook.com (2603:10a6:803:1b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Tue, 28 Sep
 2021 08:54:07 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%4]) with mapi id 15.20.4544.022; Tue, 28 Sep 2021
 08:54:07 +0000
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
X-Inumbo-ID: 45b2ca14-2f09-4759-940e-c07ea932a28e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WJpZUAn3EewuJHqzwk5DjPkkiGUistcphTQrl5SvPgjIJhs3i2ePy3Le+bLkmhJmM7SAXRwHEkcJZYsBOujF0b/B0dbLZQ6lJ24SuFSeuot92chhlVY8rpipY9UDMagmBGFF1sBCC4tTRMGKRs6OOZ+muaZTQxKY0p4EmddLGWOX5xWAkHmM5nLM2G55hvFAEksERbl3sN0CjpapAJfdwaGB9XynV0s4ootLbMX2x9LOPAyVhqitRv4G5Ai38UgivIAsWPOPKGsH35Di+K/dQTkqdSRh4th4xTAoPovMOzd1x1r+6Ic+Fy6ZVTv1Ag062bXbl/OMlOMQIU3EFgIUvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=IIQevOMQJIRgCmbg2Gul4rFNu8ZCy7XbPNgMYMOOn7I=;
 b=Czq59T7tz+cnQiZjQwNBvOF2hZaz/GJFvlFHGaMHZBN8Cc1s655nXERS7l/tCZUVx2819sD5BWAEQAHLye4WIuWmEGzfYXHBoxae07aricYTAJKptFXJS2ykflWFlfgHMFoeUigwAeGGhPlGytblUCOm+j3ANis++bMOJKdgMr2lyzHNSjq5k+VS2LWkRr7HllqppR6Hd7zsZPr/lt3qHc+8DxFoNNIX3DzC5ZjEzIkdiH0nBrbKt/oyzaC6HiXyMd7crNYkbQ9lvly9FPwkuRx8nZ1LU8V5E0qiRMl1EzzGFICGAw2mhIq0RFlvRNXZMJTA6Blkb5wuBUWa/2a5cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IIQevOMQJIRgCmbg2Gul4rFNu8ZCy7XbPNgMYMOOn7I=;
 b=F53t8ZrMFUlzvQ540yoXU4Px+WSEv5CqQE2Fyv3TH8F4KuKkQ3nX2YOaixtgjEr42NzPY5Ozv+TmEEmAh5lQ8DgUSsYMUPyInsqKJubQc4TPHjkko5gaYXVl6JldXsfkmAVIEnDKrJAovZ5/rxOXoKrRhuGvucGMNkb0SXaXlXaNvbpGrha3tLE9lFth7unWAF7+/2lA/ayc99TRa75ztsqg4vV47/ofxCr8VuoFXuaPXMo0EdBhx5fn3jmMRF98tBsRBY6+3ykusXPLvyqbxVC2yMifVZgvqA68tPNNWJgh0KOLi0V09cgKfmKdNeuVjeMOiChG3oBShLDwRKRikQ==
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
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v2 05/11] xen/arm: Mark device as PCI while creating one
Thread-Topic: [PATCH v2 05/11] xen/arm: Mark device as PCI while creating one
Thread-Index: 
 AQHXsHoyHtx3VKSfZEKPQekyrs7GEau3hnIAgAAQrICAAAldgIAABLUAgAAG9wCAAAEGAIAABhwAgAFsAgCAAATGgIAAAMUAgAADA4CAAAP7AA==
Date: Tue, 28 Sep 2021 08:54:07 +0000
Message-ID: <9a9d9517-f868-69a6-f75f-751a3828a926@epam.com>
References: <20210923125438.234162-1-andr2000@gmail.com>
 <20210923125438.234162-6-andr2000@gmail.com>
 <443f57db-7b0d-e14a-88bb-78a31c0271d6@suse.com>
 <55beed13-3a7f-7269-870c-ee0361e23a1c@epam.com>
 <7b093c2f-33cf-ac9d-9583-f0d8b2bb4f48@suse.com>
 <23ae58de-6bd0-b299-a7d9-e6433d1b0689@epam.com>
 <56d30f56-d9fb-e7ca-f3e1-6795973d648c@suse.com>
 <a119740d-02c2-315f-432e-67aec806ada6@epam.com>
 <6eefff6f-97ed-e7f5-37f2-96065bd1f27e@suse.com>
 <2e8f4316-002f-17d8-b9ec-9886c6bc28fa@epam.com>
 <31dc3429-b1f4-85ab-968d-c9054b77ac4f@suse.com>
 <13b9cc76-c7e0-be7e-61d3-fc42a41dcc58@epam.com>
 <8a3c020c-687c-1818-3a0f-5e8a553fe58e@suse.com>
In-Reply-To: <8a3c020c-687c-1818-3a0f-5e8a553fe58e@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ffd81a5e-1e72-43e1-cee0-08d9825d87ed
x-ms-traffictypediagnostic: VI1PR0302MB3373:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VI1PR0302MB3373B6DA3ECA9F04F44E1B5CE7A89@VI1PR0302MB3373.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 M/G4b95sJ13PHHQwVv32DYRmGJJYfp52XJsQNOV1Fd6M9P0FdnNHxoyqriv/JIcKD6ZYEuKQSaR3tq2VCWIesFnmobSbLoCzFbr2h8zItvnFmia1am0OkLyazZWFqQlFdUyYUt10v7ooiYLZJnrCqO7PY9J1m0wuZ/392wG7YPoP2UmwY3zxYmNECD9s4g7iJ+QHv/900A9jpbxH9sDfYkZOm+vIVWnu36aohhqRsK1RalLC+wiIuG9Zj+XpnAI8PM2hOdCvq5DCULfnf5vBWwjtWyGNbq4t12SzRfyuFjeUHeCpQmHNIKoM71TEUaDJGVZA8RSEUULfcOlcYNEWA47fcWCIMMxhIieuBthbXQFiP/NSaro80UinpUqzQNqWIZIHaUp051vPOf5XBKPfyPiRMEQ02PC4R2MAqXn0Dlsdq2Kj6l2R6aZ80od2GLzq3QpTdo0ytpybfpZ0bPgWOGQRhWN3K8zMZBz4QM9PmmnYbFN1pw/lQgjg1QU1vYWHePx8oo77PuGbcBKBdOjLkPDK/LzslTzW1zHdLOz7p/pXLaqzL3LFn7upi/svpyAtuD0v5ihZVW9GQe9UqXOjn4d2GaYJgI9hFQLmsigo3jW8qf4x84X48iTBvHjNdZta48PLSDC2J/MPJ1iz+0vUIOqCdBcGyOT/jQbF1i1m5CNHb0RCaSFTDO4/erC8KvdsHPNks5bzhqmYCGSuF9Y6DUJFNSHdv24hiYlI3CbBBPUdpoy5qzV35B1TDpZEoZoB
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(66476007)(5660300002)(55236004)(53546011)(2616005)(6506007)(54906003)(6916009)(186003)(31696002)(2906002)(6486002)(66556008)(316002)(38100700002)(64756008)(66446008)(122000001)(76116006)(71200400001)(91956017)(508600001)(26005)(31686004)(86362001)(66946007)(107886003)(38070700005)(8676002)(6512007)(8936002)(36756003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WFB1L2w5RnU3TEMzZW9kVjZCeDVNVmJtQjVJbWlRVW1HUThHNGxJSUN1QUo0?=
 =?utf-8?B?UURwS3hxRHN4dFl2dFUvYjFPQnZ2SmNuNFROZTJyakU1VmpPSStjLzhuckpn?=
 =?utf-8?B?RThXQmhTNVJZY0Mzd3lLUFN5bjFlaVRVY2lSNnJTS0U5R2h1TzFMa1p3cG54?=
 =?utf-8?B?TTRvS1Z5bWJ1WVVveml4VkViVXZYZGRFLzBacXZHMEtDZ1Z2aUhRSkRMdy9R?=
 =?utf-8?B?c3JyZ2V0SWVmR3N6bTlNc0xHQkxrSkU1TTVlaEdSVlY0SGdqNkV3c2xEUGZR?=
 =?utf-8?B?cXovMEVLS3BpWmh2QXF4ZzNTL2s4cEdzcmQvOVpSbjk1NCt0WjJVcTJtY1Z4?=
 =?utf-8?B?VUd3b2VjbDdUVUVyUEkzMjQ4QnpFSjBsd2tmWUxOZ2s1UzgxZktBY0FXMEpo?=
 =?utf-8?B?MGtMNkIxbDZCTjRqY0V5ZFpUS1BhVS9sdXhUemtlM0J3aWlCcnNMU2tuMkZo?=
 =?utf-8?B?aURJeUpzVDM3bE1jbmRhcWsvMTJyY05HMzVXMDAyYmlzZTdVNnVTc21pNFIx?=
 =?utf-8?B?bUNEenpKS2VBUk5MWG1Ec2R3N1hIMHVOQVlzTTR6OHgwVG9KV3cvemFmRnha?=
 =?utf-8?B?WUc3RTErNEVLUWhUZHJxclFaOThnRm5YY3R4UnB2eElyNUZEVlM5RVRnakR3?=
 =?utf-8?B?YW95ZWR6MHZPazF3eTg3Wmh5b0lrWmRKbkxuNEpSb2EwTE9xWEVlQU1wNnVl?=
 =?utf-8?B?VFl3SlJrazA2T3NFWWxrOVJDcTRhTnBvTkVHN1BxbzdMWFlKNTZ0bld0RjRD?=
 =?utf-8?B?ZGlnSnJYOUE5YldPUjVhRExjbHl1L2JtNHFmc0JuM2JpRXhNdjdBNUwvVnpJ?=
 =?utf-8?B?RzlkWGRteWwzZmRqdTVnY0dJYTVmWU53bGpKWlhIclNSWkcxQzNrUExBL1VG?=
 =?utf-8?B?ZnJLaFdOcFlJd2tTeEMzaG81N0lBY3RWV3JKdGN0SGU1Rk1iU3dBRkhrM25t?=
 =?utf-8?B?WHo1Kzh4aHV5bmVBWWhLTWNZMWgyZFd5YitaVzVwZ3d4ZHpMQmo4U1czQ2w2?=
 =?utf-8?B?ZkN6ODRhVDJJK3p1cjBUOXI4WjBVWkxHUlVKY0ppMWFxV2tub00zZFJnS3Vh?=
 =?utf-8?B?aE1wVXhhUGR3NENRTzNHbHBVMElDaW5rNHV0MUVOdk9MK29xQmpYa0xYMndC?=
 =?utf-8?B?VFkzRkdXS21EQ1RWdkg1NjJsRStYdCt6bFo2eHk4ZXhPK2xaYk1wWXI5eVZO?=
 =?utf-8?B?aFZneHN4Q0RwRS9jVnBDcXdhR2h1VE5xZVRJTjgwdGxJTDJ3TlVpN2tLeVU3?=
 =?utf-8?B?SVBRNHhUZmhUY3JuWVNQcWxsZmVEUkdxRDZTS0FFZlpiRVNuT0piZE1xclZ4?=
 =?utf-8?B?d2ZDeVU5TGRNOGJ5VG5TT3N0Z3c1L1ZvZGd4NnlxQnJDSUlQYkJ6ZmI3cW9F?=
 =?utf-8?B?MmNMTmJjSm96TzJpQ1I5bFUwSWNUL0tnSll4Z3lTVDlTVGljc1VVVW9aSlJR?=
 =?utf-8?B?eGVETFFtclYvTy83aVh0dHhPbUVxY0Mxdm0vK1Rrb2cxTHdOTURYVUxxck9G?=
 =?utf-8?B?NGhwbnNsQzdxQmtoTFlMcEhhdWFIUzB4cHM0SXkySEtxa2FmT3NmbzgrYzB1?=
 =?utf-8?B?Qk05MEJiUm16bUl1S0dhWGoxSjhLTGJONDBKWG9PajBkdy9nZUdRQVlFV2pZ?=
 =?utf-8?B?TVJOdTdBUnM4em9iaHR1eENjbzltQ1BFV2NwOWpidTJkZStYRzIzOXhnQmtx?=
 =?utf-8?B?SXVoMms4dnBQd1JzZ3JsWmowcUlCY2J4U2lqcUhWckRTb2VKUm9oR0t2QldW?=
 =?utf-8?B?MTNWcXhzZnYvMXEwTW1iNDZvb2FhaXhEUmRFeVkrOXVzN0QrdVUybE1rZlBB?=
 =?utf-8?B?K0FsUmlUUTZSUWFoNUd0QT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C52C4DC56FCF4845831D84BE518C2533@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffd81a5e-1e72-43e1-cee0-08d9825d87ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2021 08:54:07.2459
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yjgrud8uJvszmjTVCXPwx5JoZS/lSkrqPE/JQPvAOF5n7Dr28xofzxZNUZk6R+kHbXHTGCXE1eH1QNTLmClbRh/zHFj6ZVWEXTmsJovmeSByhxy/bJnY35C48x+N26ZQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB3373
X-Proofpoint-ORIG-GUID: z1mrsMWg4SI4tIaQcOJ8S1fuCCu8EkjK
X-Proofpoint-GUID: z1mrsMWg4SI4tIaQcOJ8S1fuCCu8EkjK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-28_04,2021-09-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 mlxlogscore=999 mlxscore=0 adultscore=0 priorityscore=1501 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2109280052

DQpPbiAyOC4wOS4yMSAxMTozOSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDI4LjA5LjIwMjEg
MTA6MjksIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gT24gMjguMDkuMjEgMTE6
MjYsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDI4LjA5LjIwMjEgMTA6MDksIE9sZWtzYW5k
ciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiBPbiAyNy4wOS4yMSAxMzoyNiwgSmFuIEJldWxp
Y2ggd3JvdGU6DQo+Pj4+PiBPbiAyNy4wOS4yMDIxIDEyOjA0LCBPbGVrc2FuZHIgQW5kcnVzaGNo
ZW5rbyB3cm90ZToNCj4+Pj4+PiBPbiAyNy4wOS4yMSAxMzowMCwgSmFuIEJldWxpY2ggd3JvdGU6
DQo+Pj4+Pj4+IE9uIDI3LjA5LjIwMjEgMTE6MzUsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdy
b3RlOg0KPj4+Pj4+Pj4gT24gMjcuMDkuMjEgMTI6MTksIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+
Pj4+Pj4+IE9uIDI3LjA5LjIwMjEgMTA6NDUsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3Rl
Og0KPj4+Pj4+Pj4+PiBPbiAyNy4wOS4yMSAxMDo0NSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+
Pj4+Pj4+PiBPbiAyMy4wOS4yMDIxIDE0OjU0LCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90
ZToNCj4+Pj4+Pj4+Pj4+PiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYw0KPj4+
Pj4+Pj4+Pj4+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jDQo+Pj4+Pj4+Pj4+
Pj4gQEAgLTMyOCw2ICszMjgsOSBAQCBzdGF0aWMgc3RydWN0IHBjaV9kZXYgKmFsbG9jX3BkZXYo
c3RydWN0IHBjaV9zZWcgKnBzZWcsIHU4IGJ1cywgdTggZGV2Zm4pDQo+Pj4+Pj4+Pj4+Pj4gICAg
ICAgICAgICAqKCh1OCopICZwZGV2LT5idXMpID0gYnVzOw0KPj4+Pj4+Pj4+Pj4+ICAgICAgICAg
ICAgKigodTgqKSAmcGRldi0+ZGV2Zm4pID0gZGV2Zm47DQo+Pj4+Pj4+Pj4+Pj4gICAgICAgICAg
ICBwZGV2LT5kb21haW4gPSBOVUxMOw0KPj4+Pj4+Pj4+Pj4+ICsjaWZkZWYgQ09ORklHX0FSTQ0K
Pj4+Pj4+Pj4+Pj4+ICsgICAgcGNpX3RvX2RldihwZGV2KS0+dHlwZSA9IERFVl9QQ0k7DQo+Pj4+
Pj4+Pj4+Pj4gKyNlbmRpZg0KPj4+Pj4+Pj4+Pj4gSSBoYXZlIHRvIGFkbWl0IHRoYXQgSSdtIG5v
dCBoYXBweSBhYm91dCBuZXcgQ09ORklHXzxhcmNoPiBjb25kaXRpb25hbHMNCj4+Pj4+Pj4+Pj4+
IGhlcmUuIEknZCBwcmVmZXIgdG8gc2VlIHRoaXMgZG9uZSBieSBhIG5ldyBhcmNoIGhlbHBlciwg
dW5sZXNzIHRoZXJlIGFyZQ0KPj4+Pj4+Pj4+Pj4gb2JzdGFjbGVzIEknbSBvdmVybG9va2luZy4N
Cj4+Pj4+Pj4+Pj4gRG8geW91IG1lYW4gc29tZXRoaW5nIGxpa2UgYXJjaF9wY2lfYWxsb2NfcGRl
dihkZXYpPw0KPj4+Pj4+Pj4+IEknZCByZWNvbW1lbmQgYWdhaW5zdCAiYWxsb2MiIGluIGl0cyBu
YW1lOyAibmV3IiBpbnN0ZWFkIG1heWJlPw0KPj4+Pj4+Pj4gSSBhbSBmaW5lIHdpdGggYXJjaF9w
Y2lfbmV3X3BkZXYsIGJ1dCBhcmNoIHByZWZpeCBwb2ludHMgdG8gdGhlIGZhY3QgdGhhdA0KPj4+
Pj4+Pj4gdGhpcyBpcyBqdXN0IGFuIGFyY2hpdGVjdHVyZSBzcGVjaWZpYyBwYXJ0IG9mIHRoZSBw
ZGV2IGFsbG9jYXRpb24gcmF0aGVyIHRoYW4NCj4+Pj4+Pj4+IGFjdHVhbCBwZGV2IGFsbG9jYXRp
b24gaXRzZWxmLCBzbyB3aXRoIHRoaXMgcmVzcGVjdCBhcmNoX3BjaV9hbGxvY19wZGV2IHNlZW1z
DQo+Pj4+Pj4+PiBtb3JlIG5hdHVyYWwgdG8gbWUuDQo+Pj4+Pj4+IFRoZSBidWxrIG9mIHRoZSBm
dW5jdGlvbiBpcyBhYm91dCBwb3B1bGF0aW5nIHRoZSBqdXN0IGFsbG9jYXRlZCBzdHJ1Y3QuDQo+
Pj4+Pj4+IFRoZXJlJ3Mgbm8gYXJjaC1zcGVjaWZpYyBwYXJ0IG9mIHRoZSBhbGxvY2F0aW9uIChz
byBmYXIsIGxlYXZpbmcgYXNpZGUNCj4+Pj4+Pj4gTVNJLVgpLCB5b3Ugb25seSB3YW50IGFuZCBh
cmNoLXNwZWNpZmljIHBhcnQgb2YgdGhlIGluaXRpYWxpemF0aW9uLiBJDQo+Pj4+Pj4+IHdvdWxk
IGFncmVlIHdpdGggImFsbG9jIiBpbiB0aGUgbmFtZSBpZiBmdXJ0aGVyIGFsbG9jYXRpb24gd2Fz
IHRvDQo+Pj4+Pj4+IGhhcHBlbiB0aGVyZS4NCj4+Pj4+PiBIbSwgdGhlbiBhcmNoX3BjaV9pbml0
X3BkZXYgc291bmRzIG1vcmUgcmVhc29uYWJsZQ0KPj4+Pj4gRmluZSB3aXRoIG1lLg0KPj4+PiBE
byB3ZSB3YW50IHRoaXMgdG8gYmUgdm9pZCBvciByZXR1cm5pbmcgYW4gZXJyb3IgY29kZT8gSWYg
ZXJyb3IgY29kZSBpcyBuZWVkZWQsDQo+Pj4+IHRoZW4gd2Ugd291bGQgYWxzbyBuZWVkIGEgcm9s
bC1iYWNrIGZ1bmN0aW9uLCBlLmcuIGFyY2hfcGNpX2ZyZWVfcGRldiBvcg0KPj4+PiBhcmNoX3Bj
aV9yZWxlYXNlX3BkZXYgb3IgYXJjaF9wY2lfZmluaV9wZGV2IG9yIHNvbWV0aGluZywgc28gaXQg
Y2FuIGJlIHVzZWQgaW4NCj4+Pj4gY2FzZSBvZiBlcnJvciBvciBpbiBmcmVlX3BkZXYgZnVuY3Rp
b24uDQo+Pj4gSSdkIHN0YXJ0IHdpdGggdm9pZCBhbmQgbWFrZSBpdCByZXR1cm4gYW4gZXJyb3Ig
KGFuZCBkZWFsIHdpdGggbmVjZXNzYXJ5DQo+Pj4gY2xlYW51cCkgb25seSBvbmNlIGEgbmVlZCBh
cmlzZXMuDQo+PiBTb3VuZHMgcmVhc29uYWJsZS4gRm9yIHg4NiBJIHRoaW5rIHdlIGNhbiBkZWFs
IHdpdGg6DQo+Pg0KPj4geGVuL2luY2x1ZGUveGVuL3BjaS5oOg0KPj4NCj4+ICNpZmRlZiBDT05G
SUdfQVJNDQo+PiB2b2lkIGFyY2hfcGNpX2luaXRfcGRldihzdHJ1Y3QgcGNpX2RldiAqcGRldik7
DQo+PiAjZWxzZQ0KPj4gc3RhdGljIGlubGluZSB2b2lkIGFyY2hfcGNpX2luaXRfcGRldihzdHJ1
Y3QgcGNpX2RldiAqcGRldikNCj4+IHsNCj4+ICAgwqDCoMKgIHJldHVybiAwOw0KPj4gfQ0KPj4g
I2VuZGlmDQo+IEJ1dCB0aGF0J3Mgc3RpbGwgI2lmZGVmLWFyeS4gV2UgaGF2ZSBhc20vcGNpLmgu
DQpTdXJlLCB3aWxsIGRlZmluZSBpdCB0aGVyZQ0KPg0KPiBKYW4NCj4NCj4NClRoYW5rIHlvdSwN
Cg0KT2xla3NhbmRyDQo=

