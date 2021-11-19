Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B60456F76
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 14:20:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227914.394322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo3nq-00028U-CJ; Fri, 19 Nov 2021 13:19:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227914.394322; Fri, 19 Nov 2021 13:19:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo3nq-00026M-8M; Fri, 19 Nov 2021 13:19:42 +0000
Received: by outflank-mailman (input) for mailman id 227914;
 Fri, 19 Nov 2021 13:19:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W8RP=QG=epam.com=prvs=19578d545c=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mo3np-00026C-3F
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 13:19:41 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 594ba673-493b-11ec-9787-a32c541c8605;
 Fri, 19 Nov 2021 14:19:39 +0100 (CET)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AJAxaeH008619;
 Fri, 19 Nov 2021 13:19:36 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2057.outbound.protection.outlook.com [104.47.12.57])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3ceanc8h2s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Nov 2021 13:19:36 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB7427.eurprd03.prod.outlook.com (2603:10a6:20b:267::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Fri, 19 Nov
 2021 13:19:31 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%8]) with mapi id 15.20.4713.022; Fri, 19 Nov 2021
 13:19:31 +0000
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
X-Inumbo-ID: 594ba673-493b-11ec-9787-a32c541c8605
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CC5DTKD+4nS8nAr9ozNSfPPVsrGp+05zEVMq14Y9g7bBy1dFC8XpAT4jqanYOSmdrYdzdGNMmnvtR4uvuhu+UuOc3BbbOeWLTZZU1j4i1JMsCcIsw1EzeJNciM/ooocsgTWb8W+JRlSo64OlvnWGli1Rrk8SvYwcyipMDdZ+vMmvVH98zyngmmuP5qh4xG9HnVRDw9V/gNn7UL6Hxz/gG6COzBqMxebjEYxONXPwX2fXoXtv0+/oYOgnzqRUkgDs0BXBd+/gTiBKvNKeM/wlzOLivJGx8fldqLE4t7pwMc9rCqZEdehx3w6omCxcQW5MLlhOv1N9O1+oiI8m/gAQHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WSE1iueei6cBrR3EW14x+V83LQOjv9OHA7qUyja6uRQ=;
 b=ByfaZodZEShbZHlEaeg9Re/ffzOVO4pz3U9qzl0f7ZcEzVskYnIXp1GTs7A5VIqbeBQEm0mKibJFbr/Y6X1o1Ymz8GdjD4Dl2lJ80/kU4c8sCichXkBOlvEmCy5rtUuPBLpEo0s9OzBg1kZVN6pNX7okz4x+FDSNOrhh7z9ieWp0EaPuFovUwJRvCWcijRua1fwPYkFi8DSjHp4UL2b9p8ep0TO15LhOTRG4y1N6FvO/N8ngPYMTlIMAOcyeJ2nQeuNBeFLoD/s8rZor2WQEU+IaOUWSBptgWF/j23c6q/A1IUb1cGlE3M6lNhZcGHAfCwLUjgHqONFsXWEjOvgTkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WSE1iueei6cBrR3EW14x+V83LQOjv9OHA7qUyja6uRQ=;
 b=hj7RU/CO3zyMEhdzaU17NVxHyDCXipGL7y5M16H6IPrNlgWeULy+Pp9hyBqTpYcaV/TxftHqeABB1UM6WJ0Lku+MroNHFYphJjbd1vuetPLs7tPsO/0/hsIO6+XYJ9tsxAFUBnAEck++/lQg/LLCWw61mI5x/PlWdrJBgcj0Dxh6lLbYyARinfcudM+qPojb69jZkHZqqnxb29L6BRUE4eiVC2N0b95M4i8x9+Zj1wVg3G3JWRovxwyG5UXx+dQZ4mAfmOP9FtvepZGvvO0hWyMmTZU5fPV0LhhxV7wbaU+pFfO4kxrljFyx/MAJ3lXt1yGRkL9Vsme55rwE4twHIw==
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
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 06/11] vpci/header: handle p2m range sets per BAR
Thread-Topic: [PATCH v4 06/11] vpci/header: handle p2m range sets per BAR
Thread-Index: 
 AQHX0hJLwt+wJ2t1lka5jlbMIq7ZAqwK13MAgAACAoCAAAkUAIAAAXCAgAAEdQCAAAOYAA==
