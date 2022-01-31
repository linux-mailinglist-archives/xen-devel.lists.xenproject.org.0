Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF504A3ECF
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 09:46:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262791.455156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nESJc-0001qn-IE; Mon, 31 Jan 2022 08:45:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262791.455156; Mon, 31 Jan 2022 08:45:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nESJc-0001nz-EX; Mon, 31 Jan 2022 08:45:36 +0000
Received: by outflank-mailman (input) for mailman id 262791;
 Mon, 31 Jan 2022 08:45:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9o41=SP=epam.com=prvs=4030d24c28=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nESJa-0001nt-Ce
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 08:45:34 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 266066e5-8272-11ec-8eb8-a37418f5ba1a;
 Mon, 31 Jan 2022 09:45:33 +0100 (CET)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20V8ReBr008639;
 Mon, 31 Jan 2022 08:45:22 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2054.outbound.protection.outlook.com [104.47.14.54])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3dx7wu0te2-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 08:45:22 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by PAXPR03MB7649.eurprd03.prod.outlook.com (2603:10a6:102:1dc::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.21; Mon, 31 Jan
 2022 08:45:18 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6%3]) with mapi id 15.20.4930.021; Mon, 31 Jan 2022
 08:45:17 +0000
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
X-Inumbo-ID: 266066e5-8272-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ep9JRvwcijnGIN81EvzecPMHULDWWNjxHM50npuH4kBwGSDkhSaxwr75n5Ysg6ei6St+ZtmRbPvHPJp7c2ije7WPcAg4Z9ktdKQ7tnXNFY1n5zBiCYgRWUjLD3UdqNMBDJ1sT66ywWVFTspGLGjfN3oUpIC5JJPFteGiklicjKcaApUosgb+iE5T6GftLWlQp8Uxu1mNZP9wSpD9xhSgzJGoZEwMQBb3PKXF7gFqQdXFoDyXLGpgVBVeB4htebm2a8C1HWLSenoYWINZsq+8OUamGC6nwrWFItYqPUW7MV4ySuqxWztTA0QnTojUcKB1NE1lXYj9DYAJZuYy6yDH8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nfWLDqPactt6WNXrsH0X69C7Sfmdco0YC9oa7ja2Lyg=;
 b=PsnRhF13LJyYAMjNVA/4xWDWm6CD1V9J+sbveFrkxGnz4WvWn3FHRKYAXVwUBVdPYFDIOwSZEv+6e6YE/taS4Pb+grtECO5/buPJLOBC9Rny0Jq2Dz6wZZGzjzsH/Y1mtSWocFMH+1GZIAWjNzVhqblzudkK35sJW0clsX+8HWkkT3pOxeUwRg541j80uFizznxxwPVPefpLClUHjk0vo5sMUQAbWRMX/goqNoM7wZduVgG+YXLXmeVD/dZzCtFx/8j3ZlbsdNSLD5BDh2hXHrQs4dCr4fmhCO0KFpukq6EDT3FFiPxIwzhBKfUUI3ea852KynpGcoqo6kfA1V1Q3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nfWLDqPactt6WNXrsH0X69C7Sfmdco0YC9oa7ja2Lyg=;
 b=Q4Rfi7APyABX2b2fBc/Arqh/u4i3Pa0dg5DxGYFjcTB3Yei8q1MqG6c2lzavw/Ldmbo/C5j4I1dhyB0OuRxR1R3MqGha5g9b6RQS3kI5i3kbZ1DqLwAHqdBXq/Ha5AhRt3AlTsds5CcVcDgE2YPjbAWGHkMJ4RsJBwevwlbXhBS0kd2jR3Nok0kvD9uX9balR2oiJHxAmi+yLtNX/tJrKWE5DLF92IXc2da0al8D77mCOCC/FuVMDBxFr2AL+sTvJmC51aPUyljZLxExOSChfQXX6MvmCDu5xIclBUf7RftZ0Dx3XbAS/pf+lr5LdpTa+YoTn/oo7WwYduSIcov8TQ==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "jbeulich@suse.com" <jbeulich@suse.com>,
        "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>,
        "paul@xen.org" <paul@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v5 05/14] vpci: add hooks for PCI device assign/de-assign
