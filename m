Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA0845709E
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 15:26:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228063.394563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo4qa-0004PE-DX; Fri, 19 Nov 2021 14:26:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228063.394563; Fri, 19 Nov 2021 14:26:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo4qa-0004M4-AG; Fri, 19 Nov 2021 14:26:36 +0000
Received: by outflank-mailman (input) for mailman id 228063;
 Fri, 19 Nov 2021 14:26:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W8RP=QG=epam.com=prvs=19578d545c=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mo4qX-0004KH-T2
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 14:26:34 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b0d0dd9b-4944-11ec-a9d2-d9f7a1cc8784;
 Fri, 19 Nov 2021 15:26:32 +0100 (CET)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AJDY6l4008973;
 Fri, 19 Nov 2021 14:26:28 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2050.outbound.protection.outlook.com [104.47.14.50])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3cecwvg5wk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Nov 2021 14:26:28 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB6963.eurprd03.prod.outlook.com (2603:10a6:20b:2d5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21; Fri, 19 Nov
 2021 14:26:21 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%8]) with mapi id 15.20.4713.022; Fri, 19 Nov 2021
 14:26:21 +0000
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
X-Inumbo-ID: b0d0dd9b-4944-11ec-a9d2-d9f7a1cc8784
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bI09sUs044c69kSVbqSq2hVqfYVUcoXzmD0sSCZ7vDjzzmxr4grbg39GIqkXQkxZVlo4NzrGtEj4qLHJx9iEDrUezvxt1Z5HXYIO3UunYWhM6XKyQ+/8tf993I+EYZED6U/3LtBjVpWDU1Mi9IKUQDVa6kjpuuxcHftoj7ap/KSCkv0RDcVuoM7bRXUmPDkBPE4nk3FMCCgnnXyMtQFi2hV8OWQBIVVEyLiOm+H6sa1RYlYj93EFByzgLguPBw7WpPfnhlcsfZidHWnABU/gws4LkEw7Esq34DKfQejBUGVUkg73gyc8H2uIPLs66Vk6c03ZgccfpWUVzXmovOmiRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=60NF2BieTyhpK8Bm9ETN3dsW1ZWkb6J7AwkP/4TvKLM=;
 b=RbhWHf4f7p8+44u39D4WpNgYUpFWPtLkRfP93mnZ+YSpl+MU+5/6o+4xUiTAzZINExemrlSg4MlM1ilvNYU7Dnkae+eD2NRmNKl2R7itcVok0Ijqo1Tsf7ngHZzTGDqj1/OUsNrtbNTFLAWhkgJdrJtvT2ccGmkOcCa7gn+YgdzufyTYAnE2wAlpLYYRYlxoPzYAAq82LfXYPsjxVRrYoobTpWmwQ0slYOAz3angS4dctNQN+QQ8xT4ez4k2+j5VvnJIE9//WUJJhvL3Fk95viDnbIIBpMb4Oc8rp/8PXQZVKme5PEosH+vxnpfaXNBivkIT/HhV06R+Pb4tn5Njeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=60NF2BieTyhpK8Bm9ETN3dsW1ZWkb6J7AwkP/4TvKLM=;
 b=ba4O7aWA/De7euzNL7QTubx4wDZC/rdts/C4lgEUoII/VPYem1GQBs5olWocX5UWQU4cPTaG9QvQCyuivF4mCmkXqF6N63aCDOKvyK0kb1kQ810HX0b7q3W8ZhgIjVr63/vunTkylzFoLMc9X58wIt146sY89CMX6voGonAWTAw6c80bdDUm9jStMn0FIcqJTCZQbjG3kHUDBw96PkGF6bPnNgOHSgmKbCCzD93aV3b9/Nv7OWwxgpWz3hMczV6AAH+pq1a/jKKwsJ2HOi/1qNaoqijtRcDZ8ML7YDh3ydKYTCqALK0Z5BRJ2Ix8zcgM4gMHrBg3KIFDdZ/NNJYenQ==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
        Jan Beulich
	<jbeulich@suse.com>
