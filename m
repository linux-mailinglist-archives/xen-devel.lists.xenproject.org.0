Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB054AD2A5
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 09:01:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267637.461378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHLQX-0002jm-4Z; Tue, 08 Feb 2022 08:00:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267637.461378; Tue, 08 Feb 2022 08:00:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHLQX-0002h1-1T; Tue, 08 Feb 2022 08:00:41 +0000
Received: by outflank-mailman (input) for mailman id 267637;
 Tue, 08 Feb 2022 08:00:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1FiY=SX=epam.com=prvs=40383cc40e=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nHLQU-0002gt-Ja
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 08:00:38 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31d29bb6-88b5-11ec-8f75-fffcc8bd4f1a;
 Tue, 08 Feb 2022 09:00:36 +0100 (CET)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2187rNV4021871;
 Tue, 8 Feb 2022 08:00:31 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3e3mh7g0rm-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Feb 2022 08:00:31 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM6PR03MB5457.eurprd03.prod.outlook.com (2603:10a6:20b:cb::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Tue, 8 Feb
 2022 08:00:28 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77%3]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 08:00:28 +0000
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
X-Inumbo-ID: 31d29bb6-88b5-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nRlnwY34tkcOpvBpl96fr2ss1mjuwoOb6/Qc9MATCxj/aI7Ea0uEqjk6bjcIEIy7l2z7r8rmv7TEe2BodZ4UsGMeh492jsWp2UbW5Z/3thZa5OZ2qPKBvg6dtseh84O+NXc1n+cGwNNi8ha+eVoM+H1M0cl1t70SqaqOvXpbTcyWCV0BijgwZaYVgQq2L0N4jf49bEspQ17u5B1qn2uphT6oq7qutfLRJy2LwH/lXakoZCDHK9dRP+eQvEvs7Oi5/FSE1EyaqZqhs0Cc29NihVlVIEe5+nM0UF9nhJMmIPT2uD0r3XXdJBoH65bsw7SRWZB6Q9DFaBuWc41lIuIZ7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JSXkDlzILY7kwi8NyLXpJsr0LsQIlPej9iYjEc1YIDo=;
 b=QZmzFraRdU7W8yu7HSkYAdyQraoBuKbM/evLPk3bJw29bVOgKtPIdTqs0u40jTDv5XhrZCO+VJONVPghFzOdFyY+GHN+Tky2c837nQ0cTC48k81oVRgQPZGsIdTx2uS5FSEPqQl2ib9AGsKpxO715LbU6YMFDyv834pX3k/W8UvOL1mCnI5FxurxDBQJ9HQAdyISuzKuaCUtJWMHs6OnIUdZCz2gceucRuHMlDX0relXFCemp62zV2PQBgeeueWv2fEFRV0WZiH4eRHIRc+g+2X/ptqfpYgL8nKocZQoa0624tMbNffO6EfqwD5hsnpkepVHJUvyduzrD/QcS0ybUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JSXkDlzILY7kwi8NyLXpJsr0LsQIlPej9iYjEc1YIDo=;
 b=n5qb9PidI6PFDKtWpFkzPrA/NygWGd1DuVvkK9D2o7FfvomtpgW4DC8WnqQE3HHA0MsRoRzB+dkv8mFtGFehvIVuR7RxV4i1ndjskFKvc1BTq6EWA4EzlWu2KcJrohJbz0+QGmx8tMwQplbdQTifts16YNniYPoxELOoinuNQexIi+F0ezC64DS8sMFqEjSl+eG+iy5NX7kkdy+N/DrRFYQLafwgQ3igOWK1bBl6hb3IbCn6rhDnBXnhtZsFBGtcpwuFjpfhZXXjbU1Doh0HvqAlOxlYwOFyFwAJAzakENsW+yxXluPXAU20rH9sg3aE/UMHXvJV9ISuo5uymPbsLw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: "roger.pau@citrix.com" <roger.pau@citrix.com>,
        Jan Beulich
	<jbeulich@suse.com>
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
Subject: Re: [PATCH v6 04/13] vpci: restrict unhandled read/write operations
 for guests
