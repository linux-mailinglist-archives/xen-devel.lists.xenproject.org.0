Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC17E4AC4E6
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 17:08:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267198.460916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH6YR-0006pA-9N; Mon, 07 Feb 2022 16:07:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267198.460916; Mon, 07 Feb 2022 16:07:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH6YR-0006nJ-61; Mon, 07 Feb 2022 16:07:51 +0000
Received: by outflank-mailman (input) for mailman id 267198;
 Mon, 07 Feb 2022 16:07:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F54n=SW=epam.com=prvs=403792ff6c=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nH6YP-0006nD-75
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 16:07:49 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 160effd0-8830-11ec-8f75-fffcc8bd4f1a;
 Mon, 07 Feb 2022 17:07:46 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 217EEi4D023735;
 Mon, 7 Feb 2022 16:07:42 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2055.outbound.protection.outlook.com [104.47.13.55])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3e350urgmf-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 16:07:42 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by PR3PR03MB6409.eurprd03.prod.outlook.com (2603:10a6:102:74::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Mon, 7 Feb
 2022 16:07:38 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77%3]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 16:07:38 +0000
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
X-Inumbo-ID: 160effd0-8830-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Db5XRegZ9noZ4BFAvJ06I3iB+a5F++lHaN4r0bbpg8+lrxeK8ZAFd3HI9wvPfGyx3tfUS7yF+8QhiH6Hgil2zAZV2o2S5VuUG+x58wih48uqSj5Umzq0iEhpU2KUQns6j3I5Ay84i0rx9Q0oO3et8L4H85ISb6/l9z5MoIVrKxutxh3V3supLolBmP4i0LycfssXNhLTMUIGPwsM8UBgdZxJ1qEW3OJsuHAx7oIVrhNAaryLK3WH1hU7kOdWE4qa3H3jqEzYBp6ItM+ET5i6OdzYW8Xr/Ex8MCG4JxQ1ns9vbDQWOzHmvbCgB1n7FqVjnlZPZSbKFn82dqwAOVq/hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+SWn2Kpgl1k1I3RrcfPxZW18O59t4Yy656K63/S4fUQ=;
 b=mwXNERONey6NLI1cezvHSu6WjSBlkxI13uzT2Cf7iE0u49WG3U0wOwuxPbA0oXloQqKwktULr9AossJBY+ZkW4YxETF6jJOhi2uagUddQUP9CZUeq42FiW35gF7A0k8WoUABlS5Bi5joCGK4ykG53fEQ9ibsrYfPZi5JAFtJzUDUHoJlWAzdWYhDe0C4nUTFs6jJtzJymQ4OwCaO8amF6G4mIH4cgQmstdTVDNBmVGI+KI8RMij23p0RmMYZDzZF9A+Ghgvnc1UENFRQWyphuZq06mzVs84aZd8xnQoIlqeC4cE1cbsdCaaL4B6OWZqIZJak1Cl1Jtanbf11xcletw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+SWn2Kpgl1k1I3RrcfPxZW18O59t4Yy656K63/S4fUQ=;
 b=nnjyWfCTaAZl8f3nrPfrFiRR0YioORJ0+b6z8r2X5ejpXGmlmAGpBM817vpt5OxBxCZ3bfsv7fUvPwixc2GgtJui2QbJcU33dE63eElhuBMP2GOxwS4lBN9IN8shuK670y/o6GngwlzNBdB5OWRx4fhsYVOsq3fWlFFDaZt+0lU0lvOT1SogvZL3S/UkrwR/UuqvZ54rmKFIR0ugmxGEeVotP4H+d0RmomdUptU4s3j2ZV5vVlAQdMKrg1Su0E3arpROUly1of5j04VEHoHZ9Vml0cv8g3e9Hrj6PQnl62CoOv3MSR5BEg+pkVIckgDq+wH+f+Pcy4aurVUo4RFHFQ==
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
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
        "paul@xen.org"
	<paul@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