Date: Fri, 19 Nov 2021 13:19:31 +0000
Message-ID: <3cca175c-5b33-2c50-bf4d-34bbe844ab11@epam.com>
References: <20211105065629.940943-1-andr2000@gmail.com>
 <20211105065629.940943-7-andr2000@gmail.com>
 <9aec23b3-2269-39fe-9fc0-fb8cf7f9de44@suse.com>
 <1a380ef9-bdc9-bbfa-35b7-ec1c901e3019@epam.com>
 <76e929f9-2df1-951f-55bf-58caba80750c@suse.com>
 <ea3e52f3-c844-d2a7-2f45-9d4e1bd04d5a@epam.com>
 <a60f0837-3a01-4d87-7816-ae4a0a6a8413@suse.com>
In-Reply-To: <a60f0837-3a01-4d87-7816-ae4a0a6a8413@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 685ed210-9f1a-4299-9166-08d9ab5f38bb
x-ms-traffictypediagnostic: AM9PR03MB7427:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM9PR03MB742796E5F700C926BBEFED36E79C9@AM9PR03MB7427.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 xzRpAlBAUw6nGlotyXQfKgYB4Qcn9MMKaKAmVmGS8XZRWSJwa0DV3bDM1ScJnqkyFFbaoJw1luUe10cpqkigCEjeCAq7J1fkGRJQoXlUQYD6NulJGv6sxoDtW8Aq3lxCGn33Xc4Qm+MUp659R+z/tf3bwqFNzti86RbrsLKjELc+2XURcfeATn5NEWq7AARe3GU3t0UvQ7I18jIEY2rLy03SFY7CeMZLSvl6NU8aDLwUkC0iV9bzh8J50sqgGt9jwOBR5e2YekmiROuQYzAiJ91BVthLHqrhQHvbZGUXXce7l8jwEVL+TzIXaX29Y0DGtAfdG6mSbNM9O0MQGlxlqNNTOv/qUEolsGB5A5wwzIVrkhJUfNItXWudJaQXtiMrdB6mc+U/eldwX2bW7dd4mfvTMa1OAwVYCdaOlta179eR7eWIDAOTPpITST+ehevDhFstsaF4D/Qk/q3vLN9wEg4CGarxvQznnDTc7QCBz+Y+/+SoWTY3rusdJsq8sEJwhFPtbYRwS+o6kHZi4/NEfM5476ki5FtHZhWas3W8pO5wkuybCAMPzRC1GuV1XiCp49F8A11X3Y8mYlBDlgV+PQIIzuIfWyeLoV++mGDTOOQOOK41kJ8grry9/HKVvZ0Fe1xd2sm3wdBLcgYDHqLPMkb56ve8PHtoz00rvlrXeFcAw8GzLof/EOhpoytlIalSs2x+Hrd/9PJqsTcE9McjiaBCna0tuywAFaXjndqJ6g9pBor6ISkcEv3QVmQB9E0Q
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(31696002)(122000001)(38100700002)(8936002)(2616005)(6506007)(66946007)(5660300002)(66556008)(8676002)(508600001)(64756008)(91956017)(31686004)(6916009)(26005)(66476007)(66446008)(53546011)(54906003)(4326008)(36756003)(186003)(6512007)(86362001)(7416002)(2906002)(76116006)(316002)(6486002)(71200400001)(38070700005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?OFVqU0N2UnAwVDZ3TEhaVHZZKzUvZ09VZlJaczZtZHN0UmtlZWNsenpsTmlU?=
 =?utf-8?B?QzlmVjJBSVhueXNpQVUrQmpkeHl6ZHZMRGR4MzQ1NjYrNStPZklJU1pXVjNn?=
 =?utf-8?B?cXg5UkY0SUE1ODkxckJlT29qbFNTL1B1SEcyMitFSllqSDRVYU9oUWxHY3Rs?=
 =?utf-8?B?bVA0VFNJanNsbGFuZlZGVzlwT0VRb3FTSUo2bjdsNmVYNlZpdjBoUnFocHhL?=
 =?utf-8?B?S3YrQzIzbS9CaGZ5TDVoYXJPRTJvMEx4VTY5VGtKQVAyTDFpditNKzNQQkds?=
 =?utf-8?B?SHRmVEd6emd3bVFaQWVydlFYNytOSXFmaDJPaWJsc0RiVUVHdUVkL05QVWpo?=
 =?utf-8?B?Ni9QODdjZjFsQjlKb1EwQWxZOVcxWGlWSEFXRnpxYWRueUZyUmZtRGo1dm1n?=
 =?utf-8?B?a1R1MVFscEI0ZFRXQ2R2YVlhSWw4bXZCMkhvbUszZXFKY0pScTJnRDNuYW1P?=
 =?utf-8?B?dlFucDFXbjNXZjA3VEJiNDJDWlE2eDMzMkd1K3BWcWpSbU1VcEFHTnBkTmRj?=
 =?utf-8?B?Skd0S2F1eHZ6N3ZwQm1XRWY1cUJsWXlWOVVVN3NzTmtScUc4N0dJdk12eWN4?=
 =?utf-8?B?V3R6bzltZ2pzdDJSREVWMFF6ZjBSb3BLMTNjV2lUTngvYnVGTUhMWlA3Wlc3?=
 =?utf-8?B?MStuMDVuS1BmckRzR25aT1pLUmJZMW5mNFlTR3lRTkdINEJ1d1Z1Wkk3MDhS?=
 =?utf-8?B?cWhXNzFOOWZRVlhCcmh0WC83eStjM3V0b25qQkpOZ0xjOWFMUGk1aUdCbWUv?=
 =?utf-8?B?dkQwMEJUL3VEbFFUUlI1OWlXeDA5cnptRGdtb3dEalRyRXpuT2FKYW96Ny81?=
 =?utf-8?B?elJjRXRhSGFqUUxTREhHWHRVS3poVVVpWGZtNXhoZzVsSHZvWFFtSzJaSUZn?=
 =?utf-8?B?dUZGZmhuYnl3eVB3dCtJWUptRGtTL1h5SDZITVoxV3dRTFNnZGFtNXNvNGVE?=
 =?utf-8?B?UFBzaVBEcXVDREZwbERBNEhOWG9BZFh4WXRHbnVtOE1YZlBIMmF1WjE2dXd4?=
 =?utf-8?B?YzljU2E4RDhSTVZHSlVJY3NJdytOWll0NEZtUTRpUmxkNXF6OHIvbTE3VXUw?=
 =?utf-8?B?QVR5eVduVHdmSGh3Si9vUlRHbkRZSTE3UzdyaUErcFlBdnVlSGdjQm80Vmhy?=
 =?utf-8?B?bldWUk5GV0I1SEJVVmdHUmtDalhkT1JTUCtIRlBIMDV5VGVtQjVQWWVuQ25K?=
 =?utf-8?B?cEVuUFlOdFdtbXVjQjQrVEJaajZ6THlENEY4Ny93OUJzeWl4NEJTTDQxSzVK?=
 =?utf-8?B?bkxFbFVYZjZaNlk3WW4xRW5Iak8vcTRXZmFRMmx3cXRoaEMxYzlqVmcveUts?=
 =?utf-8?B?WDUvc1RVSWR5RWgyMDEreXRLL3FGMnhYUVlZWC9uZWg5L1lxM29nZ25wb3NL?=
 =?utf-8?B?d2xBZGY5cC9tNmV2aitXcWtrdTYzbUh6MGVmbHVhYlJ4SmpCVGh6SG9uV1ZS?=
 =?utf-8?B?blNRVVoyWVE3OVk4Uy9WV2pnVTFxOWcrWXlHZTJFMTd3RVZDZ0RhT1dyaDdT?=
 =?utf-8?B?RVlNcjJRUUM5L1FXNE9VZFEzYWdwdWN5WDF2MmZVSnNyNFpjVXNYOEYzNVlC?=
 =?utf-8?B?Qm04MWVnMVE3WEY3djJCaEM5VWZqaDZnQ2cvbm1LR0F1a0lVajdMVUJoNlBQ?=
 =?utf-8?B?OXF4NVNIUE1HbmZCYUZJTC9kbWRWd0tnWnJJcXBNUDlTcDIrbHBsNUNXbTVo?=
 =?utf-8?B?UjhXMnVCdGtJNE1MQ0pZL0FiYkh6NW53K3Q4V00rNkhLa0d6MXRJb3UzdlMx?=
 =?utf-8?B?cTVPUEVKSUF2ZmJ4aDY5SFZBOFl4SWNKNUZ0Tm1oSEROeTd0UG90VDJxY2tr?=
 =?utf-8?B?dTdSaklOVk1IVElDZlQyM2xMZHR3Qk5UNDF5dFJiN1RxWVA5aWE0REVkdDFR?=
 =?utf-8?B?L0Q4aFQ0YlZLbTAzUXlMbS9qdVM0OXFsT3VoaU5UTHVkYm9rdTRPNFVkdjZu?=
 =?utf-8?B?cmV4dUNJeU9ZNmVnNzl5OFIrMlNVWWVkck1HczZCeGlyU3NUQ1lOS1NYNXdi?=
 =?utf-8?B?UFZWLzhTRTUzbnh0YnpqTlppUjZjcjhIcFVTeWJSaWtkZllRRlF5RlEvdEJR?=
 =?utf-8?B?cmxQbXFhK2NtbzRqVXcwWjgrWTZIZTdHK0I1bXJXS3ZrbTU2TE5hd3MvWWd3?=
 =?utf-8?B?UHQvekR4dS9TSUwxaXJacGZ3U21iV3pFRWQyY2Z0V2YwZ241VUUzdFRIbG9s?=
 =?utf-8?B?RW1PaDkzejVPbnpXdUxVa1BBZzM1UGk5U29xL1lIakNzYTJ2RFYyYU5YT21L?=
 =?utf-8?B?WGpkd1dKdUhnWmRWVUdVMDlCeWhxY3hKKzg1U3doV0FPUnJoSzhDblNpMWRD?=
 =?utf-8?B?cXUxS0VRNU4wV3U2RXdzSTBZMTg0Z04xQnFpdDdZa2RBTmxWaEhFZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <926891EFD45137499EC71BD093FB7FE3@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 685ed210-9f1a-4299-9166-08d9ab5f38bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2021 13:19:31.0669
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1Prxv8UjQj5vurV2ys9LIbmpfRe0g8em4C1aAionPV2CpVceMsVNcS/wnM91hNWVF2e2/OYMmXK5B7qQa93/VEXtYlgWZcp8MIugcsyvNJ8KHKiGVOUJCFKf0iVokvjU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7427
X-Proofpoint-ORIG-GUID: _gAeb3sGu74RkFIHFfnJtXIQcU0cNurv
X-Proofpoint-GUID: _gAeb3sGu74RkFIHFfnJtXIQcU0cNurv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-19_09,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 clxscore=1015
 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111190074

DQoNCk9uIDE5LjExLjIxIDE1OjA2LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTkuMTEuMjAy
MSAxMzo1MCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBPbiAxOS4xMS4yMSAx
NDo0NSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMTkuMTEuMjAyMSAxMzoxMywgT2xla3Nh
bmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+IE9uIDE5LjExLjIxIDE0OjA1LCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+Pj4+IE9uIDA1LjExLjIwMjEgMDc6NTYsIE9sZWtzYW5kciBBbmRydXNo
Y2hlbmtvIHdyb3RlOg0KPj4+Pj4+IEZyb206IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVr
c2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4+Pj4+Pg0KPj4+Pj4+IEluc3RlYWQgb2Yg
aGFuZGxpbmcgYSBzaW5nbGUgcmFuZ2Ugc2V0LCB0aGF0IGNvbnRhaW5zIGFsbCB0aGUgbWVtb3J5
DQo+Pj4+Pj4gcmVnaW9ucyBvZiBhbGwgdGhlIEJBUnMgYW5kIFJPTSwgaGF2ZSB0aGVtIHBlciBC
QVIuDQo+Pj4+PiBJaXJjIFJvZ2VyIGRpZCBpbmRpY2F0ZSBhZ3JlZW1lbnQgd2l0aCB0aGUgc3Bp
dHRpbmcuIE1heSBJIG5ldmVydGhlbGVzcw0KPj4+Pj4gYXNrIHRoYXQgZm9yIHBvc3Rlcml0eSB5
b3Ugc2F5IGEgd29yZCBoZXJlIGFib3V0IHRoZSBvdmVyaGVhZCwgdG8gbWFrZQ0KPj4+Pj4gY2xl
YXIgdGhpcyB3YXMgYSBjb25zY2lvdXMgZGVjaXNpb24/DQo+Pj4+IFN1cmUsIGJ1dCBjb3VsZCB5
b3UgcGxlYXNlIGhlbHAgbWUgd2l0aCB0aGF0IHNlbnRlbmNlIHRvIHBsZWFzZSB5b3VyDQo+Pj4+
IGV5ZT8gSSBtZWFuIHRoYXQgaXQgd2FzIHlvdSBzZWVpbmcgdGhlIG92ZXJoZWFkIHdoaWxlIEkg
d2FzIG5vdCBhcw0KPj4+PiB0byBpbXBsZW1lbnQgdGhlIHNpbWlsYXIgZnVuY3Rpb25hbGl0eSBh
cyByYW5nZSBzZXRzIGRvIEkgc3RpbGwgdGhpbmsgd2UnbGwNCj4+Pj4gZHVwbGljYXRlIHJhbmdl
IHNldHMgYXQgdGhlIGVuZCBvZiB0aGUgZGF5Lg0KPj4+ICJOb3RlIHRoYXQgcmFuZ2VzZXRzIHdl
cmUgY2hvc2VuIGhlcmUgZGVzcGl0ZSB0aGVyZSBiZWluZyBvbmx5IHVwIHRvDQo+Pj4gPE4+IHNl
cGFyYXRlIHJhbmdlcyBpbiBlYWNoIHNldCAodHlwaWNhbGx5IGp1c3QgMSkuIiBBbGJlaXQgdGhh
dCdzDQo+Pj4gdGhlbiBzdGlsbCBsYWNraW5nIGEganVzdGlmaWNhdGlvbiBmb3IgdGhlIGNob2lj
ZS4gRWFzZSBvZg0KPj4+IGltcGxlbWVudGF0aW9uPw0KPj4gSSBndWVzcyB5ZXMuIEknbGwgcHV0
Og0KPj4NCj4+ICJOb3RlIHRoYXQgcmFuZ2VzZXRzIHdlcmUgY2hvc2VuIGhlcmUgZGVzcGl0ZSB0
aGVyZSBiZWluZyBvbmx5IHVwIHRvDQo+PiA8Tj4gc2VwYXJhdGUgcmFuZ2VzIGluIGVhY2ggc2V0
ICh0eXBpY2FsbHkganVzdCAxKS4gQnV0IHJhbmdlc2V0IHBlciBCQVINCj4+IHdhcyBjaG9zZW4g
Zm9yIHRoZSBlYXNlIG9mIGltcGxlbWVudGF0aW9uIGFuZCBleGlzdGluZyBjb2RlIHJlLXVzYWJp
bGl0eS4iDQo+IEZUQU9EIHBsZWFzZSBkb24ndCBmb3JnZXQgdG8gcmVwbGFjZSB0aGUgPE4+IC0g
SSB3YXNuJ3Qgc3VyZSBpZiBpdCB3b3VsZA0KPiBiZSAyIG9yIDMuDQpJdCBzZWVtcyB3ZSBjYW4n
dCBwdXQgdGhlIGV4YWN0IG51bWJlciBhcyBpdCBkZXBlbmRzIG9uIGhvdyBtYW55IE1TSS9NU0kt
WA0KaG9sZXMgYXJlIHRoZXJlIGFuZCB0aGF0IGRlcGVuZHMgb24gYW4gYXJiaXRyYXJ5IGRldmlj
ZSBwcm9wZXJ0aWVzLg0KPiAgIEFsc28gKG5pdCkgSSBkb24ndCB0aGluayBzdGFydGluZyB0aGUg
Mm5kIHNlbnRlbmNlIHdpdGggIkJ1dA0KPiAuLi4iIGZpdHMgd2l0aCB0aGUgMXN0IHNlbnRlbmNl
Lg0KU3VyZSwgSSB3aWxsIGNsZWFuIGl0IHVwDQo+DQo+IEphbg0KPg0KVGhhbmsgeW91LA0KT2xl
a3NhbmRy

