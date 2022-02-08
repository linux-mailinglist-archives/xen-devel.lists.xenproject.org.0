Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A984AD461
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 10:10:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267785.461536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHMUr-0008IV-8G; Tue, 08 Feb 2022 09:09:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267785.461536; Tue, 08 Feb 2022 09:09:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHMUr-0008Fs-4p; Tue, 08 Feb 2022 09:09:13 +0000
Received: by outflank-mailman (input) for mailman id 267785;
 Tue, 08 Feb 2022 09:09:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1FiY=SX=epam.com=prvs=40383cc40e=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nHMUp-0008Fm-B2
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 09:09:11 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c61637cd-88be-11ec-8f75-fffcc8bd4f1a;
 Tue, 08 Feb 2022 10:09:10 +0100 (CET)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2186iuid013526;
 Tue, 8 Feb 2022 09:09:06 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2112.outbound.protection.outlook.com [104.47.18.112])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3e3kgu0kf9-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Feb 2022 09:09:06 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by VI1PR0301MB2429.eurprd03.prod.outlook.com (2603:10a6:800:63::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Tue, 8 Feb
 2022 09:09:02 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77%3]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 09:09:02 +0000
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
X-Inumbo-ID: c61637cd-88be-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h6OGuQK6+MlxfamnnsUbjXhkxdpx9n1/eVPs39Oy2/ne3MhURO2ftk4vV7S+azoD8HQfJaZPSbcfdD58ZiSBsOFHLrSqkBhqG6xlm4Aekpx/FVeCIKHEO8nY0ChCZGG11DA8ypjkp6KdY5aMaQVcWikqvEo8kOFekyLT+oNyq03fbXXVbRS3ZS9aEy5K8pVQ3+P7xvrFjEvL+kCmap8GG8ZbpJGIBrDSQ9ukSvSbSgUqD5vXzNTtBAzyOGrmfB4sSGVYpfwSMrK2UYwGX+acDS0FACU7/dj6/hc4deWjYzyP4mkCyW/K/dW8c24VOKRR7j7tVK5XvDW858N9hjm4hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G0KkUCduQ6HfasSkTZ2teGTALX11N4n2SWZa1rCA//M=;
 b=bWl9OTlMQZk/kP+BixEWYQqYjxysC7jZKZ9gVfq+Q3ULTCysBvbeg3yhJZNDD5idK/KsgjYppht3GEq/OVtAF8C9rTHhU3B+e0mLQ+JRPSbR98+bd62bdF2wRPBckMX8o2SVaHb9/+VtfnYzf+v0u1VTi3BCKG0/doHjs8CqR9qxAn+cQDs61uuSi4QmaGVmyu/MrSEGJ11W3pKqvQyJB/cYUzAXdOOpv0Sb7slJDVKZOeFZrFUsEU6qNzF/MIyblnslRmqruQjWoe30lQcnlyH9gbnr1/30EX716R7//Nc5OF7O9RiSIsIEMlkj/LPE38+/IustIeB1Thiq4VSPGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G0KkUCduQ6HfasSkTZ2teGTALX11N4n2SWZa1rCA//M=;
 b=PDvNIgh9qj8beRSaf8bd+8SFd7oys983byGAhbAda71cpd1QLTBYO5dFRu2v+oICqiWEb1tPr74VKLbbGS1MxO48gf7cS0yb7s1AUW5rs/vOoMFgxSWb7YCrB0E5VbQe4fC25JTlty5NcLZPJ+plqdBRANG0Q/ABHQ7NgBM21UUWZTTGIvVE4yIB2D2QD2ISDMuRQiFE8uQLMd6Vyg3x8PiwUzrDQ/18Hev1EAyhzbkD6kSKrACtZY2ahQyBU14KVNP8kn/oSvP+RODM0q4lr3I7sZNIW9vi1XmAmqyGJlBYAiq5g+ewNJFwi2hkW8XXdbOL/NXXkHrWEjTpLy5vvQ==
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
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>,
        "roger.pau@citrix.com"
	<roger.pau@citrix.com>
