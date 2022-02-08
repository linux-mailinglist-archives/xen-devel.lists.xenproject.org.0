Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3A94AD519
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 10:38:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267876.461635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHMxB-00081l-1F; Tue, 08 Feb 2022 09:38:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267876.461635; Tue, 08 Feb 2022 09:38:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHMxA-0007z9-U0; Tue, 08 Feb 2022 09:38:28 +0000
Received: by outflank-mailman (input) for mailman id 267876;
 Tue, 08 Feb 2022 09:38:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1FiY=SX=epam.com=prvs=40383cc40e=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nHMx9-0007z2-AW
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 09:38:27 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc4b713c-88c2-11ec-8eb8-a37418f5ba1a;
 Tue, 08 Feb 2022 10:38:25 +0100 (CET)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2189EEG1015967;
 Tue, 8 Feb 2022 09:38:22 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2170.outbound.protection.outlook.com [104.47.17.170])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3e3nq283p5-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Feb 2022 09:38:21 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM6PR0302MB3287.eurprd03.prod.outlook.com (2603:10a6:209:17::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Tue, 8 Feb
 2022 09:38:16 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77%3]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 09:38:16 +0000
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
X-Inumbo-ID: dc4b713c-88c2-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XhNThd0bLD2kIkQjKTt8PzH1IonmlW6xQDENCmmz77vHf6ov4s5uZinhuFSfp8BHIASij3UNj7P6xSYw1xCcw/q7UlCLSh8EFz4fT68bKCzq1b98BfRTucvSY9CV1OTvpBKYb1vaVARxvsI6qX6ESnl74s6v3+cE9jUoRwZTFbFHk7OShZnHB+6SYXblxolyW9kS8fc7ohN7yxG0lG/qSooGy3FXXkuwMOgNkiSG0i9xEfvM4xSHOExxVH9fa/yQBTmfrhNuQSBiLgRAlldeb+8nlC/icPT7qa7iifeybMa1DI1FgMMcYhVvZkb5o8veXVqgsgi1qSrxJt/Rl3FWCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PxszTGn+ayGJwVpBYxTK34sEvqohJFthvg0sL1ZQAeE=;
 b=cZswvwg55lxlyoBDaHamR/beiJ10dP/uxqTEmuw7417dOYYUR7vcUzW1zuT8Q3M/s/eEonsykw4PEZhSIKEoM/+kas70g3mNN470HUJs8WffSonNBW82pi7g7STgv613wdYzSvB6s+4+4Mm+kYnjbJFKBtBD3YdrMmZxSebZX/TQ2hetnZdYt4Q8NFlPc8ult/iI3aTPnyeobNNB2YowbLDKMhfEF2BVF52wk7sCe4JwMtT47cOvq6PhEIXep1kMzdEUZoxILgTylu8vhxD6ZUbSaeXjYP94OZ8q1/gsVw4SPJiB7xMO3Iw4DGD4Btph4lSKFzf2Zbf+khMR6I5XGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PxszTGn+ayGJwVpBYxTK34sEvqohJFthvg0sL1ZQAeE=;
 b=FeWzLVzDRA/0mW1sWDdKqVQeNnpUA0l8xvY1t9qClXQtq/zYg0mcAC4herqqowDlP7s6dlzTwWkQPIdTDVOYtmDLueC8TLbCzaY7K0v+Xwos7Ul+2ETRmz0Pqa6KicigDt+SMfLFbQNtcIHCdx+adKxAVJwfOf8jBcVCzQm5zDuGx2uYzAbPm4U2Fxr8+SXYS4YcHIb8+l3oaTLq+TfGlHcyNdPzDfUp/haRU2DPp73hj/aSyg2v0lc2rj+DLuK6rp7eK94LiWCm9813TbWu/szWH+qKh5/0ZtNFmi/ZJ/nE6l3t5QWuk1mrqJ1UkYFkYc9dK2PzBx+bFfKleY+U1w==
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
Subject: Re: [PATCH v6 09/13] vpci/header: emulate PCI_COMMAND register for
 guests
Thread-Topic: [PATCH v6 09/13] vpci/header: emulate PCI_COMMAND register for
 guests
Thread-Index: AQHYGZFfEau2yoVfs02TXHZP7JM5E6yDcw0AgAXhW4CAABY4AIAAAW6A
Date: Tue, 8 Feb 2022 09:38:15 +0000
Message-ID: <08d02313-349d-9ad4-926d-0d1419866363@epam.com>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-10-andr2000@gmail.com>
 <7df2379e-1c30-c362-3106-c7ef23af5c73@suse.com>
 <0ff2a524-9a65-861a-df87-cf3f682862d7@epam.com>
 <140e163c-87d0-2ae8-d57b-7ebc6757de9e@suse.com>
