Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03EA7366DC6
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 16:11:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114531.218291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZDZ9-0007Uh-SB; Wed, 21 Apr 2021 14:10:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114531.218291; Wed, 21 Apr 2021 14:10:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZDZ9-0007UI-OY; Wed, 21 Apr 2021 14:10:55 +0000
Received: by outflank-mailman (input) for mailman id 114531;
 Wed, 21 Apr 2021 14:10:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G3XE=JS=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lZDZ8-0007UB-BQ
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 14:10:54 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.55]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6e45dc42-7386-4863-9d5f-bb42eb46298e;
 Wed, 21 Apr 2021 14:10:52 +0000 (UTC)
Received: from DB6P195CA0009.EURP195.PROD.OUTLOOK.COM (2603:10a6:4:cb::19) by
 VI1PR0801MB1886.eurprd08.prod.outlook.com (2603:10a6:800:8b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Wed, 21 Apr
 2021 14:10:50 +0000
Received: from DB5EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:cb:cafe::ac) by DB6P195CA0009.outlook.office365.com
 (2603:10a6:4:cb::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20 via Frontend
 Transport; Wed, 21 Apr 2021 14:10:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT010.mail.protection.outlook.com (10.152.20.96) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.21 via Frontend Transport; Wed, 21 Apr 2021 14:10:50 +0000
Received: ("Tessian outbound 4ee49f77c636:v90");
 Wed, 21 Apr 2021 14:10:50 +0000
Received: from e8548465caed.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 81AD5988-1E4F-4EC8-A72C-DA1B61439984.1; 
 Wed, 21 Apr 2021 14:10:43 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e8548465caed.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 21 Apr 2021 14:10:43 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com (2603:10a6:803:7f::25)
 by VI1PR08MB3198.eurprd08.prod.outlook.com (2603:10a6:803:49::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Wed, 21 Apr
 2021 14:10:41 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::4502:9762:8b3b:63d9]) by VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::4502:9762:8b3b:63d9%4]) with mapi id 15.20.4042.024; Wed, 21 Apr 2021
 14:10:41 +0000
Received: from a75445.arm.com (82.8.129.65) by
 LO4P123CA0015.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:150::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.21 via Frontend Transport; Wed, 21 Apr 2021 14:10:40 +0000
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
X-Inumbo-ID: 6e45dc42-7386-4863-9d5f-bb42eb46298e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B1bNpradCH3xPuDnthBmcOncFykB4SfgAlQ2JkiSna4=;
 b=J0mDj+1Vs3u7QAqH7fbTbLbPivlv8CUl3C4/F6z6orOs4eB+8ROBCrT+7DmzNt6ylzjT8qYaWL8jDgLyQ3wDLtGISVWLykzpNW5thhXmElPnvwy7RhCJAYxTSICYCsX6REcabtnBawBRb6WsyD4LJjDoKv8SLirtmvUKlyPaavs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: c83ef6bd0d5ef676
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yg1bo/T9oY7WpoaPMuiTsi94BuL+ZWY79jIDDnFW9x3z9yIsCj0oPL41Jtp1MJxUUjOGYqt7Z2rXHabogVa4WwHpLZfhkpnSTbQMyPshba7IWTLSogMht5kq4jFcEsuIhnOjWXiPpEawmkz8qZLLds+OqQTKeVGEhSop0Jyjhpioij5m8Y7rfZHXIYMkubn3n9qzizi/UONDQpzPZZX6LNHnaHJMzfu5FZZGi5SlbCRQ456Z+I8BZerUQcTOQM+wr9V/Gu/SxtZz7ORL94Qy1t65aDNEUSpzZ/+ABOLwtq5Ho4VqbIetU4W/VKlC+GzI1M6AqiPwW5vaujBbVSeF3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B1bNpradCH3xPuDnthBmcOncFykB4SfgAlQ2JkiSna4=;
 b=YcSlc13fNbp4NzO8FePlVTRXOVWJxSLLOC/9z9StyGifckEIAZ9n8IrLbPmDSOH1dg6sG/sHBvm0XxI4nwxRusNOaHWEkE9DGftRlm9wXRZ/m8+3nQ+iGSIHHdWwY8XAnp7idHhtro3uo4WclAh9G7Iy9IH5MmHFuxl5R08MWWWq5sXntsz+SX5yFyfLlAdRnhRmy8nzxW+OyfqB9D+e81W/+0FJdS/F0A4yqvrlsFmajQ9TFm/KBUbANuyNW7lkXv6pVkhfFBc90Iowi90kd8B2C08mMMHy63D1d8ZDfOUzinpNphgbFxuZHtcCI11gA9wGGv6u8TI+JZlwMwA7qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B1bNpradCH3xPuDnthBmcOncFykB4SfgAlQ2JkiSna4=;
 b=J0mDj+1Vs3u7QAqH7fbTbLbPivlv8CUl3C4/F6z6orOs4eB+8ROBCrT+7DmzNt6ylzjT8qYaWL8jDgLyQ3wDLtGISVWLykzpNW5thhXmElPnvwy7RhCJAYxTSICYCsX6REcabtnBawBRb6WsyD4LJjDoKv8SLirtmvUKlyPaavs=
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH] tools/xenstored: Wire properly the command line option
 -M/--path-max
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <20210421140255.23437-1-julien@xen.org>
Date: Wed, 21 Apr 2021 15:10:34 +0100
Cc: xen-devel@lists.xenproject.org,
 Julien Grall <jgrall@amazon.com>,
 Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <2609B712-3780-49B4-80E8-E769C8981184@arm.com>