Subject: Re: [PATCH v6 03/13] vpci: move lock outside of struct vpci
Thread-Topic: [PATCH v6 03/13] vpci: move lock outside of struct vpci
Thread-Index: 
 AQHYGZFc/MnzQOjwVEeBBUHLSW0md6yDBUkAgAASSACAAATYAIAAD/WAgAAKNgCAAAbfgIAABnuAgAAQvgCAAAMCAIAAAY4AgAADxICAABrnAIAABAgAgAR3CoCAABt5gIAAEpuAgAAE5ICAAASKAIAAAiiAgAAKNYCAAARNAIAAC1wA
Date: Mon, 7 Feb 2022 16:07:37 +0000
Message-ID: <4276fe72-558b-7d95-6430-d4330989dbe8@epam.com>
References: <7e3562b5-fc67-f213-e872-f211450d9e2e@epam.com>
 <a8fc599c-f620-c4d1-2077-c57068f46a7f@suse.com>
 <deef8468-d607-e49e-f456-6a8013329ca1@epam.com>
 <Yf0k6aoKK5G3iad1@Air-de-Roger>
 <3ad10a99-c706-b95f-1419-2c0c7cf37d58@epam.com>
 <Yf0+3C9nF8+tewLw@Air-de-Roger>
 <c5fea3bb-834b-eeb7-d7a1-1ee609037a9f@epam.com>
 <YgEUwTxhnWVMGMJK@Air-de-Roger>
 <9ce90193-74a0-5642-d22b-6b8c3340c3cf@epam.com>
 <1f65ae7a-898d-2c27-0ada-d71d778b0627@suse.com>
 <YgEsRuckQJIQlkzf@Air-de-Roger>
 <a2a42c1d-d379-00cd-5d55-f443cdb02e97@epam.com>
 <e8fc7872-c7d0-f389-c507-335b809ffcbc@epam.com>
 <21c8125a-2f79-1a4a-494c-db9e4be2a1a6@suse.com>