In-Reply-To: <140e163c-87d0-2ae8-d57b-7ebc6757de9e@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d9fdc83d-19d4-4fb2-b7bc-08d9eae6bba7
x-ms-traffictypediagnostic: AM6PR0302MB3287:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM6PR0302MB328766AF89B183833BC1E12BE72D9@AM6PR0302MB3287.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 MVYBzcMRmEiaHnS8nl9Uj6+AbUkVsqPLLpzGp5b+9fG0xSOulWapYQv9cB8ME+DZNf/H0eAi/StGC37YfmzbdiEgGMw95OVvf/Wig6/rsPZ+W4yfPePqJBrO1EfteotnV4Wj85IigeaI6uSFoG0ZzlIVZLrzm9NP1f9ALS+F9SO2Z6qzEB0XG+0kx5D83FBvS2k8Oe9qTdO+sh0f1duIVzgU6UU6c0SRZyTw1y6UqL6TVXDA4zjRpIpeJBjbi1uBbwSknASr/RAkpDdLY3+oZqF/5ixV8Lp/UgbvsrcecE7SxBQ8tgRqe4/FirOp6cWmQhDPCLLWDwHacsD0UQ5QNVxP65RqV7GpCV1McRtnw6AEhkbpW+Ii7CX/O1WyP0HDGHRzYc6NZ/73AGUpXxlD0Tkj8gxIfXIVb5ayehYSyNz7XJWAJcqOXfYLN2oJgn+9SPGPzgfQqIYMUZNXsaT19Jx5mtQPU4Gltu8m17KhQoAk3eqFC8AlkdVCn00ImC+RJaJTcTAdTr+bmFInmkIrQ1zd4LIIW7ECLbjOi/IFzBWzKJ+D0RIjVtHBVwV1mm5hNZOoJ9T7GbUXw2/z3WMqFqiV6NlvRTzXA98otcvx78VxqWRdUX3UVgMeKmc4zntiB8qo5uJkZBoMSAlp7aPG/ucNA8GdyQayWrpDRYTLa1IH7hxWh2/eDWet0/f1eFUIku/CIy1GOfgQatieNO3z9vJSoT0kP3GPITOW1lsz9n+G/qLmRksJLumUdrJlocd6
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(107886003)(71200400001)(2616005)(31686004)(36756003)(55236004)(53546011)(66946007)(6512007)(316002)(66556008)(508600001)(6506007)(2906002)(186003)(26005)(38070700005)(5660300002)(66476007)(6486002)(7416002)(64756008)(66446008)(8676002)(86362001)(91956017)(76116006)(4326008)(110136005)(54906003)(31696002)(83380400001)(8936002)(38100700002)(122000001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?T3paMkxSNk1EVWROZ01ocWlEZ2M5elA4TlIybjdLTXNoQlkwR2luVEc4eHA0?=
 =?utf-8?B?dGRtREJMck11L2x4UlBXek5MVzM3UlJ6cEZ1NE1LQnAzUmtoaVFBRTJ2YnJu?=
 =?utf-8?B?YzZSVVhRL0puQUUwVjBzaTBteWw0ZVY0MDJVWGJzNno5aXVabnBHZ0xWUnBO?=
 =?utf-8?B?cHh5a1ZMMklhYnJrdTVuSHlDSHI4c0psQVpsdUZWbzU2UEYvMHZQYUEreWlG?=
 =?utf-8?B?MktvVTRhaVp6RG9EbGRHNkpXSTVrcis4R1pzQW5hREdIQlUrSVZnbDdEVUcv?=
 =?utf-8?B?MWtIYjhWa0ZLZExnZnA4RXpmNTZ4VmgySkRObHhxcnBkdldJNzl2dlc4cEJY?=
 =?utf-8?B?N3F3cEFKSHpmcnlKRmNYVE4yZHpQRUt6VTZodFpnMlBGS0JoSFVNN2RoYzFZ?=
 =?utf-8?B?V3poaW5weUkveG5STytVbWt3aGs3VWlzZlhSMGRNMEVoWlNZT1NrUmVicWZY?=
 =?utf-8?B?T0JiM3NiQy9MSjVWUlZETmlPUk4ySTNxSVQ5SFpDSkZCNnI4TXZvdXhiaVQ0?=
 =?utf-8?B?c1hJSjNsVkg1ejBueFV1U3doKzVEblAxYlZBM3FNVHlnSHFWS3J2eUJadmx4?=
 =?utf-8?B?MUMzazFuUmRFeWZRclhRVVRHZFFKT0JXd1JQZGhzaW83MXduNS9FeHFiOCtM?=
 =?utf-8?B?R3BTanhyYktGWFVXTEFmMVk5OU94Ty9kWWh3SnlnbTRxanFjNkVlZEptbENs?=
 =?utf-8?B?Q1Z0S3VMeUhpVGFzdjZFYkppSW1PTElLOEhMY1l2L3l5TEdPd1B0WkxlK2xN?=
 =?utf-8?B?MjRpd0VzRG83dmY0NDFuTTdpd1NrT2ZBbXNVREZTUHpIU0tabFQ0MVJQbnkw?=
 =?utf-8?B?NDZySjBiMDBCdXMyVjlOUmdIYlhTZEl1ZTNlekcvd1JzTWxjd29rSm9qcXg4?=
 =?utf-8?B?Y2lLYndqOGlQTnFiRVZnaXJJVzNFN3cwcXRFaVF0SDZJUjVsZ05VQzV5NlJH?=
 =?utf-8?B?akN3eE14UkQwbVdOZ0drY3ZaMjgvaXVKdkhJVXNUTU5ndXhDWGNIc2RwOWxZ?=
 =?utf-8?B?MTZHQ0QyTVFWb0tOSmhlbUtFYmVZQ0tWSDBCajgvQ1JMUHJocjlieDV2cU9H?=
 =?utf-8?B?djFjdmJNZjcydXVJekppU3JiQkd4U1VTSkk4dUFrMnp4YldUWVVWZ0txSisx?=
 =?utf-8?B?TXA0dVFENUo3T0hlb1IzNEd2dmsvMlJHOUdGWWwzTDlmRVRGSkRMOEpmRGZZ?=
 =?utf-8?B?ZmE0OHAzWWFVQWZsS1JBdWVWU2h4ek5xeGpHVFNKRUYreUNSZ1NpNzNtd1Nh?=
 =?utf-8?B?OHpCM3RoQ2ZCOHRaWmxEeEVCRUgzblk5QlVJNmNkcjRERWErTHdHWWJ0MVlL?=
 =?utf-8?B?ZDBWbDJzZjdGMUFqT2VyZ2RUWlp0UjgvTUVhYjhjRmUwRmRrajJjYStyMm9L?=
 =?utf-8?B?c05BdFd6T3BiVWxneUdvUUdzWGZvdVB4TWNjdzNlWURNcW9tZStMVHQwazlM?=
 =?utf-8?B?UCt1QVZkekpuK2JEc1Q5ZnB2Smw3K2xLcXFlTlNGajhiS1ZHa2I4QXVHSDIy?=
 =?utf-8?B?NG9yZGk0NnZPd1UrZnJkN3JYU1NHVkFYWmgydUl6T0xteGxYWU1rUk1OME5j?=
 =?utf-8?B?cE00R0FRS25FZDJoRDJ1VlZYNVFEendGclB5djgwRkFyQ2M4ajdTTEh2d2Ni?=
 =?utf-8?B?OWxxRS9rVTBKaEgxa2tyaXBRaHRKUzdtSVVzZW95bitKYzVYNWlCMGp5QUhC?=
 =?utf-8?B?WlJGUHFxR3NzUWhCdXN4TkR1ZjdtZmpqT0ZCaHpOczBwaCtsZXJuVVJKWkhm?=
 =?utf-8?B?L0JUYjE2VnRvdEwrdkx0NjQvdXBxWHBSYmdqSVJTZE5KSHdtVmdKZ0c1WnA5?=
 =?utf-8?B?RzNxMTJQdU16cVUzY280SHlyRGlTZjdyYUNoRlZhL0R1cVhneFV3VTFLODdl?=
 =?utf-8?B?UzhDVm5DN1RTaG5tZ3dhMlR2UUxXbEpLYk8xWm1oZjJXZ1NFVGFMK3lzUzkr?=
 =?utf-8?B?R284aWJxbUFwdTdTSzIvcHFWd1NmVXI0UmtpV2s2ek45T1duOVhhSjVHcy9N?=
 =?utf-8?B?UlJQdkNQRkp2dGJ5SUZ5dHFXS2VSWkNGclg3VHh4M1oxUHVidWxzbWRFUGhs?=
 =?utf-8?B?bG1wQ29Wbzg2UHFJdXgyaW9SdXprM1k4THBoek1nZWNBaG01bkpFTmhOclBX?=
 =?utf-8?B?YTZScG1KQjU1ZCt4SjhQRmxST25jUnFGQ3dZQWZSTDNtbFYrRGlWU3pteFJp?=
 =?utf-8?B?MjFjYlN2NGEwUFVoellMQXhTejN1TEo3VURCWXlsWGhCeW5LcjRVcWFtTFIz?=
 =?utf-8?B?RFBoQ0RCaXQ3ZlFzREdMRlNlbXpsM3ZVTHFsTng5d3AvWlFDM0dTMGk3UDJo?=
 =?utf-8?B?djB0cko4SVFPa3IzVFJQcUU0d2MxZXNIRXpPMVh0WG9RNlJ2ZDZDVG45YlZN?=
 =?utf-8?Q?5Y/YHkRmbSOOC9Z8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B0FAFBBF9BC09540A7282693D4C1F309@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9fdc83d-19d4-4fb2-b7bc-08d9eae6bba7
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 09:38:15.9938
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z4w74zsFT7KSv5tPY1rYGAD/Emq92+XGSQdno4zVnwiG7aX67Oxjb51+MkLCK+xbC/PA345wnkL4vqCtlYxFrf8emxpldwWmlR6p9QzJPuziff8+87fH5eoQXqRVSSyC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0302MB3287
X-Proofpoint-ORIG-GUID: 81y-KQQ3YUtcT_Yd4aMLJsO5EhC5bDCh
X-Proofpoint-GUID: 81y-KQQ3YUtcT_Yd4aMLJsO5EhC5bDCh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-08_02,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0 mlxlogscore=862
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202080054

DQoNCk9uIDA4LjAyLjIyIDExOjMzLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDguMDIuMjAy
MiAwOToxMywgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBPbiAwNC4wMi4yMiAx
NjoyNSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMDQuMDIuMjAyMiAwNzozNCwgT2xla3Nh
bmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+IC0tLSBhL3hlbi9kcml2ZXJzL3ZwY2kvaGVh
ZGVyLmMNCj4+Pj4gKysrIGIveGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYw0KPj4+PiBAQCAtNDU0
LDYgKzQ1NCwyMiBAQCBzdGF0aWMgdm9pZCBjbWRfd3JpdGUoY29uc3Qgc3RydWN0IHBjaV9kZXYg
KnBkZXYsIHVuc2lnbmVkIGludCByZWcsDQo+Pj4+ICAgICAgICAgICAgcGNpX2NvbmZfd3JpdGUx
NihwZGV2LT5zYmRmLCByZWcsIGNtZCk7DQo+Pj4+ICAgIH0NCj4+Pj4gICAgDQo+Pj4+ICtzdGF0
aWMgdm9pZCBndWVzdF9jbWRfd3JpdGUoY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYsIHVuc2ln
bmVkIGludCByZWcsDQo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDMyX3Qg
Y21kLCB2b2lkICpkYXRhKQ0KPj4+PiArew0KPj4+PiArICAgIC8qIFRPRE86IEFkZCBwcm9wZXIg
ZW11bGF0aW9uIGZvciBhbGwgYml0cyBvZiB0aGUgY29tbWFuZCByZWdpc3Rlci4gKi8NCj4+Pj4g
Kw0KPj4+PiArI2lmZGVmIENPTkZJR19IQVNfUENJX01TSQ0KPj4+PiArICAgIGlmICggcGRldi0+
dnBjaS0+bXNpLT5lbmFibGVkIHx8IHBkZXYtPnZwY2ktPm1zaXgtPmVuYWJsZWQgKQ0KPj4+PiAr
ICAgIHsNCj4+Pj4gKyAgICAgICAgLyogR3Vlc3Qgd2FudHMgdG8gZW5hYmxlIElOVHguIEl0IGNh
bid0IGJlIGVuYWJsZWQgaWYgTVNJL01TSS1YIGVuYWJsZWQuICovDQo+Pj4+ICsgICAgICAgIGNt
ZCB8PSBQQ0lfQ09NTUFORF9JTlRYX0RJU0FCTEU7DQo+Pj4+ICsgICAgfQ0KPj4+PiArI2VuZGlm
DQo+Pj4+ICsNCj4+Pj4gKyAgICBjbWRfd3JpdGUocGRldiwgcmVnLCBjbWQsIGRhdGEpOw0KPj4+
PiArfQ0KPj4+IEl0J3Mgbm90IHJlYWxseSBjbGVhciB0byBtZSB3aGV0aGVyIHRoZSBUT0RPIHdh
cnJhbnRzIHRoaXMgYmVpbmcgYQ0KPj4+IHNlcGFyYXRlIGZ1bmN0aW9uLiBQZXJzb25hbGx5IEkn
ZCBmaW5kIGl0IHByZWZlcmFibGUgaWYgdGhlIGxvZ2ljDQo+Pj4gd2FzIGZvbGRlZCBpbnRvIGNt
ZF93cml0ZSgpLg0KPj4gTm90IHN1cmUgY21kX3dyaXRlIG5lZWRzIHRvIGhhdmUgZ3Vlc3QncyBs
b2dpYy4gQW5kIHdoYXQncyB0aGUNCj4+IHByb2ZpdD8gTGF0ZXIgb24sIHdoZW4gd2UgZGVjaWRl
IGhvdyBQQ0lfQ09NTUFORCBjYW4gYmUgZW11bGF0ZWQNCj4+IHRoaXMgY29kZSB3aWxsIGxpdmUg
aW4gZ3Vlc3RfY21kX3dyaXRlIGFueXdheXMNCj4gV2h5ICJ3aWxsIj8gVGhlcmUncyBub3RoaW5n
IGNvbmNlcHR1YWxseSB3cm9uZyB3aXRoIHB1dHRpbmcgYWxsIHRoZQ0KPiBlbXVsYXRpb24gbG9n
aWMgaW50byBjbWRfd3JpdGUoKSwgaW5zaWRlIGFuIGlmKCFod2RvbSkgY29uZGl0aW9uYWwuDQo+
IElmIGFuZCB3aGVuIHdlIGdhaW4gQ0VULUlCVCBzdXBwb3J0IG9uIHRoZSB4ODYgc2lkZSAoYW5k
IEknbSB0b2xkDQo+IHRoZXJlJ3MgYW4gQXJtIGVxdWl2YWxlbnQgb2YgdGhpcyksIHRoZW4gdG8g
bWFrZSB0aGlzIGFzIHVzZWZ1bCBhcw0KPiBwb3NzaWJsZSBpdCBpcyBnb2luZyB0byBiZSBkZXNp
cmFibGUgdG8gbGltaXQgdGhlIG51bWJlciBvZiBmdW5jdGlvbnMNCj4gY2FsbGVkIHRocm91Z2gg
ZnVuY3Rpb24gcG9pbnRlcnMuIFlvdSBtYXkgaGF2ZSBzZWVuIEFuZHJldydzIGh1Z2UNCj4gIng4
NjogU3VwcG9ydCBmb3IgQ0VUIEluZGlyZWN0IEJyYW5jaCBUcmFja2luZyIgc2VyaWVzLiBXZSB3
YW50IHRvDQo+IGtlZXAgZG93biB0aGUgbnVtYmVyIG9mIHN1Y2ggYW5ub3RhdGlvbnM7IHRoZSB2
YXN0IHBhcnQgb2YgdGhlIHNlcmllcw0KPiBpcyBhYm91dCBhZGRpbmcgb2Ygc3VjaC4NCldlbGws
IHdoaWxlIEkgc2VlIG5vdGhpbmcgYmFkIHdpdGggdGhhdCwgZnJvbSB0aGUgY29kZSBvcmdhbml6
YXRpb24NCml0IHdvdWxkIGxvb2sgYSBiaXQgc3RyYW5nZTogd2UgZG9uJ3QgZGlmZmVyZW50aWF0
ZSBod2RvbSBpbiB2cGNpDQpoYW5kbGVycywgYnV0IGluc3RlYWQgcHJvdmlkZSBvbmUgZm9yIGh3
ZG9tIGFuZCBvbmUgZm9yIGd1ZXN0cy4NCldoaWxlIEkgdW5kZXJzdGFuZCB5b3VyIGNvbmNlcm4g
SSBzdGlsbCB0aGluayB0aGF0IGF0IHRoZSBtb21lbnQNCml0IHdpbGwgYmUgbW9yZSBpbiBsaW5l
IHdpdGggdGhlIGV4aXN0aW5nIGNvZGUgaWYgd2UgcHJvdmlkZSBhIGRlZGljYXRlZA0KaGFuZGxl
ci4NCg0KT25jZSB3ZSBhcmUgYWxsIHNldCB3aXRoIHRoZSBoYW5kbGVycyB3ZSBtYXkgd2FudCBw
ZXJmb3JtaW5nIGEgcmVmYWN0b3JpbmcNCndpdGggbGltaXRpbmcgdGhlIG51bWJlciBvZiByZWdp
c3RlciBoYW5kbGVycy4NCg0KQFJvZ2VyLCB3aGF0J3MgeW91ciB2aWV3IG9uIHRoaXM/DQo+IEph
bg0KPg0KPg0KVGhhbmsgeW91LA0KT2xla3NhbmRy