References: <20210421140255.23437-1-julien@xen.org>
To: Julien Grall <julien@xen.org>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LO4P123CA0015.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::20) To VI1PR08MB3629.eurprd08.prod.outlook.com
 (2603:10a6:803:7f::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d55a90a-4461-4764-8231-08d904cf448d
X-MS-TrafficTypeDiagnostic: VI1PR08MB3198:|VI1PR0801MB1886:
X-Microsoft-Antispam-PRVS:
	<VI1PR0801MB1886FFAA0847645ECFE0FCAAE4479@VI1PR0801MB1886.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:350;OLM:350;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 6Deg9egZmvM7ktc9UTYYqsf9wgbt/4K8Ew1XkE5gD7ln9D1TKDwsbSXyRIZmV43sDezQEcsqkMnGdZucnYijM/Bb+K6fftU2SlDwB6h2QYznXu47hdbGnFuLwX2LlDOOLPtK1SP3UrOQn+hjPBCQg2PS3hEmgSHO2IJlC/zqoUav3/6SoKpxb07c0W5M3aLV+3o1EhXSG7iKzsXV9s4Fo/RejJ/zgbKXrdnbAowrGU8CxcAkb9JVJ69tJLQny+p0yYpDCI2nKRod1K81iTsZXCZHffWmgtFWqEuH/5eQczoZHa0FzmACJvAbj7PeFzKRMDlQU1Vo0dZc8gb/44hqH2qOoSlQF0lAPyVy3Ij02/MeFSpFpeTkCXyGxo+Fvyl8FmFlmwXZPf0ynC8/hSOMmbQruh89HFbnTHsitjq3ZMo11+rta+TTpC1uV5A9oUNU7n73gt9cPkXYyAAetSeF1TeJGXdb+ySiRT9mM004lJqggQWqccOOs3pnAKBJ0u9aakQpbh4Rc9yvaPr1DBDf2jU9KcVx3OPvrl/wD0DcrWKEOIAKzchjCIoEZQInr6sM0b/nElfk/hOjaOkK3HaqwI51aU57j85KogmKz3bfc46Zim29yU4/eiiXlVfjj2LDBFhZHxX421/0PQZm2nFufD8f7Gq/tHShZKYNv38Ng5WqZMX2wsygxihzXe+oYTJ5
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3629.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(39860400002)(346002)(366004)(186003)(6916009)(86362001)(2906002)(16526019)(478600001)(83380400001)(38350700002)(54906003)(4326008)(33656002)(53546011)(36756003)(52116002)(26005)(6666004)(38100700002)(2616005)(7696005)(66946007)(5660300002)(956004)(66476007)(8936002)(8676002)(44832011)(316002)(66556008)(6486002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
 =?utf-8?B?ZHJwdkh6RXRrZ3Juc0grT1lsdCtBb1RFblhGMGNmblRwRWZQWjE3ZGRNSWFC?=
 =?utf-8?B?K3R5dU1leDhIekVGNVp0UXdiTnozSHU5cFR2WmJON3RmNVBKSW4vc3dhWlJN?=
 =?utf-8?B?WDZpc3ZaSmE2SFBxK3lycVg5eENTQ01ZRlBtS3IzT1gwMGdGSGxYSDdiWmxj?=
 =?utf-8?B?c3k4bE5rNUFleFR1V0dPRnl3aDhvOEZxT1lRSFNwcThNbjlVWXFIQncrSlJn?=
 =?utf-8?B?ajdlYWlNQ29lTzVLRllianlKbXRRRUlLMGp2ZGZsbHZjNmxmVGE5RnpnTTNB?=
 =?utf-8?B?Zzk4VXZhZFMzaTdzbmFRVEwzVGMwc3Y0cWR1Z05jQmEyTWdSNDFpUmlscGhG?=
 =?utf-8?B?UDZvMnI1UEN1dTRZVUlYZFU3NzBQajdmZ1RtTUJxMytvT1ZzVE1vV01Rd20x?=
 =?utf-8?B?VlhtZ1RQUFR2S3MxSUJ1NDVwWTFDUG9BWWpsd3lTV2F4MUNOUHdUZEs2Y251?=
 =?utf-8?B?ek1vMFVOSjJSZXk4cWxNQXdpOVdSWmZ5Rk1ZemJoeDhOZU03ZW1aN1J4QnFT?=
 =?utf-8?B?NFo4RHdmSUdDRFNIWUlkUzZVTmpDUEFyR0IxVkoxdnRhdThCdG5nd2p4SnBG?=
 =?utf-8?B?NFdZa1VzQzV1UkE2UE0zUTEvQ0xFNVZ2S2FYcERNUi9oSXhtam1yUXYreEFT?=
 =?utf-8?B?ZXlXdmUrYVJpY1lNLzRPM3dlclpBZ3FidTY3ZjcrYzU5dXlLNnBIRFNLUW9W?=
 =?utf-8?B?b1l5M05lVVZlRm44U0VjSkl6MDFKK2MvRUhTYmVQK3R1Z3ZGWUd3SmlmZjZJ?=
 =?utf-8?B?a2dhSmoyYjJia3RmWHo0L2R3ZERydFBiN2ZsK2g4RHVHRlpUVi8rcm16RG1N?=
 =?utf-8?B?TDhwZC9mNkhCbUQxbGxnTjlzNWVFUitRZHljelRMYzl0aFYrZldXRllZMEhK?=
 =?utf-8?B?aTlJTTU3QVlMRmdMeHhHcTNSbGVGeUEySERmN0VLV3AwN0Rqb0R6dWc0NENM?=
 =?utf-8?B?SDdOSmhyQ2V6Snc5aENlZXpHemJDUHFKVjhTU3plU2toT0NYU2RZZU44emxj?=
 =?utf-8?B?MWJnc1h4VUpVS1E0NzdVdzFoTm0vQ2dFT1FtNzlrcUxvSW8wMkhUZlZzTUFj?=
 =?utf-8?B?NFBZaytvZkhuNW50U1RtWGlDZlZLSXdhSElpbXJhci96aWkzTHpBL21CekJF?=
 =?utf-8?B?QVdsQmVlVFNTVFNHeWp6NERwWXBZT2hjOXJ1WEY4ZlJJQyszK010S0JObFFL?=
 =?utf-8?B?Y1NrT3NqSTNZSUFIeG5zN2VBU29zZ0c1ZmZuM2dYQzV2VFRyQ2JIYnlvQXpI?=
 =?utf-8?B?Vy80R0RJbU1XbzA2Z3pMTHBzL0M4dUdnZFg4ZVh5NlVRUS8rbTlLaWwzNWtT?=
 =?utf-8?B?WjVFZE1PbFZSNDI0aDI2b3JzaTkzZm4vN1dHaUVhMGtNNjFUK2hEajhDWXQ5?=
 =?utf-8?B?RHdiNzBPeGdDUlo5UnJHbVQvQ0t2SVFUdTZlMGhKMS9ZK1RIM1hMdWIvZDND?=
 =?utf-8?B?b095THMxK0RvTm51aHdlOUw5bjlVV2Q1ditSWGk0WFJaVG51R1M3YWxzUW90?=
 =?utf-8?B?cVRYMXhWVWdQdm9Td2VVbmg4MHkzM3Z6QmtIZllwWWxscTR2eUZMTnFnbE53?=
 =?utf-8?B?V2E5OHdWb3BKZ0FSeWlEK00xdTdaOC9uWlY2THZGRnQxNVhxNXRkUHE4QUxJ?=
 =?utf-8?B?YkVDOWI5aGtsTGJ3RFI3ZHZ6VERPa1kyd1BhVWtLZktrdTE5SmV5RTF0VmtH?=
 =?utf-8?B?UEw2MG92V2U5eFFtYjRRaERRVVJUNHRtRVRCa3VkMThrVXl4ZHUvTExUYW4x?=
 =?utf-8?Q?7o2/+SvmdihiRs5A4dXAXhBlinWlxyawJU6xPDj?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3198
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	08d831da-989b-4e73-57e7-08d904cf3ef6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1UwU3nT7fCnEwfiJ4K+2f47EbTsoRRP6lqDWqXDt1iNcoc9oRn0cHFVMC1vjACMoN1L8obwidneiWklCJscp+n/RkchODdVqUI/g80ZWs0PojqPq58dT0+iSOzMtjSLL3o5cXNpEPZ8g9IWDmWfFZ7lfYHiNQ/eID2B2lhArEweRgOrFDiY9ihnNsm8EibteaVklgCggv8Brk7Lguhxrh8FtrmT5EjauwqgQpqMkoX0ILJg28STGhOwblVMgPmB1qncQaPluvZBJ1lBC2b4HlkDAOCvsVrI/G581q7OnSB7hHYrfi9lrhGFpBE6erfHb6kOE4+XQz16lKwwMBqESfApY8LR264WUDaXC3Zo+t5HvMeUhWvCtOYIu6gGYeqvsBbb/8BzAP3F0uvswbr6FzzjS+BiNnbHYYsGZaf1T2OwBT1TTgZQaJ2Cj3WVWmYqewl/U2EufuHAVC2rzg8wTm4NAem0dT8XjR9w9+4KZJcv7lkTHAWBdC1O202GAwbhlD27vWlfiS3geC61CNyU+6pYMPlTT48I1UNx18HWs8Zz5MPvn+uqbpMxy8p7GwCN8IBy4cbRdkwlL70roACovNHxri/5EsfCJtWewfaEQDJeKTjNWHrogzofGZOSYriQyYAqjAk8v5o0hUuwfnQBYS6jbRHhqgwVIMFVjDHl8vrw=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(39860400002)(376002)(396003)(346002)(46966006)(36840700001)(186003)(36860700001)(70206006)(33656002)(26005)(16526019)(81166007)(478600001)(86362001)(6666004)(82740400003)(336012)(47076005)(356005)(6862004)(8676002)(7696005)(107886003)(83380400001)(70586007)(316002)(6486002)(2906002)(5660300002)(53546011)(956004)(36756003)(54906003)(82310400003)(4326008)(8936002)(2616005)(44832011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2021 14:10:50.4411
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d55a90a-4461-4764-8231-08d904cf448d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1886



> On 21 Apr 2021, at 15:02, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> The command line option -M/--path-max was meant to be added by
> commit 924bf8c793cb "tools/xenstore: rework path length check" but this
> wasn't wired through properly.
>=20
> Fix it by adding the missing "case 'M':".
>=20
> Fixes: 924bf8c793cb ("tools/xenstore: rework path length check")
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> ---
> tools/xenstore/xenstored_core.c | 1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_c=
ore.c
> index 591b28e4552f..c638e46221eb 100644
> --- a/tools/xenstore/xenstored_core.c
> +++ b/tools/xenstore/xenstored_core.c
> @@ -2148,6 +2148,7 @@ int main(int argc, char *argv[])
> 		case 'A':
> 			quota_nb_perms_per_node =3D strtol(optarg, NULL, 10);
> 			break;
> +		case 'M':
> 			quota_max_path_len =3D strtol(optarg, NULL, 10);
> 			quota_max_path_len =3D min(XENSTORE_REL_PATH_MAX,
> 						 quota_max_path_len);
> =E2=80=94=20
> 2.17.1
>=20
>=20

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>=