CC: Oleksandr Andrushchenko <andr2000@gmail.com>,
        "julien@xen.org"
	<julien@xen.org>,
        "sstabellini@kernel.org" <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
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
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 00/11] PCI devices passthrough on Arm, part 3
Thread-Topic: [PATCH v4 00/11] PCI devices passthrough on Arm, part 3
Thread-Index: AQHX0hJHqVSXqEokpUi6WhDjT3q/RqwK9kcAgAAHm4CAAADSgA==
Date: Fri, 19 Nov 2021 14:26:21 +0000
Message-ID: <28ae380f-703d-e266-a30d-d4d59615f647@epam.com>
References: <20211105065629.940943-1-andr2000@gmail.com>
 <f659a29e-f006-ddc5-53b4-236eb261e1ea@suse.com>
 <YZezXShKi1ofH5Aq@Air-de-Roger>
In-Reply-To: <YZezXShKi1ofH5Aq@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4c7888ad-fd5a-4c6e-17d0-08d9ab688f45
x-ms-traffictypediagnostic: AM9PR03MB6963:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM9PR03MB696341AA7015208F249723B4E79C9@AM9PR03MB6963.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ohm0KxX2WPxQjNPod1FQUlrRv0+Gl1nJkmp83+uMnaAGz4VaeAsUtWpslneGZIhnQB5+pZsdrkrkFHe4g7jZitjKP6Z4xIVr4zkx48V5gZ0wiDknw8FwuvFAJMzEhi/ooriiTQ3JwcfhsgRNTwFVsRUHYPnqgiDSsbl5rkvccyxyts7iWYroCFoCGqvOd96SBDvX2LSU5YiKnQzqJXuKSTozUxS6Cjc4S6UmpjPBswSLOjFKU8MS1RyY8gOzj7PdH/Gc3FIERjmP3h+LErTIqUHw2v7ixB/AYYAgJbrsS6gtCxzJ1msTlYWc9MGg+0Ei8H0oYIYPzrNDvAU/Z5/rxovL5mwiRJQFpq1Z2yY1HHF6fAThcZ8zUaS7kXaVJVcxt+eDR//JRqvzz0n0rj6ggVC1S72JtCOJPJl/8W24d4OWqwe8USGuQMgQvnqrstAEnbsYvCr7UDH9bMMqaaAjrGxj+x1JEj28vvFGSYcl5NqfRDDe2NGtPbzHel7APgK/iDtze66rzy3LhcpBrmBEbJ7T9VSNSbcBUZpbPvuDBHk6QfwFERE/D0IlX9btLqUb1iRANXShtE6Q9E4v5Wd+CuCB4hrgt+Cc7t2lR+VubvDoTpN8pTGwFV/XhgKzS78Oa+CUyl8wGd6w5qDu68tn9Fy/by3C0X1rUkHL89ec70NwA/vMHWh7F53ZWQUBMEuSgrdfjbJlVHOdltTE+U/xJlMMKDcPP7bpmBClp13vq1GcGsNLCcOdHpgWfdPWMaXcHRVI3CpOQOyCfGgloak1ugZYPPmwPD9I0QNsnPI29smabWjpT1Gq01sYKJvPmVmR4gfuWKTWVpgRCSmGhwSNcg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(83380400001)(110136005)(66556008)(64756008)(2906002)(316002)(54906003)(36756003)(38070700005)(71200400001)(4326008)(66446008)(31696002)(6486002)(122000001)(8676002)(31686004)(186003)(508600001)(66946007)(2616005)(66476007)(91956017)(6506007)(53546011)(76116006)(26005)(7416002)(966005)(38100700002)(86362001)(6512007)(8936002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZnlXdUlvRExRZmlBcXlXN29HeGFsUm5yKzVRUlhIUzkycUcvSDI0S3ZjYnlZ?=
 =?utf-8?B?SWZUalVTQmNlN1MwUkdYanlJTDJkQjc0RVArUDIvaUlBNDFFcXc5eG5sdHZm?=
 =?utf-8?B?SGRsOC9nWmxtWjl4VEFKNWdtbWFJTFQ4eVVGeWlFUkxXWDFmek82c0YzOXRU?=
 =?utf-8?B?bDI2YjJiNnBzdkp3bDh2YVlSNWxxYnY3YUdUSk54ZHRoTDBLeGZ3bEtxREph?=
 =?utf-8?B?Vk1ZTjhNR1I5QUI4UUhRTWZsSS92a2lxMUlWK0RPY2JISkh2dzZ1RWtlK3J3?=
 =?utf-8?B?QXhyMytUNzk5SG43WG8wR3RPejlTaEFRSzZkNnY0R29jWldpWUtSUThQdHF4?=
 =?utf-8?B?K2xEL2xmT293cTYxU01TTUxweUc0TFNxOXpLdko1dFo0SDJFdG1sTUt1SmFB?=
 =?utf-8?B?L3pacGd1cnNzSmcveC9xRThqcTRVNm9VNlN6b1RNdHlycE9lem9FUnUyaFFG?=
 =?utf-8?B?MDRNQlFkNlIzdSs0VmppZUlTTll6dUI1YnVRdThXUG8zQm1jRnYrVEFiNFNv?=
 =?utf-8?B?bkRtS3lFSFQ1aU9Jb2NNZUw4bUZzYkVXUEFpSDBhbmNDYmgwOXRsWXd6bjQ5?=
 =?utf-8?B?M1ZPd1Iwa3dQL0dkbzVsV2hrSlBubEFwTnhFdnR3NWZ6VE13OVJ3MEs3WG03?=
 =?utf-8?B?clh3amFTQ2pFN3pYVkZldlpzY1ZQR0dQRHJNQ29EeVBqZGFRWFhMN01hMVpv?=
 =?utf-8?B?cnRGSjF0MHZBbDNvM2duc0UxcGwrUDJPSXRndkRwdFQxclRIMHZ1RCtuQXdC?=
 =?utf-8?B?S3NSYnY1cFpxcnRkVE9rMlV6UEtrcjJlOHJGMVpvU0dObmUyQ2xiV2JEejYv?=
 =?utf-8?B?d0NDSE85RDBhQWwvRW5vVW1DOFlPaWQ5RzVPVXBkYUU3bGQ2cDdWVDBHaDB4?=
 =?utf-8?B?ZEowbWdiY1pSZkFzWWhkMmtHdDdvTWYyVzdMZmt3MWJ0aGtra0ZtYUlreTFB?=
 =?utf-8?B?YnkyRkVkT0htUHdjRlZ1ZHA2M01SUFhickUvN2lERFBNb2hWeXNYVHIvT3dI?=
 =?utf-8?B?bjR1aldhQmZEenUwSWlReXhINU9iTjYwaEU1ZGU1RngreWJDaUJISzJ0N1F5?=
 =?utf-8?B?ZG41SEt5QVlZZ2tWeUsvMHF5dHpwSFc0SWYwN1VWclVJYlRpOFNZNjhoc29q?=
 =?utf-8?B?RnNmcE51NDhoRkJnV25QKys5SVBFclNET25Jc1ovek92RlovWjdCcjBxakFx?=
 =?utf-8?B?alF1dXAxQk5aUDcxSFhyS3B2S29Xc1ZmRUJVR1p1dmlJb2ZuV3N1U29TRHAr?=
 =?utf-8?B?enlabXBMalFoOFdwT2hlcVo5SlNKVG1rMkpoeHJVWjB4WFRnczRGTTdWNG5k?=
 =?utf-8?B?aXpZN09VRVNYN1orS0lRYzJjU0dRTStjRG9BNlcyelJEa1Q0TkIwRGVZaUZl?=
 =?utf-8?B?Y0w1TzV0Q29RUjVDYkNlNmZXZExOL0wwZ0hPaEdSSGo0V29RTkYrN1JsSmVp?=
 =?utf-8?B?NnlPQUtyVmthZk96NUVxaFZMQ2lSRzNpclZVa1AzY2QySnRzYnRFQ3AyTitl?=
 =?utf-8?B?dlV4cTIyczBISmc1cUFVeEFXQkhsMWxvTEhXUzVZSlBRRXlMTDlTV2dYOUR3?=
 =?utf-8?B?aG4vY04ySHFvWGlpOTBycTZvYmdPMzlnMUtXeElndWlCZFNocE1KZWVyZElZ?=
 =?utf-8?B?RHphZncxZW81bDdSVm5BbEdNb040RWV1cW1mWjRMSGNnSkkvdGlKRXdqelFk?=
 =?utf-8?B?NlVhNWJkUXdMT0dZNmpXRkFrWFlFdG5QaFk0dHR3UnZiVnZmUm5XVGZGcERH?=
 =?utf-8?B?N0NqOSs2T3BrTmZHbURxTTVvWmNObSsrWFRSbzhwVVRpVzUzNnF1eFMvU0RT?=
 =?utf-8?B?eG05TVRVOHRJblJzd0JWc0lZc1dRRUFEZEtBWmpuRjZpOERTNXBlT1hvenRI?=
 =?utf-8?B?Y0JrK0E3RmYrejRZVlN1YnlpckI4MnQxeGo5T0R2L0x2cDRRNElxaEJIUUFT?=
 =?utf-8?B?d1htQzc3Vzl6UEZTNkVOQThuUlV6VjlrV2VrUmdmUEErL1hzLzYxb2ZzNnVu?=
 =?utf-8?B?empsMVJoQmVud1g0TWxjYTZnUzJQS3NIdXE3bjlySzFoN3EvSWJFK2dBNnph?=
 =?utf-8?B?NW5HWVBkL0xDRWtpV2JxQ0pBUnBMM25jcjlITjcwSGRJandQbUJCTCtFeVl2?=
 =?utf-8?B?QWVLakVTWmNybkxJWUUrcWxaS2NxSGhSQmhrS2JZU296NWpCakdJOXJtclRq?=
 =?utf-8?B?Z3VrTVh3Nzd3d3VEWjEzdDJFNFlLeEdKUURGWldFdWNTV0NUOWpwVW0zTXFa?=
 =?utf-8?B?dXlnanNFQ1RRQWk1Nmg5dy9BbEJtbk9tYUlXYnRlbk94b2lZeENIWEcwelVw?=
 =?utf-8?B?emQxTHZJbHVwOUpwR0RoSW9TeW1kblJxQW1FOWc0NjJSYmttUTllQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C15940C801799D449DDC105194E61BA1@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c7888ad-fd5a-4c6e-17d0-08d9ab688f45
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2021 14:26:21.6511
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sAmQJbIOHuqF9r8f4J4B8YCVDqUbpdMTIUCdWExm/jI/BdQhk34i1+v+IbwjfJeMnzrqNUFjxdepJVjwqQLSRXgJBG3QNvBBvkngvrQedaleW0Mjh4VRKUjFOG8dI/mv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6963
X-Proofpoint-GUID: 5p_S3KcqK1dbBZAhukN6bH_X6Wx_Q5V6
X-Proofpoint-ORIG-GUID: 5p_S3KcqK1dbBZAhukN6bH_X6Wx_Q5V6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-19_09,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 spamscore=0 mlxscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 mlxlogscore=499
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111190080