In-Reply-To: <21c8125a-2f79-1a4a-494c-db9e4be2a1a6@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b0e3f12e-62f8-460e-ec0a-08d9ea53f610
x-ms-traffictypediagnostic: PR3PR03MB6409:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <PR3PR03MB64096157DDE2AE000208C1BFE72C9@PR3PR03MB6409.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 FKmiA696oJj75rwJ2AWp19xQc2HZlwWVZDE9rl7NW+kOBkaK1WSS1lxXDiTJU7wtGKFNbScOAAArwjXUrIExQRXE/PCuq1oAKllT2n+VBg2w/UUSb4cJIxNsqb6fRcGMQVC/xmlPSGHaLzfNl1tJZxznxwhUKMWRsGTqiscw4aL9UmqQLmaXKzi/N65RP7pCQDorasuB6XYW4wfYg+UZtzkizYpKv0hRpwrKzQyzcU7v5ynlCThMqH5hLyjIOXKPc7AaG/335DcC77k0xLeUhWcfouEkwBNMFrcxQajHqQ+HLU4plAySE4MOIYrZH5tELo7ESNJ0uYwrp30nCEZXe9VZYtQo7aXrzt7GplueFO8sqPXssyDLHvMoxeoAgxlbG82tBaKSXALSihCushvGfxVfh7wwfyKDA2dH7jlU5shEBaxFXBLB5asw+gBsPya5d2skSX4nyHDW/23B72knJdYNkbqL6LkNSMioCVxzyNXONzFpmmzQEk+liRXe9OtkpOQChitOM+AlsbYhNpLJ7DfBTQourR9QqRiskExglleMyujoUTx8PvHJgUPZFUrV+TkZunrzgOXKjHOmFf8KP6acKxV5QFiPX/2Oh+IJG9SbYHQ3lmF1RbO16kdI7STVXSrZGKi9igX6K3pEcE+Cpwpiw61I6825Gpv67T2sjfqZlq3BAVEqVgZUAwLvA2dZl4A9fcnLGEEqXzBEq+d3a3U28I0j2HDu2hpTTFNqlrVrWLzzd155Zjp3kDH6Fu0i
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(36756003)(186003)(6506007)(316002)(54906003)(38070700005)(6512007)(6916009)(71200400001)(2906002)(38100700002)(2616005)(122000001)(55236004)(31686004)(53546011)(31696002)(7416002)(91956017)(86362001)(66946007)(5660300002)(83380400001)(508600001)(6486002)(8936002)(4326008)(8676002)(76116006)(64756008)(66476007)(66446008)(66556008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?V1JDNGVlOHJWYWVxakRrejBSc3g5KzQ0M3pnbEpDTFZISkN6QnpZWWtzeHJD?=
 =?utf-8?B?M1VMYkNYdm54cUVmQTJzclh0bmF6b3ZzOGt2T1RnYTFMRER3S0JCV3F4dlNl?=
 =?utf-8?B?MDkrZENva25zclYySTliRjZ5RHdCeEhBOFhnMzJ1TXMyajZVODJlTzBJcjFP?=
 =?utf-8?B?MDJadjlJYzQ2S1VRZnBvSjRDbjVZdlpkMHh0dW5kQ3BXd1l5SVRKV2NJSFli?=
 =?utf-8?B?OXlMT0haL0s0UUlkbm13UlV0ZlJoWTJ0YVAwU3c1YVorSTNFelhVR0R6ZXdi?=
 =?utf-8?B?cGd2aWNXN3NWbzU4OWdjSWxyUXpRQzNVSlhKK2lZU1hJajZta25obVRybWov?=
 =?utf-8?B?VVdlT1ZSYS8wK2RMNFhVYlpjcTJiWjBwRDJ1NmJyZWIwcWY5VWNZUGxjQ2xB?=
 =?utf-8?B?R2RvOWVBVmRnalVCNXlkL1dRMU5JdVhrbjkxUi92aE5vV2VOcldqbElrM25D?=
 =?utf-8?B?cmNaRGlIMVUyY2JWOGFpVGNYcUxmOWtubjd6K2lIdmdEMXZjZ0lmaFpPbWhC?=
 =?utf-8?B?bHI1Nzg3aUsxbGN3UFB3d09Ja0M1M2NqQjB5OTNyQzE4b3MveTJqRU1lMThB?=
 =?utf-8?B?ZzAraGZZYU9OVi9aMnhWdW1nT2htRG9TUWJDeFNUcXpMd0prSzBIa08wcFZG?=
 =?utf-8?B?bzY4VzdnYlRDTnRYWkRLSTBNR3YvTC85MVhySGYvTWRLVkZZcUFRV1ltRnV3?=
 =?utf-8?B?dFVRQ3RlZWwxaC9jSFMvT0t3R1ZQU0R1V2xHUlhOT3VlWXFNRnJBYjJocFlq?=
 =?utf-8?B?OHdpYThYbE9wL2Q5T2ZrY3NkZ0p2ekw1MVFLSkRCcWpkbkx6VFJnaFRwWUt5?=
 =?utf-8?B?QVR1OVZxL1JwWWZQVklYWHpjcG5mdkhRclV0eFM5Wm1GSThaSnlkMGpIc3hp?=
 =?utf-8?B?bDd5YStOZ3JnOXhBZWpLNDZ0WGJkSUVZc0tIYWR1VmhpQ1NwUmNUdHJUcEc0?=
 =?utf-8?B?MUVYejhrMzFXdzBzaDNHaStlVHJ2eTF0T1dRbVFHdDVrMHZNcEJEMFYrdjJ2?=
 =?utf-8?B?YXpJcG4zM0x6U3FzemxWSEtDQ29oVWxDZ0NmU2ZldHUrTWZnT0J4eFFMeW1R?=
 =?utf-8?B?Y3RDNTZBRzRiVkdJaUJJMExENVFKcnJ5QWljMXVHdUNMdzljTjJzcVVMdTVi?=
 =?utf-8?B?eW1ROE1PY3k1TUdmL3VaMWI3azUrb1BDWEtjQmRPWTd5OERYMUdYTXVaN2Iz?=
 =?utf-8?B?d0dESGwzczVBd1NnZllLVHBTQVhKcjV0WWlWTERESSt2TktKcG91dThCZjdW?=
 =?utf-8?B?TlNDeGtXTmU3b1J0VWlRQjI1VklKS0tQNFhabERucHBaSy9iZWRGWkgya2ly?=
 =?utf-8?B?NXpicnJxV2taQmFXSXp6eXg1d3ZMZkJYbkF4NDBnNVlmK0l5akxtK3lOWENF?=
 =?utf-8?B?V3V0RFNTM09JU1ZZWDFCamFzOWo3ZzN4SzREV3FpcUZDYkE0ZVRlbUtwQllI?=
 =?utf-8?B?R0lQRnhUb2FOS0xwWkd5bDVXTnlwRXRWMDRjcHBwMVQzbUp4RGM2d3pGenNz?=
 =?utf-8?B?NEdSYWhVd0dHSGJrZVEwb2UvZGt1Ly9STFlDMFkwWnVJU3F3bW5ZNmJ4Y1I2?=
 =?utf-8?B?MXdCckNTZWppSEwvMkI1WlhzU1AycW9yclU2WFo4dnQ5ZUdlQXF0YkNuMUZo?=
 =?utf-8?B?T1FOdStLZ1kvUUo3aENZNVd1cWoyb2h1ZndobnB4eFVTTUtZQU4yRFRDYlM4?=
 =?utf-8?B?UERLVHMwd1JpaWpGdjBnTldiSVo0RmNDVHFvSDdOQ2FGOG5qVTRNaFNNUFln?=
 =?utf-8?B?a29mQVQvQTdOZnB4ZmNrdjJVZm9IYThVNEozcFFKeDZsRWh0cWZFOHVpSXB0?=
 =?utf-8?B?MlNXZTZ3eTl5SzU5WGtqM2lXOWRZYm1mL1VqS1VNZkFTSkc0WXRzWDY5eVY4?=
 =?utf-8?B?cnUwaS8zTFdYRGZRbjN6TVZlOFlQYnhjUVdyNFdLSGExUGxDMTdWRGhYeG9T?=
 =?utf-8?B?WGhsNVRIV1Qxb0FkTjNXcGU1TmtzV2syRDA0YjQvZHZHS2lyVGtxdHNXTkZG?=
 =?utf-8?B?YU1HMndkVXA1eHZuYW5jK1JOZm9wVktPY0JZSTM4R3Y4NmxxbWU4TldLSTNS?=
 =?utf-8?B?N2dwLzM5R1BjeVVXRDlGYkw0L0JObnNLalIzdnF6VlE5cTgyLytjWVdObkdH?=
 =?utf-8?B?QlJtckhXR2RITmZ3aXlKb0o1WFZiQkNYRHZyZGNKTUNGTFRPY2o5TU5tZ29x?=
 =?utf-8?B?TUIyTkp5a2lZdlo3UW93S01ydzN0akZ0WHZobGhMNjdlb1FwbWtCa1Q1Umpt?=
 =?utf-8?B?U1MwdHphbWdQZE9TNFArK05BWkc0MVEwOENCcUtmQkN4N05NVFhmWVF1QVoz?=
 =?utf-8?B?NXNVMzhSR3BLUnU3U0kzcVZESTdyaElSR2JiV2NiOG4rZXdaVkEzMmd0Ukkz?=
 =?utf-8?Q?cg/tJXZL7jP3/uJI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CF9E95552CF43D48873BBA15D4B1F04F@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0e3f12e-62f8-460e-ec0a-08d9ea53f610
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2022 16:07:37.9875
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: thoXpcI97TxFpP+X1HRMb2BvhBL2YkXrECkxmb7csKShyqv631pkj1+bPzRgWpqWcu7czdj3+Mc7oRbPAIW8K7yIx3558fzbao6dzXoHyV7Vn6UMGtiRsRi3A5ADGiM9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR03MB6409
X-Proofpoint-GUID: euhFo-nVDmh645TQleWGKeF3ejdhGhi7
X-Proofpoint-ORIG-GUID: euhFo-nVDmh645TQleWGKeF3ejdhGhi7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-07_06,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 impostorscore=0 phishscore=0 mlxscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202070102

DQoNCk9uIDA3LjAyLjIyIDE3OjI2LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDcuMDIuMjAy
MiAxNjoxMSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pg0KPj4gT24gMDcuMDIu
MjIgMTY6MzUsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+IE9uIDA3LjAyLjIy
IDE2OjI3LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPj4+PiBPbiBNb24sIEZlYiAwNywgMjAy
MiBhdCAwMzoxMTowM1BNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+IE9uIDA3LjAy
LjIwMjIgMTQ6NTMsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+Pj4+IE9uIDA3
LjAyLjIyIDE0OjQ2LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPj4+Pj4+PiBJIHRoaW5rIHRo
ZSBwZXItZG9tYWluIHJ3bG9jayBzZWVtcyBsaWtlIGEgZ29vZCBvcHRpb24uIEkgd291bGQgZG8N
Cj4+Pj4+Pj4gdGhhdCBhcyBhIHByZS1wYXRjaC4NCj4+Pj4+PiBJdCBpcy4gQnV0IGl0IHNlZW1z
IGl0IHdvbid0IHNvbHZlIHRoZSB0aGluZyB3ZSBzdGFydGVkIHRoaXMgYWR2ZW50dXJlIGZvcjoN
Cj4+Pj4+Pg0KPj4+Pj4+IFdpdGggcGVyLWRvbWFpbiByZWFkIGxvY2sgYW5kIHN0aWxsIEFCQkEg
aW4gbW9kaWZ5X2JhcnMgKGhvcGUgdGhlIGJlbG93DQo+Pj4+Pj4gaXMgY29ycmVjdGx5IHNlZW4g
d2l0aCBhIG1vbm9zcGFjZSBmb250KToNCj4+Pj4+Pg0KPj4+Pj4+IGNwdTA6IHZwY2lfd3JpdGUt
PiBkLT5STG9jayAtPiBwZGV2MS0+bG9jayAtPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHJvbV93cml0ZSAtPiBtb2RpZnlfYmFyczogdG1wIChwZGV2MikgLT5sb2Nr
DQo+Pj4+Pj4gY3B1MTrCoMKgwqDCoMKgwqDCoCB2cGNpX3dyaXRlLT4gZC0+UkxvY2sgcGRldjIt
PmxvY2sgLT4gY21kX3dyaXRlIC0+IG1vZGlmeV9iYXJzOiB0bXAgKHBkZXYxKSAtPmxvY2sNCj4+
Pj4+Pg0KPj4+Pj4+IFRoZXJlIGlzIG5vIEFQSSB0byB1cGdyYWRlIHJlYWQgbG9jayB0byB3cml0
ZSBsb2NrIGluIG1vZGlmeV9iYXJzIHdoaWNoIGNvdWxkIGhlbHAsDQo+Pj4+Pj4gc28gaW4gYm90
aCBjYXNlcyB2cGNpX3dyaXRlIHNob3VsZCB0YWtlIHdyaXRlIGxvY2suDQo+Pj4+PiBIbW0sIHll
cywgSSB0aGluayB5b3UncmUgcmlnaHQ6IEl0J3Mgbm90IG1vZGlmeV9iYXJzKCkgaXRzZWxmIHdo
aWNoIG5lZWRzDQo+Pj4+PiB0byBhY3F1aXJlIHRoZSB3cml0ZSBsb2NrLCBidXQgaXRzIChwZXJo
YXBzIGluZGlyZWN0KSBjYWxsZXIuIEVmZmVjdGl2ZWx5DQo+Pj4+PiB2cGNpX3dyaXRlKCkgd291
bGQgbmVlZCB0byB0YWtlIHRoZSB3cml0ZSBsb2NrIGlmIHRoZSByYW5nZSB3cml0dGVuDQo+Pj4+
PiBvdmVybGFwcyB0aGUgQkFScyBvciB0aGUgY29tbWFuZCByZWdpc3Rlci4NCj4+Pj4gSSdtIGNv
bmZ1c2VkLiBJZiB3ZSB1c2UgYSBwZXItZG9tYWluIHJ3bG9jayBhcHByb2FjaCB0aGVyZSB3b3Vs
ZCBiZSBubw0KPj4+PiBuZWVkIHRvIGxvY2sgdG1wIGFnYWluIGluIG1vZGlmeV9iYXJzLCBiZWNh
dXNlIHdlIHNob3VsZCBob2xkIHRoZQ0KPj4+PiByd2xvY2sgaW4gd3JpdGUgbW9kZSwgc28gdGhl
cmUncyBubyBBQkJBPw0KPj4+IHRoaXMgaXMgb25seSBwb3NzaWJsZSB3aXRoIHdoYXQgeW91IHdy
b3RlIGJlbG93Og0KPj4+PiBXZSB3aWxsIGhhdmUgaG93ZXZlciB0byBkcm9wIHRoZSBwZXIgZG9t
YWluIHJlYWQgYW5kIHZwY2kgbG9ja3MgYW5kDQo+Pj4+IHBpY2sgdGhlIHBlci1kb21haW4gbG9j
ayBpbiB3cml0ZSBtb2RlLg0KPj4+IEkgdGhpbmsgdGhpcyBpcyBnb2luZyB0byBiZSB1bnJlbGlh
YmxlLiBXZSBuZWVkIGEgcmVsaWFibGUgd2F5IHRvDQo+Pj4gdXBncmFkZSByZWFkIGxvY2sgdG8g
d3JpdGUgbG9jay4NCj4+PiBUaGVuLCB3ZSBjYW4gZHJvcCBwZGV2LT52cGNpX2xvY2sgYXQgYWxs
LCBiZWNhdXNlIHdlIGFyZSBhbHdheXMNCj4+PiBwcm90ZWN0ZWQgd2l0aCBkLT5yd2xvY2sgYW5k
IHRob3NlIHdobyB3YW50IHRvIGZyZWUgcGRldi0+dnBjaQ0KPj4+IHdpbGwgdXNlIHdyaXRlIGxv
Y2suDQo+Pj4NCj4+PiBTbywgcGVyLWRvbWFpbiByd2xvY2sgd2l0aCB3cml0ZSB1cGdyYWRlIGlt
cGxlbWVudGVkIG1pbnVzIHBkZXYtPnZwY2kNCj4+PiBzaG91bGQgZG8gdGhlIHRyaWNrDQo+PiBM
aW51eCBkb2Vzbid0IGltcGxlbWVudCB3cml0ZSB1cGdyYWRlIGFuZCBpdCBzZWVtcyBmb3IgYSBy
ZWFzb24gWzFdOg0KPj4gIkFsc28sIHlvdSBjYW5ub3Qg4oCcdXBncmFkZeKAnSBhIHJlYWQtbG9j
ayB0byBhIHdyaXRlLWxvY2ssIHNvIGlmIHlvdSBhdCBfYW55XyB0aW1lDQo+PiBuZWVkIHRvIGRv
IGFueSBjaGFuZ2VzIChldmVuIGlmIHlvdSBkb27igJl0IGRvIGl0IGV2ZXJ5IHRpbWUpLCB5b3Ug
aGF2ZSB0byBnZXQNCj4+IHRoZSB3cml0ZS1sb2NrIGF0IHRoZSB2ZXJ5IGJlZ2lubmluZy4iDQo+
Pg0KPj4gU28sIEkgYW0gbm90IHN1cmUgd2UgY2FuIGhhdmUgdGhlIHNhbWUgZm9yIFhlbi4uLg0K
Pj4NCj4+IEF0IHRoZSBtb21lbnQgSSBzZWUgYXQgbGVhc3QgdHdvIHBvc3NpYmxlIHdheXMgdG8g
c29sdmUgdGhlIGlzc3VlOg0KPj4gMS4gTWFrZSB2cGNpX3dyaXRlIHVzZSB3cml0ZSBsb2NrLCB0
aHVzIG1ha2UgYWxsIHdyaXRlIGFjY2Vzc2VzIHN5bmNocm9uaXplZA0KPj4gZm9yIHRoZSBnaXZl
biBkb21haW4sIHJlYWQgYXJlIGZ1bGx5IHBhcmFsbGVsDQo+IDFiLiBNYWtlIHZwY2lfd3JpdGUg
dXNlIHdyaXRlIGxvY2sgZm9yIHdyaXRlcyB0byBjb21tYW5kIHJlZ2lzdGVyIGFuZCBCQVJzDQo+
IG9ubHk7IGtlZXAgdXNpbmcgdGhlIHJlYWQgbG9jayBmb3IgYWxsIG90aGVyIHdyaXRlcy4NCkkg
YW0gbm90IHF1aXRlIHN1cmUgaG93IHRvIGRvIHRoYXQuIERvIHlvdSBtZWFuIHNvbWV0aGluZyBs
aWtlOg0Kdm9pZCB2cGNpX3dyaXRlKHBjaV9zYmRmX3Qgc2JkZiwgdW5zaWduZWQgaW50IHJlZywg
dW5zaWduZWQgaW50IHNpemUsDQogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVpbnQz
Ml90IGRhdGEpDQpbc25pcF0NCiDCoMKgwqAgbGlzdF9mb3JfZWFjaF9lbnRyeSAoIHIsICZwZGV2
LT52cGNpLT5oYW5kbGVycywgbm9kZSApDQp7DQpbc25pcF0NCiDCoMKgwqAgaWYgKCByLT5uZWVk
c193cml0ZV9sb2NrKQ0KIMKgwqDCoCDCoMKgwqAgd3JpdGVfbG9jayhkLT52cGNpX2xvY2spDQog
wqDCoMKgIGVsc2UNCiDCoMKgwqAgwqDCoMKgIHJlYWRfbG9jayhkLT52cGNpX2xvY2spDQouLi4u
DQoNCkFuZCBwcm92aWRlIHJ3IGFzIGFuIGFyZ3VtZW50IHRvOg0KDQppbnQgdnBjaV9hZGRfcmVn
aXN0ZXIoc3RydWN0IHZwY2kgKnZwY2ksIHZwY2lfcmVhZF90ICpyZWFkX2hhbmRsZXIsDQogwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHZwY2lfd3JpdGVfdCAqd3Jp
dGVfaGFuZGxlciwgdW5zaWduZWQgaW50IG9mZnNldCwNCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgaW50IHNpemUsIHZvaWQgKmRhdGEsIC0tLT4+
PiBib29sIHdyaXRlX3BhdGggPDw8LS0tLS0pDQoNCklzIHRoaXMgd2hhdCB5b3UgbWVhbj8NCg0K
V2l0aCB0aGUgYWJvdmUsIGlmIHdlIGhhdmUgZC0+dnBjaV9sb2NrLCBJIHRoaW5rIHdlIGNhbiBk
cm9wDQpwZGV2LT52cGNpX2xvY2sgYXQgYWxsDQoNClRoYW5rIHlvdSwNCk9sZWtzYW5kcg0KDQpQ
LlMuIEkgZG9uJ3QgdGhpbmsgeW91IG1lYW4gd2UganVzdCBkcm9wIHRoZSByZWFkIGxvY2sgYW5k
IGFjcXVpcmUgd3JpdGUgbG9jaw0KYXMgaXQgbGVhZHMgdG8gdGhlIG1lbnRpb25lZCBiZWZvcmUg
dW5yZWxpYWJpbGl0eS4NCg==