Subject: Re: [PATCH v6 04/13] vpci: restrict unhandled read/write operations
 for guests
Thread-Topic: [PATCH v6 04/13] vpci: restrict unhandled read/write operations
 for guests
Thread-Index: AQHYGZFbf8/6pUr0mUKzbmboCx8QkqyDbvWAgAADnYCABd4pgIAAEgeAgAABIYA=
Date: Tue, 8 Feb 2022 09:09:02 +0000
Message-ID: <b51e5a3c-675f-19ed-ba9c-f1cd3da4e36e@epam.com>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-5-andr2000@gmail.com>
 <b6f091ed-4fa3-e292-9a21-a780ec90ee09@suse.com>
 <f86a43af-1388-6959-3e71-ba796e4a0c63@epam.com>
 <5a87c401-4ebd-1d5c-b98d-1b535f63be65@epam.com>
 <780dce9f-7d1c-39d9-278c-e89ba0b25ee1@suse.com>
In-Reply-To: <780dce9f-7d1c-39d9-278c-e89ba0b25ee1@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0ad0d9be-ec56-4a6a-aa35-08d9eae2a671
x-ms-traffictypediagnostic: VI1PR0301MB2429:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VI1PR0301MB24292B93E8D675BC83ACAE96E72D9@VI1PR0301MB2429.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Gr225c4wuuXOcHAxvrTQNhatZYU1f5c5W4dVHi2Ic0krWgRQXhFomZesmbfQeiTVQN5FUVIY4fsa24aMACRG6fVfoemIkiX8a3Mp0K5DHSvtX5q8l6AvGkOHGrxf2b+6ajLYOvu17XvDOkkaILYPTMaLyqxma2JFIubY5U6oqGFB9kYk8ONktiGr+Fgvgg0Kd4zEAU+Ad2ah6I/Tob/RSrVUHw7CGkvZj8IWDDj/BXceOEMvBw7f6agGZeMgM1Htr1WW36OoAJ+s9IuQ77VRYcfDccuEKF4p8pRZ/Mj1/T37Vo0BUfmbdq4sd/DJSKGwqcW399DNMcjWETxFvqmMLPQPT/MQqV+XtiK8CPQAcwVAyUrnePFzOqjLcp9zeSZoAilLz8T5cSohymRIYqhdavoJKUkRRq+rgQMT8jNMO+PPj1iem0iLxXrJQfFv6gbPPLt7bgsLOO3ILU3fKj+GNDW1LMnkkVg961bvEfUU0VC3OQl9JXeEACjN4EwThUmnkbJ2Q874tbcFjbVhh22GI98VVrCcSG4pCjQqqrV8rCif+uxFsCXJeOfcmZFTFMZW9UgOzorRFB0iWywv6WAlh17AWCXmXcgCuD9ocPvbHskjdGvXY6C3DS+4P4qEg9UzcAmL/nxDcXvLEfB+05skBf0PypP7wNJZAQNR7nHsaZbs2NzDn3hLvuI4hUvxsgAq9b8wDuWbfP+XcB07KL0qBflRxE8Gfm5+SbXQJi7zbjI=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(4326008)(6486002)(71200400001)(66476007)(66556008)(508600001)(36756003)(91956017)(5660300002)(38070700005)(31686004)(7416002)(122000001)(8936002)(2616005)(64756008)(38100700002)(66446008)(8676002)(76116006)(54906003)(316002)(83380400001)(6916009)(26005)(6512007)(6506007)(31696002)(86362001)(66946007)(2906002)(53546011)(55236004)(186003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?OWY2eHVERkZ1Z2ozVVhNbjVaYVE5SXVNcEFGeEs0Z0JxUFlUcnpjUGJXdkJq?=
 =?utf-8?B?UlBObDA4V0ltb3RlV0ZyUTlXYUdlYUVvQkVaSVR3UGNlQlVuUTRkM2tHYjNp?=
 =?utf-8?B?VVpCanZxQmpRMmFOdWh3OGNKWEVuYkNLaTl0VDRXS256QXRMaEtqcGh5Y0F1?=
 =?utf-8?B?RklQMVpDZHhWeTBhYVZZaW53M2xXSG5pM2hkVHNXT3ZUZy9ya2xaNGxSRE1i?=
 =?utf-8?B?US9Eall1MDNKQ3dkYUxXcDR5WnpkK0V1RW84a3RnVE9SOUMwZXBFWWczRUdi?=
 =?utf-8?B?VXU2ZHZseGxZS2ZzUk9KZWpiTmd4dnhKT3JHMW5jcEJtaWQwOW5UVDBSdzdl?=
 =?utf-8?B?NG9BRTQxeU9MLytKVHA4bmx6UEtTY3I5Nk1scW03dTd1WVIrZ1ZhOWVoVXBz?=
 =?utf-8?B?RlNwUGxSTzJPV3dxdGFQaEd6di85dUdnQmllNGJkcS9KV3ZVNmdXQ2d0cXdo?=
 =?utf-8?B?NVhvOGlBYlBwSkVvOVdVTFcvYlZydFN3ajJiVEFMd3VLT0JwYWNySWtHMElB?=
 =?utf-8?B?NjZuZXhiaGIwZ0ZNYmZsL0h0b2pzeERZaFRWejYyZDFMWWNFeTJXNDQ4N3B1?=
 =?utf-8?B?bUF6U05wUFZZbWVrRW0rM0o1bEpyWnN2OXc2b0UrUHB4VEo2b2xBam0yNHFJ?=
 =?utf-8?B?ZGh5ZVhlTGRwdGFxaVRVNTNYS1NYVE1oenN2eWhGL3dSc3YweXNpNHBWQVZC?=
 =?utf-8?B?U2MyWFBRTXV5bmNyaUVNUTFVZEtxTng3Z2hldWhqL2t4RUZyUmJObzgvbmZy?=
 =?utf-8?B?bURKSFJJOGNibDFmN051WDFrMVpQOGdxWXE2ZWNwY2huZ1NRcjJUVkMwVmtq?=
 =?utf-8?B?ektKTnVldnBYOFdSQWZhQUk2cVhUR0JnNjl1MzRHVHBNVHlyZkx4MnpaRElH?=
 =?utf-8?B?S3VUQW5vOG1kdmxPNHV3MEVibE5qc3FtUDRGZERBSVk0RVRWRHZucjJuQ3JF?=
 =?utf-8?B?a1dIbENOYmp1U3lCUzF4NGVzeWg5OThibk1iMGVic2lvL3AyMC8rOEZFUHdq?=
 =?utf-8?B?cWc5Q3NxK1kreEw1UDEwdVZCc29nNlN3bFo1MGJwMlhGY1JhK2wrMjhrTUNI?=
 =?utf-8?B?eGhXcmRVb3JJR1ZzK3A2Y0JhS0VadTZmZDBDMEFPRzYxUnB0Y3JmaisxZ2gw?=
 =?utf-8?B?V3pKclJuTDBucWVFMVV1dG9DMzBWNnB5bjhab0l6QkEveWd5UElxc3dnK0g1?=
 =?utf-8?B?Q1ZVZWZxaUhjaVdSd1cyVVhVbDJlM1NHQ0hsUktIRzRkR2MrNW1DWlVRRCtN?=
 =?utf-8?B?QXdnTXNtMG84Mm9peWprU0d1Z0luUUcvVDRHWGYxR21aNXRNbEZjRE9wR3pr?=
 =?utf-8?B?NTF4YzhaRm8zVFNIaGxZUlVyWVhla2RYNlhjNDMzUUxqeTYwbE52S2tvclNz?=
 =?utf-8?B?c1lwK2JjNHhRelU4S3FFVFVwNWRaQ05BeE4zeUFnZ0E3T1dOMUNGZDAzaXRu?=
 =?utf-8?B?cEFqaktSNWlUNUFRckZXVGUxdXl5ODg4Z3ArWmFUWDFZZk1TcmtQSm9sUG1t?=
 =?utf-8?B?ck9SdGZrdUJHRzE4SUVoaDUvZFI2K0s5TmwxQ0cxQi9WOWFwMU5BMmdpZGM0?=
 =?utf-8?B?amRaNHMwNzBJMEZDWW1kZUx6Y3BMam96VXd5V28zMHN3UHN3RE5XdzcrTDlC?=
 =?utf-8?B?SjU4b3VwTUoxdjJKcWFmMktCK2t6MTBKK2JUU0dIcUE1OTQ1UWRyNDZWMFZG?=
 =?utf-8?B?dmZDSEpDRFdXTDlzVmdWdm1nMGI3NGtHNWsvSzQzekZKSGduVXNQSzFWOGFo?=
 =?utf-8?B?V0xLdXJPMFRuZ1JnbVYySHUvV3QrK1l4dGtCSGhabnBlMlJqektjQjY3b1Rw?=
 =?utf-8?B?NFA0NmtxVVcvYjBERmhjbHB6a3pTODhpOHl4b3VuK2J1V0tiSnYrbnFaemhy?=
 =?utf-8?B?Z2lKM1BMRkVpL0ZJY1pqVGtPeVMvN1pwVDVMZ0FaLytFTU9nVm5pcnVHUDJD?=
 =?utf-8?B?S2c3U1cwUkc0UkhQQ3hjY2k1SS9ZSkZucS9ySTY1ZUtTUDRtLzIwenlmemVT?=
 =?utf-8?B?Y1BQQWpLT29yUGU1Z1N0QVFPejZJMitkUXZ4ZmZydSs5OWo1UTVnVkZvSTYz?=
 =?utf-8?B?WTFIYWRZcnpOSTNPOW11UUlPa1NEa1pZTGxUMUVsak1ieUF6bU9qMHFhbzJS?=
 =?utf-8?B?eVIxSERiNllCQlVzbnQvQkxKandxZFo4WEVSbFJkTkRlc2F5QjhYcjkzU20w?=
 =?utf-8?B?U00wTHJ6WDFGTTlRWE5rbkNSdXh2K0IwU2txRCtLT25ialkwc3RqeUFxc1J6?=
 =?utf-8?B?NU9seVV0ODJjL1VWSGkvK1oyTkV4RHVhYldVbG5iN01KLytmYzB1QTZHUUxm?=
 =?utf-8?B?M3NEWERnZENsYWZiN0tzNHZBYTRaOWNjWEJoSGg3T1FScUZZcVVGNU80dC9k?=
 =?utf-8?Q?efYgEJPgww4edq6M=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5757C1BCCB98B940924B967D19D2F232@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ad0d9be-ec56-4a6a-aa35-08d9eae2a671
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 09:09:02.4517
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nsLY7pGoLeHiO8ngDJ0nGFavE6o/Aigh5qeufzFowPe1Hz88NYsgsPiSGCPz9oMnr8gZ0Uq1Rubcv7DZJfHqDfDQTpciwNu1CCiyWE9tLhpD7FDwx5BDdNe8DxXP41k4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0301MB2429
X-Proofpoint-GUID: ZilNiSm7QClNYiPkQN_GqW-FRLQfmeJ9
X-Proofpoint-ORIG-GUID: ZilNiSm7QClNYiPkQN_GqW-FRLQfmeJ9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-08_02,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=999
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202080052

DQoNCk9uIDA4LjAyLjIyIDExOjA0LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDguMDIuMjAy
MiAwOTowMCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBPbiAwNC4wMi4yMiAx
NjoyNCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4gT24gMDQuMDIuMjIgMTY6
MTEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+PiBPbiAwNC4wMi4yMDIyIDA3OjM0LCBPbGVrc2Fu
ZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4+IEEgZ3Vlc3QgY2FuIHJlYWQgYW5kIHdyaXRl
IHRob3NlIHJlZ2lzdGVycyB3aGljaCBhcmUgbm90IGVtdWxhdGVkIGFuZA0KPj4+Pj4gaGF2ZSBu
byByZXNwZWN0aXZlIHZQQ0kgaGFuZGxlcnMsIHNvIGl0IGNhbiBhY2Nlc3MgdGhlIEhXIGRpcmVj
dGx5Lg0KPj4+PiBJIGRvbid0IHRoaW5rIHRoaXMgZGVzY3JpYmVzIHRoZSBwcmVzZW50IHNpdHVh
dGlvbi4gT3IgZGlkIEkgbWlzcyB3aGVyZQ0KPj4+PiBkZXZpY2VzIGNhbiBhY3R1YWxseSBiZSBl
eHBvc2VkIHRvIGd1ZXN0cyBhbHJlYWR5LCBkZXNwaXRlIG11Y2ggb2YgdGhlDQo+Pj4+IHN1cHBv
cnQgbG9naWMgc3RpbGwgbWlzc2luZz8NCj4+PiBObywgdGhleSBhcmUgbm90IGV4cG9zZWQgeWV0
IGFuZCB5b3Uga25vdyB0aGF0Lg0KPj4+IEkgd2lsbCB1cGRhdGUgdGhlIGNvbW1pdCBtZXNzYWdl
DQo+PiBCVFcsIGFsbCB0aGlzIHdvcmsgaXMgYWJvdXQgYWRkaW5nIHZwY2kgZm9yIGd1ZXN0cyBh
bmQgb2YgY291cnNlIHRoaXMNCj4+IGlzIG5vdCBnb2luZyB0byBiZSBlbmFibGVkIHJpZ2h0IGF3
YXkuDQo+PiBJIHdvdWxkIGxpa2UgdG8gaGVhciB0aGUgY29tbW9uIGFjY2VwdGFibGUgd2F5IG9m
IGRvY3VtZW50aW5nIHN1Y2gNCj4+IHRoaW5nczogZWl0aGVyIHdlIGp1c3Qgc2F5IHNvbWV0aGlu
ZyBsaWtlICJBIGd1ZXN0IGNhbiByZWFkIGFuZCB3cml0ZSINCj4+IGVsc2V3aGVyZSBvciB3ZSBu
ZWVkIHRvIGludmVudCBzb21ldGhpbmcgbmV1dHJhbCBub3QgZGlyZWN0bHkgbWVudGlvbmluZw0K
Pj4gd2hhdCB0aGUgY2hhbmdlIGRvZXMuIFdpdGggdGhlIGxhdGVyIGl0IGFsbCBzZWVtcyBhIGJp
dCBjb25mdXNpbmcgSU1PDQo+PiBhcyB3ZSBkbyBrbm93IHdoYXQgd2UgYXJlIGRvaW5nIGFuZCBm
b3Igd2hhdCByZWFzb246IGVuYWJsZSB2cGNpIGZvciBndWVzdHMNCj4gV2hhdCdzIHRoZSBwcm9i
bGVtIHdpdGggZGVzY3JpYmluZyB0aGluZ3MgYXMgdGhleSBhcmU/IENvZGUgaXMgaHdkb20tDQo+
IG9ubHkgcmlnaHQgbm93LCBhbmQgeW91J3JlIHRyeWluZyB0byBlbmFibGUgRG9tVSBzdXBwb3J0
LiBIZW5jZSBpdCdzDQo+IGFsbCBhYm91dCAid291bGQgYmUgYWJsZSB0byIsIG5vdCAiY2FuIi4N
ClNvdW5kcyBnb29kLCB3aWxsIHVzZSB0aGF0IHdvcmRpbmcgdGhlbg0KPg0KPiBKYW4NCj4NCj4N
ClRoYW5rIHlvdSwNCk9sZWtzYW5kcg==