DQoNCk9uIDE5LjExLjIxIDE2OjIzLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBGcmks
IE5vdiAxOSwgMjAyMSBhdCAwMjo1NjoxMlBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+
IE9uIDA1LjExLjIwMjEgMDc6NTYsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+
IEZyb206IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0Bl
cGFtLmNvbT4NCj4+Pg0KPj4+IEhpLCBhbGwhDQo+Pj4NCj4+PiBUaGlzIHBhdGNoIHNlcmllcyBp
cyBmb2N1c2luZyBvbiB2UENJIGFuZCBhZGRzIHN1cHBvcnQgZm9yIG5vbi1pZGVudGl0eQ0KPj4+
IFBDSSBCQVIgbWFwcGluZ3Mgd2hpY2ggaXMgcmVxdWlyZWQgd2hpbGUgcGFzc2luZyB0aHJvdWdo
IGEgUENJIGRldmljZSB0bw0KPj4+IGEgZ3Vlc3QuIFRoZSBoaWdobGlnaHRzIGFyZToNCj4+Pg0K
Pj4+IC0gQWRkIHJlbGV2YW50IHZwY2kgcmVnaXN0ZXIgaGFuZGxlcnMgd2hlbiBhc3NpZ25pbmcg
UENJIGRldmljZSB0byBhIGRvbWFpbg0KPj4+ICAgIGFuZCByZW1vdmUgdGhvc2Ugd2hlbiBkZS1h
c3NpZ25pbmcuIFRoaXMgYWxsb3dzIGhhdmluZyBkaWZmZXJlbnQNCj4+PiAgICBoYW5kbGVycyBm
b3IgZGlmZmVyZW50IGRvbWFpbnMsIGUuZy4gaHdkb20gYW5kIG90aGVyIGd1ZXN0cy4NCj4+Pg0K
Pj4+IC0gRW11bGF0ZSBndWVzdCBCQVIgcmVnaXN0ZXIgdmFsdWVzIGJhc2VkIG9uIHBoeXNpY2Fs
IEJBUiB2YWx1ZXMuDQo+Pj4gICAgVGhpcyBhbGxvd3MgY3JlYXRpbmcgYSBndWVzdCB2aWV3IG9m
IHRoZSByZWdpc3RlcnMgYW5kIGVtdWxhdGVzDQo+Pj4gICAgc2l6ZSBhbmQgcHJvcGVydGllcyBw
cm9iZSBhcyBpdCBpcyBkb25lIGR1cmluZyBQQ0kgZGV2aWNlIGVudW1lcmF0aW9uIGJ5DQo+Pj4g
ICAgdGhlIGd1ZXN0Lg0KPj4+DQo+Pj4gLSBJbnN0ZWFkIG9mIGhhbmRsaW5nIGEgc2luZ2xlIHJh
bmdlIHNldCwgdGhhdCBjb250YWlucyBhbGwgdGhlIG1lbW9yeQ0KPj4+ICAgIHJlZ2lvbnMgb2Yg
YWxsIHRoZSBCQVJzIGFuZCBST00sIGhhdmUgdGhlbSBwZXIgQkFSLg0KPj4+DQo+Pj4gLSBUYWtl
IGludG8gYWNjb3VudCBndWVzdCdzIEJBUiB2aWV3IGFuZCBwcm9ncmFtIGl0cyBwMm0gYWNjb3Jk
aW5nbHk6DQo+Pj4gICAgZ2ZuIGlzIGd1ZXN0J3MgdmlldyBvZiB0aGUgQkFSIGFuZCBtZm4gaXMg
dGhlIHBoeXNpY2FsIEJBUiB2YWx1ZSBhcyBzZXQNCj4+PiAgICB1cCBieSB0aGUgaG9zdCBicmlk
Z2UgaW4gdGhlIGhhcmR3YXJlIGRvbWFpbi4NCj4+PiAgICBUaGlzIHdheSBoYXJkd2FyZSBkb2Ft
aW4gc2VlcyBwaHlzaWNhbCBCQVIgdmFsdWVzIGFuZCBndWVzdCBzZWVzDQo+Pj4gICAgZW11bGF0
ZWQgb25lcy4NCj4+Pg0KPj4+IFRoZSBzZXJpZXMgYWxzbyBhZGRzIHN1cHBvcnQgZm9yIHZpcnR1
YWwgUENJIGJ1cyB0b3BvbG9neSBmb3IgZ3Vlc3RzOg0KPj4+ICAgLSBXZSBlbXVsYXRlIGEgc2lu
Z2xlIGhvc3QgYnJpZGdlIGZvciB0aGUgZ3Vlc3QsIHNvIHNlZ21lbnQgaXMgYWx3YXlzIDAuDQo+
Pj4gICAtIFRoZSBpbXBsZW1lbnRhdGlvbiBpcyBsaW1pdGVkIHRvIDMyIGRldmljZXMgd2hpY2gg
YXJlIGFsbG93ZWQgb24NCj4+PiAgICAgYSBzaW5nbGUgUENJIGJ1cy4NCj4+PiAgIC0gVGhlIHZp
cnR1YWwgYnVzIG51bWJlciBpcyBzZXQgdG8gMCwgc28gdmlydHVhbCBkZXZpY2VzIGFyZSBzZWVu
DQo+Pj4gICAgIGFzIGVtYmVkZGVkIGVuZHBvaW50cyBiZWhpbmQgdGhlIHJvb3QgY29tcGxleC4N
Cj4+Pg0KPj4+IFRoZSBzZXJpZXMgd2FzIGFsc28gdGVzdGVkIG9uOg0KPj4+ICAgLSB4ODYgUFZI
IERvbTAgYW5kIGRvZXNuJ3QgYnJlYWsgaXQuDQo+Pj4gICAtIHg4NiBIVk0gd2l0aCBQQ0kgcGFz
c3Rocm91Z2ggdG8gRG9tVSBhbmQgZG9lc24ndCBicmVhayBpdC4NCj4+Pg0KPj4+IFRoYW5rIHlv
dSwNCj4+PiBPbGVrc2FuZHINCj4+Pg0KPj4+IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvICgxMSk6
DQo+Pj4gICAgdnBjaTogZml4IGZ1bmN0aW9uIGF0dHJpYnV0ZXMgZm9yIHZwY2lfcHJvY2Vzc19w
ZW5kaW5nDQo+Pj4gICAgdnBjaTogY2FuY2VsIHBlbmRpbmcgbWFwL3VubWFwIG9uIHZwY2kgcmVt
b3ZhbA0KPj4+ICAgIHZwY2k6IG1ha2UgdnBjaSByZWdpc3RlcnMgcmVtb3ZhbCBhIGRlZGljYXRl
ZCBmdW5jdGlvbg0KPj4+ICAgIHZwY2k6IGFkZCBob29rcyBmb3IgUENJIGRldmljZSBhc3NpZ24v
ZGUtYXNzaWduDQo+Pj4gICAgdnBjaS9oZWFkZXI6IGltcGxlbWVudCBndWVzdCBCQVIgcmVnaXN0
ZXIgaGFuZGxlcnMNCj4+PiAgICB2cGNpL2hlYWRlcjogaGFuZGxlIHAybSByYW5nZSBzZXRzIHBl
ciBCQVINCj4+PiAgICB2cGNpL2hlYWRlcjogcHJvZ3JhbSBwMm0gd2l0aCBndWVzdCBCQVIgdmll
dw0KPj4+ICAgIHZwY2kvaGVhZGVyOiBlbXVsYXRlIFBDSV9DT01NQU5EIHJlZ2lzdGVyIGZvciBn
dWVzdHMNCj4+PiAgICB2cGNpL2hlYWRlcjogcmVzZXQgdGhlIGNvbW1hbmQgcmVnaXN0ZXIgd2hl
biBhZGRpbmcgZGV2aWNlcw0KPj4+ICAgIHZwY2k6IGFkZCBpbml0aWFsIHN1cHBvcnQgZm9yIHZp
cnR1YWwgUENJIGJ1cyB0b3BvbG9neQ0KPj4+ICAgIHhlbi9hcm06IHRyYW5zbGF0ZSB2aXJ0dWFs
IFBDSSBidXMgdG9wb2xvZ3kgZm9yIGd1ZXN0cw0KPj4gSWYgSSdtIG5vdCBtaXN0YWtlbiBieSB0
aGUgZW5kIG9mIHRoaXMgc2VyaWVzIGEgZ3Vlc3QgY2FuIGFjY2VzcyBhDQo+PiBkZXZpY2UgaGFu
ZGVkIHRvIGl0LiBJIGNvdWxkbid0IGZpbmQgYW55dGhpbmcgZGVhbGluZyB3aXRoIHRoZQ0KPj4g
dXNlcyBvZiB2cGNpX3tyZWFkLHdyaXRlfV9odygpIGFuZCB2cGNpX2h3X3tyZWFkLHdyaXRlfSoo
KSB0byBjb3Zlcg0KPj4gY29uZmlnIHJlZ2lzdGVycyBub3QgY292ZXJlZCBieSByZWdpc3RlcmVk
IGhhbmRsZXJzLiBJTU8gdGhpcyBzaG91bGQNCj4+IGhhcHBlbiBiZWZvcmUgcGF0Y2ggNTogQmVm
b3JlIGFueSBoYW5kbGVycyBnZXQgcmVnaXN0ZXJlZCB0aGUgdmlldyBhDQo+PiBndWVzdCB3b3Vs
ZCBoYXZlIHdvdWxkIGJlIGFsbCBvbmVzIG5vIG1hdHRlciB3aGljaCByZWdpc3RlciBpdA0KPj4g
YWNjZXNzZXMuIEhhbmRsZXIgcmVnaXN0cmF0aW9uIHdvdWxkIHRoZW4gInB1bmNoIGhvbGVzIiBp
bnRvIHRoaXMNCj4+ICJjdXJ0YWluIiwgYXMgb3Bwb3NlZCB0byBEb20wLCB3aGVyZSBoYW5kbGVy
IHJlZ2lzdHJhdGlvbiBoaWRlcw0KPj4gcHJldmlvdXNseSB2aXNpYmxlIHJhdyBoYXJkd2FyZSBy
ZWdpc3RlcnMuDQo+IEZXSVcsIEkndmUgYWxzbyByYWlzZWQgdGhlIHNhbWUgY29uY2VybiBpbiBh
IGRpZmZlcmVudCB0aHJlYWQ6DQo+DQo+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRw
czovL2xvcmUua2VybmVsLm9yZy94ZW4tZGV2ZWwvWVlEN1ZtREdLSlJraWQ0YUBBaXItZGUtUm9n
ZXIvX187ISFHRl8yOWRiY1FJVUJQQSFnaWhYNmMyTWc4N0FLU0RNbWgxeHJSblBqVFhaa2dSM2tx
UHhnLVdQZ2hBZGJZNTlnbUpLNU5na2Y0T0pGSzZOVTVJd0NTdFlBUSQgW2xvcmVbLl1rZXJuZWxb
Ll1vcmddDQo+DQo+IEl0IHNlZW1zIGxpa2UgdGhpcyBpcyBmdXR1cmUgd29yaywNClllcywgaXQg
dGFrZXMgcXVpdGUgc29tZSB0aW1lIHRvIGdldCBldmVuIHdoYXQgd2UgaGF2ZSBub3cuLi4NCj4g
ICBidXQgdW5sZXNzIHN1Y2ggYSBtb2RlbCBpcw0KPiBpbXBsZW1lbnRlZCB2UENJIGNhbm5vdCBi
ZSB1c2VkIGZvciBndWVzdCBwYXNzdGhyb3VnaC4NCkJ1dCBpdCBjYW4gYmUgYSB0ZWNoLXByZXZp
ZXcNCj4NCj4gSSdtIGZpbmUgd2l0aCBkb2luZyBpdCBpbiBhIHNlcGFyYXRlIHNlcmllcywgYnV0
IG5lZWRzIHRvIGJlIGtlcHQgaW4NCj4gbWluZC4NClN1cmUNCj4NCj4gUmVnYXJkcywgUm9nZXIu
DQo=