Thread-Topic: [PATCH v6 04/13] vpci: restrict unhandled read/write operations
 for guests
Thread-Index: AQHYGZFbf8/6pUr0mUKzbmboCx8QkqyDbvWAgAADnYCABd4pgA==
Date: Tue, 8 Feb 2022 08:00:28 +0000
Message-ID: <5a87c401-4ebd-1d5c-b98d-1b535f63be65@epam.com>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-5-andr2000@gmail.com>
 <b6f091ed-4fa3-e292-9a21-a780ec90ee09@suse.com>
 <f86a43af-1388-6959-3e71-ba796e4a0c63@epam.com>
In-Reply-To: <f86a43af-1388-6959-3e71-ba796e4a0c63@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0da6cd61-71c9-455c-d601-08d9ead91223
x-ms-traffictypediagnostic: AM6PR03MB5457:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM6PR03MB54572FCF7E6B9A9E2B210EE5E72D9@AM6PR03MB5457.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ORj6y++7fznYWV9jMNOXn3gCI0Z2WzZzMeMY7fF4yQngvDl0U09PirYyXtxVdtq0l4gYN9HdCcAnZPSgwmmDkgdXDyR0PvucR5uiQEMMG3XYVcrsrDBHeaPz1O8Fk5XhnR0PqB3uG7odJQeS5YAe6i555HNCzbKH+ARJqdktDNJzFeclPZfMeJr48HeD4a1wAjEP8vgiYCPlQH8X08qCq9p3IbCaNKvfbuz6lpvLSAJmNp8OTyZGFYalFFZFONVbNpXuuN1DKaU62lt/EGftAUM72kDFhhCr8ID9Sdk1HnjWYV8281JRO7IHV2pJTBm8X2Lp2NcDm9r3Pz40I7OTj6V0dQfsBTiY7sswGn5ETECBQFv/boz9VNnYMBXybgD+yAmNFQihXoqS2XxNv5s0ECKBwIFqOvese4SLkSGGGqqbKIs6b7gPotGTkr7CBJpO5UNFZpHogSQnICOP3UOkOTmHpz3CaapnbF5Z2mtQh0guNa/BxzUc8NGj8KL8yM/L+3Ywc1uppeJlyk3a7SIfYPMUjACCKVxKh8SytiYCz+NojVUjTo1QiAlWP9IJ2f0Go47R1eFSHDPPTQmtNoH4L16awfarH3jBRRgXAjFhfO/Ld34zI4HaPPBlbnZ8KEcbWiQZmOyfx5iPc6668z2GJCc1MYFkcqj18iKPqaoVL/ZSak5dYgOfDS4infKOPqtA/7EFDtt4psg1h/p+xkVtkt9FSTyWak/SXoAaDPN1gX2ZHkqsCFNxCG75QXTLRheN
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(66556008)(66946007)(38070700005)(4326008)(91956017)(76116006)(8676002)(36756003)(5660300002)(7416002)(6486002)(8936002)(66446008)(64756008)(83380400001)(122000001)(38100700002)(54906003)(110136005)(31696002)(2906002)(66476007)(316002)(71200400001)(2616005)(31686004)(55236004)(53546011)(186003)(6506007)(26005)(508600001)(107886003)(6512007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Y3haZ1JlTmpkUFYvQWFvV2ZxV09wbmY4aEx3bXlzaFdoakM4VnpOUmlhd2ZP?=
 =?utf-8?B?N0JzMFRNMGN6MlpmRjNGZUN6RzlIQlZiSkRjUDdqcFVvUmZ4RmlzdFZ1c3NL?=
 =?utf-8?B?RXdmY3hEZXo1VHg3dk5RbGNZd1d2Q213ekRJcDVGM3BsNzl4bi8wNFlWZ0lq?=
 =?utf-8?B?T0RsK2tobVhtN21ua3RGOCs3dzBNUnp4dURuQm9nbnFLbFBLd3kvTXNBZGgw?=
 =?utf-8?B?S3ZxcHhJTjU3amtLK29jYm5XZGZ0YUVkK0I2cWtuQmdiL1lwMUt3N1RyMm1G?=
 =?utf-8?B?SnBBOTJ5d2E2akJDY002NFhIODRqczBNQ0tyQ3N3cDZEOGNzNmZkR0c0WlNP?=
 =?utf-8?B?ZG1PRkJBZnozU3RQU0dJNHI4b0VZWWMyNnRrTFpDQTJlVDZweG03UkcwR0s2?=
 =?utf-8?B?a1hBeWd6dVRqUnN6K3NqcGdUeEF1Uy8xeWw5OVBWeTBER0pKcjloMEN0RGla?=
 =?utf-8?B?c0crUHJKQUhaNkl2U1RkeHdJS2ZHWEhCOEZLNzM3QStPUlEvSXd5aU4yb24z?=
 =?utf-8?B?WjNHRmM4RFpJam82T0VQcnpsZW85UDJqOGNPcU1vU2hRVzRQSGE3alBVemk1?=
 =?utf-8?B?aEIyQko5eitTWW5HUmF0OUFySEk3cjc5bjBIb2ttZE5GL0tqNk5wWHNHTzA5?=
 =?utf-8?B?azVFZ0tVWisvZjA1cU9QaFdVTDNJcm5WZnJFUzh3dGFqQ1AybFlpM1EyU0ts?=
 =?utf-8?B?cW5FSFpoNDErWXpoZXlsTDNHcmRqUTY5dGkwV2YveUR5anJjaGVsTkliZm1J?=
 =?utf-8?B?YkxFMlgvRFV5YkFSMmJIdmF2bExVQjdaOGRqUEIrNHBjdFRxUlgxOUFzQkVN?=
 =?utf-8?B?MXplSkloa1Fnc2ZFbnhta2E3ODhDVnpjV2Z0SzBvYXpFd25lMVVua01tekdv?=
 =?utf-8?B?aEN4SHk4ejdmZUZyMmhjTzgzSkZFK2VIenpSaXJ1NE5oTGl1MWRNWDVxcDFp?=
 =?utf-8?B?TmFXYkcyMU45azl4aDlzcnpvbVNuSEdCK1ZoMWJINjlWYUpnbmpwR2RLcmxt?=
 =?utf-8?B?c3FHWFhNN2RLZmFpbW1EVEJhT3NMbkoxak9YQkdSUVdXTDlSWVE5bjRUWXp4?=
 =?utf-8?B?dVVSS2lQWTRYUFdXUVZYSmFDZnlsMFQ2N1lZaDluSmIrSTg2c1ZaN3d5WUIy?=
 =?utf-8?B?dHhOL2FTbXBQMG1HN0ZRU1hER0JnNEp0UWtvTUdMcWRSMUZuNlprWVJmOGFJ?=
 =?utf-8?B?REdOdmZSOVRWYnRWY2NURnEzM1ZsTGdYYUh5VHg5U0NCUDVwQ0NQcXpKOFFl?=
 =?utf-8?B?NytoTHVZOFVmUGpNNk1OZkt5RDB3WGoraFlweXFLVXE3U3NidFFNemVUV2ZN?=
 =?utf-8?B?ajUwcFVWaHE2NGx6TWF1Q29BZUM2QlhYZWE0NzVtckdpVzNYT2R1Wlg1Sjd5?=
 =?utf-8?B?bEFMbk1JT0dpcnR0Z3RCc3oyTEk4ZlN5TWlXczdEZTA3YSswcGRVNlFidWs2?=
 =?utf-8?B?RDBIN1ZyaE8wMHlvVnZTZEdYRlp5b1oxSGdyVDJZeTlTeUlQcnRMbVIrbXgv?=
 =?utf-8?B?aURDRjJnZXZnWWdXbFJKejJEZWgxUDB2WlBva2V4WW9pTzByUXdNc0FkaEhR?=
 =?utf-8?B?bDVveXhab29kUVU3WVkvSUtyOURveExFTTg3NnZqZVRjSUNkYmJpdkg3RDdk?=
 =?utf-8?B?TC9aQzFXRnFSWjRlazc1dktzOERvUGxLRTdQS1Bzc3hLTjk0N1Q2S1c2d2ti?=
 =?utf-8?B?RGNqNGtnMGNGTlpHYUJZc2VwU1JnNnVGSk5kWTZ5S2kyN21XbjZFWDVLZmMx?=
 =?utf-8?B?WGNCVDZZWkV6QnU5UlMwTEdkdlRiWTVaZDVMVkJJZ1BZYUw3UXVDMG9UaUt1?=
 =?utf-8?B?V21pcXBxckY2c0VOdDRTVy9nbWl5TDdtRVB5RThvbFFCZHBEelRESkRwUjBy?=
 =?utf-8?B?bjlwMjA0RnhxbzNBTzZCMVdOd3JtOEJWU21jZkpyUE1lTkVMOWdsUWJ5WmM3?=
 =?utf-8?B?ak0zZlZHY09ka1A4REhmQlA1b3BmSHJMenkvaWkxNWRzeWNtLzN0K0V2RGhN?=
 =?utf-8?B?NWV2c21xUDlrUm9SSjZaYWpldVdEd1JLS0FOb2s2cjF4dEw5aGxsL29CZU5v?=
 =?utf-8?B?eGRWbllxUTFOdW94VGkyVVQ5ZzBML0Q4aG5rOG84aUtERlZ1ZzB2UGFEampE?=
 =?utf-8?B?TzQ0OGJkUUVwdkRhWFkzRVIxM3BoT3dEaklBc0FrbHNUYW15d3ladVI5MlM4?=
 =?utf-8?B?RGR3YWFUNFhTMDNhd01NeFZ3Y29TWXBYbEpBMUVSbmY5cGlxcm9OZHUzQmFx?=
 =?utf-8?B?SUZNY3hMRnhMZWF0cHh5clRvZlBnTnpnQit3SzNtcVZZaHJXc2w3N010MEVZ?=
 =?utf-8?B?UTBGVDhzdVIwdkkxTEFWaHVGZnluOFZzUG1STUVjcC9sdHBqQ0JzQzVVVGpG?=
 =?utf-8?Q?6TrpMVgaiNQFL3dg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6B45FA74D8CE0F46ACCC7468DE0227D9@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0da6cd61-71c9-455c-d601-08d9ead91223
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 08:00:28.1683
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L6lLFtUrLrdwTHcTJrOdoLGT/dxZVoYWExHuRW7WVntMnZ2qHt8JejAP7ylimTz/Mhyw1y8ZpHhxo4MFzUhB6NHy7FItJuTjSVON+AAzG31MQNq6GKx+PuZ/FerX17Wa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB5457
X-Proofpoint-GUID: C9EedLsI0h05hhyLELMb5mhXjq8TAS9T
X-Proofpoint-ORIG-GUID: C9EedLsI0h05hhyLELMb5mhXjq8TAS9T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-08_02,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 priorityscore=1501
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 mlxscore=0
 phishscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202080043

DQpPbiAwNC4wMi4yMiAxNjoyNCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+DQo+
IE9uIDA0LjAyLjIyIDE2OjExLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+IE9uIDA0LjAyLjIwMjIg
MDc6MzQsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+IEEgZ3Vlc3QgY2FuIHJl
YWQgYW5kIHdyaXRlIHRob3NlIHJlZ2lzdGVycyB3aGljaCBhcmUgbm90IGVtdWxhdGVkIGFuZA0K
Pj4+IGhhdmUgbm8gcmVzcGVjdGl2ZSB2UENJIGhhbmRsZXJzLCBzbyBpdCBjYW4gYWNjZXNzIHRo
ZSBIVyBkaXJlY3RseS4NCj4+IEkgZG9uJ3QgdGhpbmsgdGhpcyBkZXNjcmliZXMgdGhlIHByZXNl
bnQgc2l0dWF0aW9uLiBPciBkaWQgSSBtaXNzIHdoZXJlDQo+PiBkZXZpY2VzIGNhbiBhY3R1YWxs
eSBiZSBleHBvc2VkIHRvIGd1ZXN0cyBhbHJlYWR5LCBkZXNwaXRlIG11Y2ggb2YgdGhlDQo+PiBz
dXBwb3J0IGxvZ2ljIHN0aWxsIG1pc3Npbmc/DQo+IE5vLCB0aGV5IGFyZSBub3QgZXhwb3NlZCB5
ZXQgYW5kIHlvdSBrbm93IHRoYXQuDQo+IEkgd2lsbCB1cGRhdGUgdGhlIGNvbW1pdCBtZXNzYWdl
DQpCVFcsIGFsbCB0aGlzIHdvcmsgaXMgYWJvdXQgYWRkaW5nIHZwY2kgZm9yIGd1ZXN0cyBhbmQg
b2YgY291cnNlIHRoaXMNCmlzIG5vdCBnb2luZyB0byBiZSBlbmFibGVkIHJpZ2h0IGF3YXkuDQpJ
IHdvdWxkIGxpa2UgdG8gaGVhciB0aGUgY29tbW9uIGFjY2VwdGFibGUgd2F5IG9mIGRvY3VtZW50
aW5nIHN1Y2gNCnRoaW5nczogZWl0aGVyIHdlIGp1c3Qgc2F5IHNvbWV0aGluZyBsaWtlICJBIGd1
ZXN0IGNhbiByZWFkIGFuZCB3cml0ZSINCmVsc2V3aGVyZSBvciB3ZSBuZWVkIHRvIGludmVudCBz
b21ldGhpbmcgbmV1dHJhbCBub3QgZGlyZWN0bHkgbWVudGlvbmluZw0Kd2hhdCB0aGUgY2hhbmdl
IGRvZXMuIFdpdGggdGhlIGxhdGVyIGl0IGFsbCBzZWVtcyBhIGJpdCBjb25mdXNpbmcgSU1PDQph
cyB3ZSBkbyBrbm93IHdoYXQgd2UgYXJlIGRvaW5nIGFuZCBmb3Igd2hhdCByZWFzb246IGVuYWJs
ZSB2cGNpIGZvciBndWVzdHMNCj4+PiBJbiBvcmRlciB0byBwcmV2ZW50IGEgZ3Vlc3QgZnJvbSBy
ZWFkcyBhbmQgd3JpdGVzIGZyb20vdG8gdGhlIHVuaGFuZGxlZA0KPj4+IHJlZ2lzdGVycyBtYWtl
IHN1cmUgb25seSBoYXJkd2FyZSBkb21haW4gY2FuIGFjY2VzcyBIVyBkaXJlY3RseSBhbmQgcmVz
dHJpY3QNCj4+PiBndWVzdHMgZnJvbSBkb2luZyBzby4NCj4+IFRhbmdlbnRpYWwgcXVlc3Rpb246
IEdvaW5nIG92ZXIgdGhlIHRpdGxlcyBvZiB0aGUgcmVtYWluaW5nIHBhdGNoZXMgSQ0KPj4gbm90
aWNlIHBhdGNoIDYgaXMgZ29pbmcgdG8gZGVhbCB3aXRoIEJBUiBhY2Nlc3Nlcy4gQnV0IChnb2lu
ZyBqdXN0DQo+PiBmcm9tIHRoZSB0aXRsZXMpIEkgY2FuJ3Qgc3BvdCBhbnl3aGVyZSB0aGF0IHZl
bmRvciBhbmQgZGV2aWNlIElEcw0KPj4gd291bGQgYmUgZXhwb3NlZCB0byBndWVzdHMuIFlldCB0
aGF0J3MgdGhlIGZpcnN0IHRoaW5nIGd1ZXN0cyB3aWxsIG5lZWQNCj4+IGluIG9yZGVyIHRvIGFj
dHVhbGx5IHJlY29nbml6ZSBkZXZpY2VzLiBBcyBzYWlkIGJlZm9yZSwgYWxsb3dpbmcgZ3Vlc3Rz
DQo+PiBhY2Nlc3MgdG8gc3VjaCByL28gZmllbGRzIGlzIHF1aXRlIGxpa2VseSBnb2luZyB0byBi
ZSBmaW5lLg0KPiBBZ3JlZSwgSSB3YXMgdGhpbmtpbmcgYWJvdXQgYWRkaW5nIHN1Y2ggYSBwYXRj
aCB0byBhbGxvdyBJRHMsDQo+IGJ1dCBmaW5hbGx5IGRlY2lkZWQgbm90IHRvIGFkZCBtb3JlIHRv
IHRoaXMgc2VyaWVzLg0KPiBBZ2FpbiwgdGhlIHdob2xlIHRoaW5nIGlzIG5vdCB3b3JraW5nIHll
dCBhbmQgZm9yIHRoZSBkZXZlbG9wbWVudA0KPiB0aGlzIHBhdGNoIGNhbi9uZWVkcyB0byBiZSBy
ZXZlcnRlZC4gU28sIGVpdGhlciB3ZSBpbXBsZW1lbnQgSURzDQo+IG9yIG5vdCB0aGlzIGRvZXNu
J3QgY2hhbmdlIGFueXRoaW5nIHdpdGggdGhpcyByZXNwZWN0DQpSb2dlciwgZG8geW91IHdhbnQg
YW4gYWRkaXRpb25hbCBwYXRjaCB3aXRoIElEcyBpbiB2Nz8NCj4+PiAtLS0gYS94ZW4vZHJpdmVy
cy92cGNpL3ZwY2kuYw0KPj4+ICsrKyBiL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jDQo+Pj4gQEAg
LTIxNSwxMSArMjE1LDE1IEBAIGludCB2cGNpX3JlbW92ZV9yZWdpc3RlcihzdHJ1Y3QgdnBjaSAq
dnBjaSwgdW5zaWduZWQgaW50IG9mZnNldCwNCj4+PiAgICB9DQo+Pj4gICAgDQo+Pj4gICAgLyog
V3JhcHBlcnMgZm9yIHBlcmZvcm1pbmcgcmVhZHMvd3JpdGVzIHRvIHRoZSB1bmRlcmx5aW5nIGhh
cmR3YXJlLiAqLw0KPj4+IC1zdGF0aWMgdWludDMyX3QgdnBjaV9yZWFkX2h3KHBjaV9zYmRmX3Qg
c2JkZiwgdW5zaWduZWQgaW50IHJlZywNCj4+PiArc3RhdGljIHVpbnQzMl90IHZwY2lfcmVhZF9o
dyhib29sIGlzX2h3ZG9tLCBwY2lfc2JkZl90IHNiZGYsIHVuc2lnbmVkIGludCByZWcsDQo+Pj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgc2l6ZSkNCj4+IFdh
cyB0aGUgcGFzc2luZyBhcm91bmQgb2YgYSBib29sZWFuIHRoZSBjb25zZW5zdXMgd2hpY2ggd2Fz
IHJlYWNoZWQ/DQo+IFdhcyB0aGlzIHBhdGNoIGNvbW1pdHRlZCB5ZXQ/DQo+PiBQZXJzb25hbGx5
IEknZCBmaW5lIGl0IG1vcmUgbmF0dXJhbCBpZiB0aGUgdHdvIGZ1bmN0aW9ucyBjaGVja2VkDQo+
PiBjdXJyZW50LT5kb21haW4gdGhlbXNlbHZlcy4NCj4gVGhpcyBpcyBhbHNvIHBvc3NpYmxlLCBi
dXQgSSB3b3VsZCBsaWtlIHRvIGhlYXIgUm9nZXIncyB2aWV3IG9uIHRoaXMgYXMgd2VsbA0KPiBJ
IGFtIGZpbmUgZWl0aGVyIHdheQ0KUm9nZXIsIHdoYXQncyB5b3VyIG1haW50YWluZXIncyBwcmVm
ZXJlbmNlIGhlcmU/IEFkZGl0aW9uYWwgYXJndW1lbnQNCnRvIHZwY2lfcmVhZF9odyBvZiBtYWtl
IGl0IHVzZSBjdXJyZW50LT5kb21haW4gaW50ZXJuYWxseT8NCg0KVGhhbmsgeW91LA0KT2xla3Nh
bmRy

