Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E85527AE20A
	for <lists+xen-devel@lfdr.de>; Tue, 26 Sep 2023 01:04:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608186.946524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkucg-0005bs-He; Mon, 25 Sep 2023 23:04:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608186.946524; Mon, 25 Sep 2023 23:04:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkucg-0005ZC-E7; Mon, 25 Sep 2023 23:04:14 +0000
Received: by outflank-mailman (input) for mailman id 608186;
 Mon, 25 Sep 2023 23:04:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NadZ=FJ=epam.com=prvs=36323676f0=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qkuce-0005Z6-T5
 for xen-devel@lists.xenproject.org; Mon, 25 Sep 2023 23:04:12 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d5475a92-5bf7-11ee-9b0d-b553b5be7939;
 Tue, 26 Sep 2023 01:04:10 +0200 (CEST)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38PKdnMa016426; Mon, 25 Sep 2023 23:04:06 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2176.outbound.protection.outlook.com [104.47.17.176])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3tbb94a3db-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Sep 2023 23:04:06 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by PA4PR03MB6925.eurprd03.prod.outlook.com (2603:10a6:102:e5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Mon, 25 Sep
 2023 23:03:31 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::f606:63f7:5875:6076]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::f606:63f7:5875:6076%4]) with mapi id 15.20.6813.027; Mon, 25 Sep 2023
 23:03:30 +0000
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
X-Inumbo-ID: d5475a92-5bf7-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R9NdtKbN97PC/EHNLdAkHDEHg3BtvSXe9vQ0N3QXqQ6STZ26IIL3ry68H+++okMDw5U8Wt1m86OH6DnrmIWxRIPW/ZhfkQnGL5Pp/QNIJnsZmk7XKJ/jm5dWJqYyx9LfW9GvbKzHewKPfw5XMmIk0l+v5LrJtso+46YpMOhhXXKCWBIDX5q+YEwEOMTZxF9eKZ4T9NDh5y+J0n9JjeUW37K4+8Fqzw4Du3JxqWPVhc0iOA5vEp89+Kc+CfjUIy33OfJlZJ6iPQKVj+8JI7p7WQpIwNogijyypxAtz+JX1qFJU5Q+7SbNa98Jl6vF2JZLcBPYCFCJt0nRt9QXm1apuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iEXxmJg5EQgBBvzYfEUV7jzNCS73zXwmqlx5gapiToI=;
 b=UJbBq1gpV6yEkXOVqyKlJJUepA5/LqaH8le0NpKChoKN33Ts05MpZ68hTxfjQPYqrw6Ut29L33k5nUbp0iVRgTYXSc+Vr4tSXmhgA5jwdiZUVHF9t6c9Uc9b1WjKFL2HeCcrcvFN9PomWNQUpxWCeaNYFSFyP0QioXkj3wDV4+192oVuZqH9/BqMvKll28fvricYr/H+Ln4eWhGKhCiJrYlsyUsnNC/2BcoMs/zordy4tHmcq7lWDwaJlf9bE3sJuSB6JhfrElGTzRRZV9uFp/FIUmsFMDqB+hYHRQHs1nr4knShFY4d/nQNIGvVjCgJ5azFfmOvtgescyRInfcXmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iEXxmJg5EQgBBvzYfEUV7jzNCS73zXwmqlx5gapiToI=;
 b=HIVBS84epnjGwMLloTLIJ9kWZSoV+gty6D8u7cK/jwMgTd2V6mJGPGpm6F+afJPspyDaDfe7wuXl8DYrvTqKMsQRf2HOUn/VCB8jqR0Yro5XhGRgccKWGUu6s8stK6eo5X+BkXYxL2avmV978vWZx+by5/+U6GNHHvaDYDPErAXI3uq56u+S2Hk2gdV0d3TqCCA6A3qJl3HWB2oe9FPtVSLAoSQj8m8jrX3hNj2tfIV0LzgMJdy+o0UzJdyS4vW6Cq7e44sQbWH0RZtRT1LV+YybLIU6JDUH28dvbzCR6tvC7PE9zDb18KmRc3R90BPDgLDC92dRC4ko7gGSJ+JDsw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Stewart
 Hildebrand <stewart.hildebrand@amd.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>,
        Jan Beulich <jbeulich@suse.com>,
        Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
        Jun Nakajima
	<jun.nakajima@intel.com>,
        Kevin Tian <kevin.tian@intel.com>, Paul Durrant
	<paul@xen.org>
Subject: Re: [PATCH v9 02/16] vpci: use per-domain PCI lock to protect vpci
 structure
Thread-Topic: [PATCH v9 02/16] vpci: use per-domain PCI lock to protect vpci
 structure