Thread-Topic: [PATCH v5 05/14] vpci: add hooks for PCI device assign/de-assign
Thread-Index: AQHX4ewGcVFZUW6RNkyJ6BxXBZzZQqxhIP0AgBwY6IA=
Date: Mon, 31 Jan 2022 08:45:17 +0000
Message-ID: <f4ea5ece-551e-8a91-90c6-d9f806c97d5b@epam.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-6-andr2000@gmail.com> <YeAPxA8gZZ/xBYdA@Air-de-Roger>
In-Reply-To: <YeAPxA8gZZ/xBYdA@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 490c2d50-1eb3-49c1-0d93-08d9e4960203
x-ms-traffictypediagnostic: PAXPR03MB7649:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <PAXPR03MB7649F777EE0E425432983114E7259@PAXPR03MB7649.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 qcYcFUfGVL949ke23OiRVV8mMhgtNSSGvUWJ885hszDWFQV5g6B8pfiQrZbdbMm/ES22oXVhuSRjQHrNuu9sAlIHwXScFj1H91QSk4OvniRvKfFM8GBEjbXBcKk/vQlSfJrM5+a5bDiPE000qrSwSsNuRIHL72YmdnoT18pmYwMTyoPnzn7iHx3Lhn6NzoJYE5/cMz0bE9/C1l261A6PwTU7Mn2XkWfp/FWMD3SaAOxJbP0iG5IPmNTXLgd4LMPchfdmJTPTeXipoOjbNuBfYOtLltr2uCjWKfIDrHfVXhdMqEmfvLrNcn0xLfnOXAsIfZWcAB1y3RSNu0WmVwffwNTPV4Cvvsh1zuXfO/E5WXgD2LckY/bPp5cLLkWLDS8LaJIfyEqpdDO7f1+aE6Gn2uNMI3RH5FrTOo0J8JY8tCOlUgMudK1TGrHo2OL6i47GkTFIUt640dQR4PsKem9i8SglWxIg3OaOqInzIdZ6FFqSJLJyDfnRb6IyUpijRefhVJ1b57BK7Hhgg56JMSdjMmDhkyUBjRRsnbq3w2zVGYqefNq8iNSX3pfjoUhPwNn9ma/xHhBUve94IKAi2o7fw4mMPF/kykPeaHwQT+Mw65t1C0vpNZMofMsC3kAZ9ESXYUUuYlVWrRPiCtWGU1K0THuNa1HuXV/wQdIPI++nDAmmyeua5JDIYbGbhdwjPkINsdIVlJcpZvGfqKt2/TpYy6UuZ2eoYPxIbU9jVS3U/+J9ajx93zTNbIYPeI6BO1cV
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6512007)(5660300002)(7416002)(8676002)(38100700002)(76116006)(26005)(66446008)(186003)(66556008)(64756008)(66476007)(66946007)(91956017)(8936002)(4326008)(122000001)(107886003)(2616005)(83380400001)(31696002)(71200400001)(86362001)(2906002)(508600001)(36756003)(6916009)(54906003)(31686004)(38070700005)(53546011)(6486002)(316002)(6506007)(45980500001)(20210929001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?K0tROGc4eDg4ZHgyWitEb1FwZHBrTmJpV3RUTDUrOWpLTnRzK2QybURlbHdG?=
 =?utf-8?B?UU5wOG9YWEo1Wk1CamFRdjFsa3BXbEJqVElLQW5oaDZZTFlRSHZVQmw3NUU1?=
 =?utf-8?B?K0pBai9GKzFwaE9tTWNkbDM0TkIvL2Ixa1hQaFpReFNvVXZrZmhOd21QeWRQ?=
 =?utf-8?B?eTZrNG1ISnJPS3V5THF2L3h1blRlbzhiZG1ZVjcwY3lGZm1xc2hlVEFyYzYz?=
 =?utf-8?B?YmRCczZRU1V5UWxGMkJkVFpkbkNMaytwSWNQelVWbGhaZ0FVNXFhZTRSQnlp?=
 =?utf-8?B?bUhyUEl4MWEyenZxQXltS3h3dXU3bW1MWmJFMWxhaFpuMWdpVlRSeXAwZ1pK?=
 =?utf-8?B?azhZa0RXMUNMaXFOdUw3RTVteXFYbUU0aEZEVWUwaHVqMUJNc2tDazJOY250?=
 =?utf-8?B?QTV2YzRiSzBvNmVvUlZlMXFOMzRFUFBwZ3orVHNpODgwMEI1ZitmZU5TZms0?=
 =?utf-8?B?OFBPdVVySlB0YUdrM3UzOHh5aEQvcDRJdUh6OU9JQW5admJlQks4WTVjVFpu?=
 =?utf-8?B?cnZXZzhNU2pmQXdLL0YxK3NRMkEzekdUY2dPOW5XdXgrN1NncWdYZDdCb2Y0?=
 =?utf-8?B?U3ZWQ0lxbmtJOWIrSmE0QVo4d1NRZ01sVC9Zank0RHpPOU5nU2Z1cFpvT0F1?=
 =?utf-8?B?eXV6RTBkVHR6VUxBbCtXdGZkbVlNU0FDdThSTU10WmJ4MERCVzE5MnE4WFJS?=
 =?utf-8?B?ME5KOFo2ZlVXRlpickhFbFRRZkNtdkd4MWQwZkY5bUhiUHhUc0xVTmtHUDNZ?=
 =?utf-8?B?NlZma0tERGlpMG5ITzlmQ2xzTjVpQ1J1cC9GakVaYzQxdm9lQTJ1R3BTOXdD?=
 =?utf-8?B?N2FvazJxZkdvODF0cElJakZQSTFoYmlIOCtMdkZkRkt1U3p5VkRmUFBtUytJ?=
 =?utf-8?B?enlTNGhqaVpqOXlqbkdQeFdUa0h4Ri8zcEc4cUJuNEZHNVl6SS9zdHN0LzM4?=
 =?utf-8?B?UlhrL3FKQzJVNEhtMHBrazM5bE0xY1JNRGUzSHZ3TjVwLzBGZzdFdmlzdkx3?=
 =?utf-8?B?OTl2ak9GR0lHL0NjUU1yWTFRcSsrVU5GanNQeSs1V3Y2VEZUTWVMd0FkeHBM?=
 =?utf-8?B?bHptNE5ZQU9qc2wrMVR4YS9XOHl6bjBHV0NhVDMxaDNUR2tyUEI2TGtGUEM1?=
 =?utf-8?B?RWwyd0J2NlZkbW5DYUhYb05QVzlhWU9BRWFMb01Zc3UzY3pYQXRVTVdSN21H?=
 =?utf-8?B?MGpyUjFxZFVIRjZyN1FVTUY3bnBTVk9hRTd1SFAwMlZHOExxdUtlbXlPdzV6?=
 =?utf-8?B?SUgrOW9ESTlxM21GZDMzeWNFNnpCbTI5bi9lMlJrM0ZOZkJ5Q2xRdkk5S04w?=
 =?utf-8?B?ek10dXZ1ZGZnN2YwZTlLZ1U2LzlURUMvV0NUdjFhVzIvcTdwSnNMUjcwMFN6?=
 =?utf-8?B?bUl6N0xHdEdxeW1QMDBKYU4vNStMNEhqWnRBNnd0cEZwRG9TSnB1QmlTOEd2?=
 =?utf-8?B?dFdVbjNtd0JTa0dlZjF1dUFoNXh2ckg4WGJ3VjMxUUdzSXh4Q3FRQjRjT3RM?=
 =?utf-8?B?ajlzSTVKY0haMGdEUU9FRUNhRjNxazFmdFdVNUxaRk1SVlNvcGFxNWdmSkZQ?=
 =?utf-8?B?a1AvVDBzQlcxVnVBNVgwSHZaZWlDR01RQzZ0R1I4Z1FFMHV0OE0rbWdGdGlJ?=
 =?utf-8?B?UkY0ZEZjd1VOczcvRzgxWW4xYXlPRjY4elFnT1Mza1Z0d0x6OExsWjRsNTF5?=
 =?utf-8?B?TjJGdzZEaGxlQjhkTjB3OC9wUXErZ1hxRXVySkw4a2pwMVFoQWY4WEd4Skdu?=
 =?utf-8?B?WE1jeFc1WGFRQzdBeFhsbjRvVll3eU9BNjZBYXQ5RzV1S1BuTm1xUkZzeStR?=
 =?utf-8?B?SXB0S1RBUTdXb0U3TlA0cWpDdkFQdllELytaZk9iMVpSRDFLa0kxQkFpVGxC?=
 =?utf-8?B?a0JzVnY3aThrOHdFTjBQcFgxZDZUaEhNSEIyQ3o0SThOTGQxSXh5OW1sQzNE?=
 =?utf-8?B?RzFJL2hWMFA5bERBb3dteWd4SEhRR2N1YmNCRVRsWTdLekU4TzkwNzBsQkJX?=
 =?utf-8?B?RktmUG5vKzQ2dmQ4dXo4OVhTZXk0UXFwRytoTzVFUzRHV3l2TzJacTdIMk5Z?=
 =?utf-8?B?NUhhQ3VVdWJuc1FlVkdnSTR1YjVxYzRxc3h4OElIRC8vQjF1S1YrT1g3bkVu?=
 =?utf-8?B?SThCRXhnM05zenc1T1EwUlA1VHI5MUV1bGI4SzRrYmJ6N2lOaW1TZVhPMGpY?=
 =?utf-8?B?N3FsalVVb282czZaQzRQYW1DVEtUd3lpOTVNZFRaSDNETjhrcnZGTHhqMVpt?=
 =?utf-8?B?WmJZR2VNYStydnBwVnJkZTh4ckFLZEJPR3ZPOEwreWdYOUJlRC9lQncxWTJN?=
 =?utf-8?B?Uy9wMEFMZzJ6WVpRVThnZTduL2JGMlJWamFpZjZaMFhKbDREZGprQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <441AEA57595C8241BBB8266568A8C4C5@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 490c2d50-1eb3-49c1-0d93-08d9e4960203
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2022 08:45:17.8211
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IbnhOsCUuLvxRuvdD9LZ817QINuWUyPKavbvxxUh//5+jXeIKkWTfQYD31Wncj4vsOOWlEV5A6v32Lm8s2kREhZjmkXEqIFNmap7xEJNOF61lYFYynrZVyF1a32ksPNS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7649
X-Proofpoint-ORIG-GUID: sBp-hOQ3WN0o91tQrXs9cjZmQZjekeP-
X-Proofpoint-GUID: sBp-hOQ3WN0o91tQrXs9cjZmQZjekeP-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-31_02,2022-01-28_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201310058

SGksIFJvZ2VyIQ0KDQpPbiAxMy4wMS4yMiAxMzo0MCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToN
Cj4gT24gVGh1LCBOb3YgMjUsIDIwMjEgYXQgMDE6MDI6NDJQTSArMDIwMCwgT2xla3NhbmRyIEFu
ZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBGcm9tOiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xl
a3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+PiArI2lmZGVmIENPTkZJR19IQVNfVlBD
SV9HVUVTVF9TVVBQT1JUDQo+PiArLyogTm90aWZ5IHZQQ0kgdGhhdCBkZXZpY2UgaXMgYXNzaWdu
ZWQgdG8gZ3Vlc3QuICovDQo+PiAraW50IHZwY2lfYXNzaWduX2RldmljZShzdHJ1Y3QgZG9tYWlu
ICpkLCBzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+ICt7DQo+PiArICAgIGludCByYzsNCj4+ICsN
Cj4+ICsgICAgLyogSXQgb25seSBtYWtlcyBzZW5zZSB0byBhc3NpZ24gZm9yIGh3ZG9tIG9yIGd1
ZXN0IGRvbWFpbi4gKi8NCj4+ICsgICAgaWYgKCBpc19zeXN0ZW1fZG9tYWluKGQpIHx8ICFoYXNf
dnBjaShkKSApDQo+PiArICAgICAgICByZXR1cm4gMDsNCj4+ICsNCj4+ICsgICAgc3Bpbl9sb2Nr
KCZwZGV2LT52cGNpX2xvY2spOw0KPj4gKyAgICByYyA9IHJ1bl92cGNpX2luaXQocGRldik7DQo+
IEZvbGxvd2luZyBteSBjb21tZW50IGJlbG93LCB0aGlzIHdpbGwgbGlrZWx5IG5lZWQgdG8gY2Fs
bA0KPiB2cGNpX2FkZF9oYW5kbGVycyBpbiBvcmRlciB0byBhbGxvY2F0ZSB0aGUgcGRldi0+dnBj
aSBmaWVsZC4NCj4NCj4gSXQncyBub3QgT0sgdG8gY2FycnkgdGhlIGNvbnRlbnRzIG9mIHBkZXYt
PnZwY2kgYWNyb3NzIGRvbWFpbg0KPiBhc3NpZ25hdGlvbnMsIGFzIHRoZSBkZXZpY2Ugc2hvdWxk
IGJlIHJlc2V0LCBhbmQgdGh1cyB0aGUgY29udGVudCBvZg0KPiBwZGV2LT52cGNpIHdvdWxkIGJl
IHN0YWxlLg0KPg0KPj4gKyAgICBzcGluX3VubG9jaygmcGRldi0+dnBjaV9sb2NrKTsNCj4+ICsg
ICAgaWYgKCByYyApDQo+PiArICAgICAgICB2cGNpX2RlYXNzaWduX2RldmljZShkLCBwZGV2KTsN
Cj4+ICsNCj4+ICsgICAgcmV0dXJuIHJjOw0KPj4gK30NCj4+ICsNCj4+ICsvKiBOb3RpZnkgdlBD
SSB0aGF0IGRldmljZSBpcyBkZS1hc3NpZ25lZCBmcm9tIGd1ZXN0LiAqLw0KPj4gK2ludCB2cGNp
X2RlYXNzaWduX2RldmljZShzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgcGNpX2RldiAqcGRldikN
Cj4+ICt7DQo+PiArICAgIC8qIEl0IG9ubHkgbWFrZXMgc2Vuc2UgdG8gZGUtYXNzaWduIGZyb20g
aHdkb20gb3IgZ3Vlc3QgZG9tYWluLiAqLw0KPj4gKyAgICBpZiAoIGlzX3N5c3RlbV9kb21haW4o
ZCkgfHwgIWhhc192cGNpKGQpICkNCj4+ICsgICAgICAgIHJldHVybiAwOw0KPj4gKw0KPj4gKyAg
ICBzcGluX2xvY2soJnBkZXYtPnZwY2lfbG9jayk7DQo+PiArICAgIHZwY2lfcmVtb3ZlX2Rldmlj
ZV9oYW5kbGVyc19sb2NrZWQocGRldik7DQo+IFlvdSBuZWVkIHRvIGZyZWUgdGhlIHBkZXYtPnZw
Y2kgc3RydWN0dXJlIG9uIGRlYXNzaWduLiBJIHdvdWxkIGV4cGVjdA0KPiB0aGUgZGV2aWNlIHRv
IGJlIHJlc2V0IG9uIGRlYXNzaWduLCBzbyBrZWVwaW5nIHRoZSBwZGV2LT52cGNpIGNvbnRlbnRz
DQo+IHdvdWxkIGJlIHdyb25nLg0KU3VyZSwgSSB3aWxsIHJlLWFsbG9jYXRlIHBkZXYtPnZwY2kg
dGhlbg0KPg0KPiBUaGFua3MsIFJvZ2VyLg0KVGhhbmsgeW91LA0KT2xla3NhbmRy