Thread-Index: AQHZ2s9KfUsugiaE80OWAJ/SuT82fLAiaWIAgAnmCQA=
Date: Mon, 25 Sep 2023 23:03:29 +0000
Message-ID: <87r0mldfem.fsf@epam.com>
References: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
 <20230829231912.4091958-3-volodymyr_babchuk@epam.com>
 <ZQnAvNSDn0WB13Gn@MacBookPdeRoger>
In-Reply-To: <ZQnAvNSDn0WB13Gn@MacBookPdeRoger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.10.7; emacs 29.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|PA4PR03MB6925:EE_
x-ms-office365-filtering-correlation-id: 5e5e9d7c-587e-466c-881d-08dbbe1ba256
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 DSWE5O6mEIgIchF7ngjOnOTysPV8fTvFk/6S7f/8a6BVfTcqXEzdbKMZk/g5e2LIeWFoHAagCHxWcVqxNgG7Zh6hqzd90YmBDAXqND4kUBx0kfqHSTSidRfvvTOzqkSIZCOUoQ3hTDfGnWDRrzq+AwzScbeszxztftj5l6NNDQxzyF+F120jXL8BwBwJ7ULQEkHq5CGyV+uoivibsSwX/bQxoAfSS0KTIaQAypeRA4C8pHytzS+Si8TTUnUOmNan5EIfg3uMeuGpyo37te+9qhJW5kpaD/kzacBVsAiIltHPZmTP+dGqvWQ+v6oEN8MF+xrAGEf/Ntqs6zl9YA7DyHYHY74ECpZ5+RrbxCF4Mv8qotLqosQQEnLzJc67F2a6LwuyIq/FMOF/greXuu8CVaYtJonxZyDwrmKpYxuq8KLF3xaJSz75RaqXiE8VjpW1mc5OHSWc5QtdA4AtM1prdSAZK0cgIese7CsFOKn6kg/vz4bQlGGQMiwHt8lImtCMR6Medg9Ox+SRSGrtpBRiSsLHYgqTMheIq5zZCqEj64KTqLlsZwAaERImHk/OIvu/AMDm/ePYdmNid1c8U/wJTxIgGsj7E0F/OezAOKmcbrEO022JVgWDM+r+BwUIKMsW
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(39860400002)(366004)(396003)(376002)(230922051799003)(186009)(451199024)(1800799009)(71200400001)(478600001)(6506007)(55236004)(6486002)(2616005)(38070700005)(38100700002)(122000001)(54906003)(41300700001)(8676002)(8936002)(4326008)(83380400001)(26005)(6512007)(86362001)(66476007)(36756003)(6916009)(66946007)(66556008)(316002)(66446008)(76116006)(2906002)(64756008)(91956017)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?YkF3QWhlMWVGY05wSXN6Z3BTL3F4UG5pYjlTUC8yaVhITHZjYStTdjd4M25U?=
 =?utf-8?B?L3Nob1p6bjJpSDFvYlQ2WmZRK1dVbVcramM4NFZyd00rUVZDcDk2enBHNkVp?=
 =?utf-8?B?ZU13WlJRWi9PM25jZDhSenNsZnVHVUs4UXNsTVIvSGgrclZjVUJHMCtPVTM1?=
 =?utf-8?B?WGE0Q1pjM1RPOXpUNmVXRVRweEVOWW9OQS9pL2drbFcyN1ZLWGFFNkpSOS8x?=
 =?utf-8?B?ZEtsYXNBSXZ1WG5IajA3NGVWWnpYWVpQd1FTRU1ObW9oMDV2WnoyTzBFV1NO?=
 =?utf-8?B?aGxIdDFGTm5zd2IwcnZZWFFYbFJXR0Vab2JsSTJWYXkzZE1WTzExRGtLelZi?=
 =?utf-8?B?MUR1VlFTbXNJMUJHNjdPMTN1SnAwTEVSaUhWbWxTT2pEenJBUEFsUnJEdXBj?=
 =?utf-8?B?WFZPKy9mK2NoTisyWHQ4UnJVVUxpL051cGtDYTBSUVZjWUJoRGpVcWRVTDVR?=
 =?utf-8?B?NXVoWXR4K0lsRDI3SzJWc1hjSjdkOXRhLzJzWEFaclhidm5SMG4xRDEyWXE4?=
 =?utf-8?B?elUzMkd2dG5wdTdTc0VaT2FXaFY4OHpxT3NMamhmOW1MNVh4N3lpaHZoWHUz?=
 =?utf-8?B?MHMxTGZNS1ZpZHJrTG1Sbm92d1F2Vmthcko2aTFwNFZsNFpRbmhRYVFKOW1j?=
 =?utf-8?B?WTdabnA5bTVwWk5Fb1ZJRWp3WkJkdUhYVXFGSmhSb0p6b1Jjbkc0QitxVHli?=
 =?utf-8?B?c0VuTkJDSkFHT3RuVjFXMHJpTXg5ejcvZkJDeDExTlQ3cEpYTEo4aDhwalNo?=
 =?utf-8?B?YStZRHZ0bzdRZ2dVeHhaRjN6Mjlid0dLUGJCdDhTcStYckR6Ukl5SGdReTVw?=
 =?utf-8?B?RTdNMHBOT1c2RCtKcVg0SjJUM203Nm1JZmtnQVlqV2Q1Zkh1Tys5NDEra0M0?=
 =?utf-8?B?UTRzM0Q1cGF6UlBZbWNDWkJjbzNkL1FHQ0ptWnJjVEFZdXVSbkRTeFNDQzNB?=
 =?utf-8?B?V1drWWpZY2xBOFRLaFJDUDFCd3pMK0RDNU83cDc4Q29qQlNHRGw0T2tmeE5n?=
 =?utf-8?B?Q2NqRzBUTkg0NFk2WE9JckJ2czMvbzhBSFRTK3ozTlhna1dLSlBtK2dqVzlo?=
 =?utf-8?B?VXBZVXJwQnpsSUVjTXRER3U5eUE3bTIzaXJjdXd1ZER2cTg1ZU8vTHBSaGtt?=
 =?utf-8?B?VGZXUHE4SWY4aFBzSldxa2VkcCs4aWw2ZVRNeGxENnV6dFlZa3N4NGt6YWlv?=
 =?utf-8?B?enVYK2xHbkx1ZXpYSXEreGd3ZHZ4OW9JNEdlQVJiQ3pCMGIveHlwVk5iMnls?=
 =?utf-8?B?RG42VU5sSDJhUDhOVTFLKzhTRXpXek1HZXBKalgrWEpCK1hwSnZHOGlkYWRk?=
 =?utf-8?B?alFQcXhXd1dBbWNibU9HWUNOak9Dd2FNRVA5bnpYQlBwZWVRaHA2NGorblJJ?=
 =?utf-8?B?SGN2Mk1Ya1kxRVdPQmZCWXQ4ZVVuQmVZR3YvWDgxTTJ4dGg5WWQrQU8wcmp5?=
 =?utf-8?B?YWJLZWwrdjhqZjJNWmJHOXh5SHdtZExOeGIyOVB1d3RjTFRMRkVrVDBqbVF0?=
 =?utf-8?B?QjFJNi91bnZXV2FCNVhVZDRlclNsekMyRGVCQUdrNDFveWRwd3dUZ242SjlE?=
 =?utf-8?B?OTFNUSttM0FuVUZtQWpVY3RoOUk2UDJyd3VYOG8waDBlWHVtb1FvVUpSV2ZS?=
 =?utf-8?B?Qko2amh6RHlZYzJNQ2UyUEFKc3Rrc2ZpL0JnZVhtS2FIMEljUTI2VktaVmRP?=
 =?utf-8?B?cS9jOHlhQU84OHNkWHNrYTJjRy9PdkFYWFZTOG45L000VmUzOVhxeHc0NGlm?=
 =?utf-8?B?WWZNbURKTWdSaytnTG9XMWJWNlkyUThtS3RFKy9jcGxGbStBUXF0TjVSc3Ir?=
 =?utf-8?B?MUVLRU4rTU1nVmZtaE9pbng4RkRUL09zd3lDeDhTL0xsbVF4ZG5MWE9jYTg1?=
 =?utf-8?B?d1BVeEZUdlFqY0xtcktpcjJvL29PZm1aR2NjS250bUJyK0k3ek16cGxQdllE?=
 =?utf-8?B?WmwzQkRjdWNaT0ZGdEdWQnZnUEtjSE93MERJYS92Q3doS3lpbVNEc1RubHlV?=
 =?utf-8?B?dXg4REpFb0d0ZGZQMjdwWEp0UVNySmNrNVFzZmluUlJIL1RIcW5NdHVDSzVq?=
 =?utf-8?B?L0kzM3Raek9zYThsOEtjOEFERmQwTGlNcThLTnhoak9NeTZnZis4aHV6c1FH?=
 =?utf-8?B?c0ZURWl6ZjB6SDAwWHE4cDJlcDBBSVFnQm1wejlOWjhUVFB4UE44ZWppeldi?=
 =?utf-8?B?NlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1A6568E4C65C1A4BB37CC2B7EB4D5F0C@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e5e9d7c-587e-466c-881d-08dbbe1ba256
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2023 23:03:29.9549
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GHMCvtLKrKKgybmTY6n/kN8xLHutBSu63347oobySb/ILkq5i/BuvabMhnbYqgW3uiywQsSOru+fja5SF7QSkUURezX0XXTw2jIEkO2ChHI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB6925
X-Proofpoint-GUID: krxrpK9J4RWme4e0P5dkE-_XDGdM60gL
X-Proofpoint-ORIG-GUID: krxrpK9J4RWme4e0P5dkE-_XDGdM60gL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-25_18,2023-09-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1011 mlxscore=0
 mlxlogscore=584 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309250178

SGkgUm9nZXIsDQoNClJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cml0
ZXM6DQoNCj4gT24gVHVlLCBBdWcgMjksIDIwMjMgYXQgMTE6MTk6NDJQTSArMDAwMCwgVm9sb2R5
bXlyIEJhYmNodWsgd3JvdGU6DQo+PiBGcm9tOiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xl
a3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+PiANCj4+IFVzZSBhIHByZXZpb3VzbHkg
aW50cm9kdWNlZCBwZXItZG9tYWluIHJlYWQvd3JpdGUgbG9jayB0byBjaGVjaw0KPj4gd2hldGhl
ciB2cGNpIGlzIHByZXNlbnQsIHNvIHdlIGFyZSBzdXJlIHRoZXJlIGFyZSBubyBhY2Nlc3NlcyB0
byB0aGUNCj4+IGNvbnRlbnRzIG9mIHRoZSB2cGNpIHN0cnVjdCBpZiBub3QuIFRoaXMgbG9jayBj
YW4gYmUgdXNlZCAoYW5kIGluIGENCj4+IGZldyBjYXNlcyBpcyB1c2VkIHJpZ2h0IGF3YXkpIHNv
IHRoYXQgdnBjaSByZW1vdmFsIGNhbiBiZSBwZXJmb3JtZWQNCj4+IHdoaWxlIGhvbGRpbmcgdGhl
IGxvY2sgaW4gd3JpdGUgbW9kZS4gUHJldmlvdXNseSBzdWNoIHJlbW92YWwgY291bGQNCj4+IHJh
Y2Ugd2l0aCB2cGNpX3JlYWQgZm9yIGV4YW1wbGUuDQo+PiANCj4+IFdoZW4gdGFraW5nIGJvdGgg
ZC0+cGNpX2xvY2sgYW5kIHBkZXYtPnZwY2ktPmxvY2sgdGhleSBhcmUgc2hvdWxkIGJlDQo+DQo+
IFdoZW4gdGFraW5nIGJvdGggZC0+cGNpX2xvY2sgYW5kIHBkZXYtPnZwY2ktPmxvY2sgdGhlIG9y
ZGVyIHNob3VsZCBiZQ0KPiAuLi4NCj4NCg0KPj4gdGFrZW4gaW4gdGhpcyBleGFjdCBvcmRlcjog
ZC0+cGNpX2xvY2sgdGhlbiBwZGV2LT52cGNpLT5sb2NrIHRvIGF2b2lkDQo+PiBwb3NzaWJsZSBk
ZWFkbG9jayBzaXR1YXRpb25zLg0KPj4NCg0KV2lsbCBpdCBiZSBiZXR0ZXIgdG8gd3JpdGUgbGlr
ZSB0aGlzOg0KDQoiV2hlbiB0YWtpbmcgYm90aCBkLT5wY2lfbG9jayBhbmQgcGRldi0+dnBjaS0+
bG9jaywgdGhleSBzaG91bGQgYmUNCnRha2VuIGluIHRoaXMgZXhhY3Qgb3JkZXI6IGQtPnBjaV9s
b2NrIHRoZW4gcGRldi0+dnBjaS0+bG9jayB0byBhdm9pZA0KcG9zc2libGUgZGVhZGxvY2sgc2l0
dWF0aW9ucy4iDQoNCj8NCg0KSSBhbSBhc2tpbmcgYmVjYXVzZSB5b3VyIHN1Z2dlc3Rpb24gbGVh
ZHMgdG8gIldoZW4gdGFraW5nIGJvdGgNCmQtPnBjaV9sb2NrIGFuZCBwZGV2LT52cGNpLT5sb2Nr
IHRoZSBvcmRlciBzaG91bGQgYmUgdGFrZW4gaW4gdGhpcyBleGFjdA0Kb3JkZXI6IC4uLiAiDQoN
ClsuLi5dDQoNCkFzIGZvciBvdGhlciBjb21tZW50cywgSSBhbSB0YWtpbmcgaW50byBhY2NvdW50
IHlvdXIsIEphbidzIGFuZCBTdGV3YXJ0J3MNCmNvbW1lbnRzIGFuZCByZXdvcmtpbmcgdGhpcyBw
YXRjaC4NCg0KLS0gDQpXQlIsIFZvbG9keW15cg==

