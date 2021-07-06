Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F0A3BC810
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 10:45:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150884.278926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0ghu-0004cT-IX; Tue, 06 Jul 2021 08:45:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150884.278926; Tue, 06 Jul 2021 08:45:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0ghu-0004aJ-FW; Tue, 06 Jul 2021 08:45:30 +0000
Received: by outflank-mailman (input) for mailman id 150884;
 Tue, 06 Jul 2021 08:45:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c2YU=L6=arm.com=Luca.Fancellu@srs-us1.protection.inumbo.net>)
 id 1m0ght-0004aD-6V
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 08:45:29 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.56]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 865a0bbb-3155-4511-8ee9-037fa826731d;
 Tue, 06 Jul 2021 08:45:26 +0000 (UTC)
Received: from AM6PR10CA0021.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::34)
 by DB7PR08MB3881.eurprd08.prod.outlook.com (2603:10a6:10:77::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Tue, 6 Jul
 2021 08:45:24 +0000
Received: from AM5EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:89:cafe::f2) by AM6PR10CA0021.outlook.office365.com
 (2603:10a6:209:89::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19 via Frontend
 Transport; Tue, 6 Jul 2021 08:45:24 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT051.mail.protection.outlook.com (10.152.16.246) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Tue, 6 Jul 2021 08:45:23 +0000
Received: ("Tessian outbound c836dc7aad98:v97");
 Tue, 06 Jul 2021 08:45:22 +0000
Received: from f5bee680b688.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A00A61D9-5A17-48EA-983A-5E9203E9A2FA.1; 
 Tue, 06 Jul 2021 08:45:06 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f5bee680b688.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 06 Jul 2021 08:45:06 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PA4PR08MB5967.eurprd08.prod.outlook.com (2603:10a6:102:e7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.33; Tue, 6 Jul
 2021 08:45:05 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::4a9:5afa:372e:97f5]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::4a9:5afa:372e:97f5%3]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 08:45:05 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO2P123CA0028.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Tue, 6 Jul 2021 08:45:04 +0000
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
X-Inumbo-ID: 865a0bbb-3155-4511-8ee9-037fa826731d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EDh2fjLp0LWYXbM/wgaeCM06itXrv0oaj48dFJtbZRY=;
 b=IQA+LVsveUXhtT7kFKJ6fSnikOamrEvHHEu64J6slNsgYBD3FwbTzWVYAHiWUWPi3YAmTbHh3alOIi0x3lM23SEIIGTRL3xYFImNwG8swe0WuL6sDFV+lIKoa0ZNQk1oSooMyQ20rwwdXcjgHHNC7xyOFhOJBTyQiDQ+Y9TVOPQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 290a2ea63c6341b1
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EfNcNTI8JW7cZQPre1N+h/kxOeCK6nzWlK3CJC5T8qQkw1f+qiOT8V/DVCQetuOvK2LINDd621w0/UlTZAFB5jJY/Eg13V87qaXdQYFihjKK61kClSpCRJN+dPpYNHrB6HmyyEVdeKpl6d2srn7nG3caqugxrnMTpH1lmS1ogctEMa1fyLrG+OrRbRq4Y4uzq1wUWXZE52Tj5KzrRhAx8aDvH/vzyHXCmxsD5T8G9W0D/o3hRKYJurALhs6o7S8rjH4JMBW+tXfTilFiRhYjcRVrw7GIqE9KF5lk2a3/jxVavvYp61euRxd5J3Tt9+fXr7InIkgoYrBmL/oEooekgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EDh2fjLp0LWYXbM/wgaeCM06itXrv0oaj48dFJtbZRY=;
 b=czxKLHgVNoLvmlsZzIj8cJv8QYardFVVFImDVAEgBvR2+MzaHZHYsToiDjaKneiLU/WLNzWH9AdoStIWdYPyOUAM5fvP0II6z3+/uqwnhccMa+ZksJ8BbkPHV/+YNiPuIniDjBOcEOXH3ww2TBRwc2bbEoZn0YKNhTzD6BK4OzDEy4f2HVJ8Q/fVUz3TUaZpmSPqA9VA4ufy4mjlbHNG/XBVJ2v1+NU15sdoqdtAHQetBJdiJMPLRjCSR5QOjbR3L5N5Dv8Fqik3saL1AR9u2rJxzDxnhbaOe3qB13tMhvtYKVK1Sq+Up0Ve0aNHFQ/CsVoqjKC2rpqLz4I+ZXnUCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EDh2fjLp0LWYXbM/wgaeCM06itXrv0oaj48dFJtbZRY=;
 b=IQA+LVsveUXhtT7kFKJ6fSnikOamrEvHHEu64J6slNsgYBD3FwbTzWVYAHiWUWPi3YAmTbHh3alOIi0x3lM23SEIIGTRL3xYFImNwG8swe0WuL6sDFV+lIKoa0ZNQk1oSooMyQ20rwwdXcjgHHNC7xyOFhOJBTyQiDQ+Y9TVOPQ=
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH v7 9/9] docs/doxygen: doxygen documentation for
 grant_table.h
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <d1915fbc-83af-e6df-980d-71abf21306fc@xen.org>
Date: Tue, 6 Jul 2021 09:44:56 +0100
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <D5BE99B1-7BDD-4FD3-856A-D4697F899C39@arm.com>
References: <20210705105103.14509-1-luca.fancellu@arm.com>
 <20210705105103.14509-10-luca.fancellu@arm.com>
 <d1915fbc-83af-e6df-980d-71abf21306fc@xen.org>
To: Julien Grall <julien@xen.org>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LO2P123CA0028.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::16)
 To PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e01e037e-70ec-4ffa-fe28-08d9405a64ff
X-MS-TrafficTypeDiagnostic: PA4PR08MB5967:|DB7PR08MB3881:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB3881329325FB5165175521C9E41B9@DB7PR08MB3881.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 WNiZNvDdgel9sUDIq5fyf8kaSdv/7iBAQamFCEvOijwi3pAj+8NURG12ZzEaHWixqb06qnElUSJVLa6ht2TGmIUxfHsgdgI/lmOnfgCqRN8s1nWgqkdLse7czerasLG8a7Hp6yyF+J7d/sRM75mUSSflA5mMuMugkGG3OJQORuNkwK8Z6YjavWhjy98h8AsPzzI1T7dU7u/0xJ818L0zW/9hK1XKoXs8SRS25TDj2MKvdzgyJpSQdAES0u3/bqWt8yALL8gNxwfTgi43xcP2InYyPhvtz+zuRw9tDKMn05dmJoHDJPD9W1C5lmIZAfp63pHuXysYx1Sy3ED6VT4qfzbij8XrSLa0H5RCdXT8GBAc4xIJ+LBB1eLydK9vfl/8Ni7HX8OZJIU5VgJfT+8vbUtBvDMhfKKHJbdCKeoL8k8lCzgxjY3oy+tMEstF3hR88DkfP+1DYI7J1bjzvVkQFFt58eKtv8Pn3rHKbJ30gApkkaYeJ6wMZJvvMhGmTo0bZ+p4oUbhQZqKubOl3VlB4EL5IkIIEbK+LcgbQv6LGXzNleV0ok6QkJI1b+TKfQd80mSw8Hm8aWlKvjqS+FOn1wHxNy3xjmgbM5DzVnUTdM54BDmnf5Axb/pn9eHsmrq4L6VsPNituiussL0Wyd3dd4qvKjYdCbwQmsopzkmJ46inGJ/7ddKFWEDQUeLRafIiDJAGyKLRkgSGg8J8ilz00vI/tpC42erMH3+0ZjxmxeXZZN/1e9c6eUYHoQQ4pbmfgaf5HAaerUhe7dtXOpFLc7ZLcNwf1lRnZv21n5qLDDTabyb6y6FKQ3kVJ6PK8deK
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(396003)(136003)(39840400004)(66946007)(966005)(66476007)(6916009)(6512007)(6506007)(16526019)(5660300002)(54906003)(44832011)(33656002)(316002)(53546011)(6486002)(86362001)(478600001)(186003)(83380400001)(4326008)(26005)(66556008)(8936002)(6666004)(2906002)(38100700002)(8676002)(36756003)(2616005)(38350700002)(956004)(52116002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?Zkd6R21iU3VxeGtDdFNNaGFPZXppbUNiU3piV1FqbXgyWGRJa0srNnNIT25Y?=
 =?utf-8?B?TitNVkYxL1JibXp6NDR2VEhaOHVvRDBFTCtFRk5yTTdDa1BaZW5GekRJTnhG?=
 =?utf-8?B?dTBwY1lUK1FtQUowNGRmWFRtUjBNQ2ZFK2g0Z1VCRGhPcjR0MDg3alhwOTJQ?=
 =?utf-8?B?d2ZueHhlTWZ6b2pHN21DZCtNdVZBWEwyYVBWUFFrSko5SVk3UmkzQk55OTZ4?=
 =?utf-8?B?NWdCTGgxSTNHYlV6b1gvaHpsVWUwbm5sMGZ6REZDNVRUNE8rd2VpdXBxWGdi?=
 =?utf-8?B?MGFpbERoZWlVc2RXQU1GU1ljMjZyU1JOd0txNTFzNFAyZW1BMTlLTzNaczQr?=
 =?utf-8?B?MmpzS0VtbzdaSDAyRHpTbUlJcTZ2eHFoeWkyRU5hSlpUK3ZqS3UyNW9QVnkx?=
 =?utf-8?B?YllGVEJmSG14U2JWV0grR0hYMHQxUElNb2g4K0t1YXFzbTBIdHBYdmJPR2Nh?=
 =?utf-8?B?ek00bVVTa1o4UHNEdm1Ia0crM2lwM1RjSWxTUjMycEYvb2dQeGRId0VEbUEx?=
 =?utf-8?B?bld3STAwYk9kSlJqb2YyMFkxMU9NQ1RSa2NqZG5hM0FrK3IyZ0hzdXZEV3VH?=
 =?utf-8?B?cTRmNzN6c1o4cDZSMTlsVmd3RVZjVENrQWIxanNzU0lYZkV1VWwzeHhtQmpP?=
 =?utf-8?B?OGN3cE9jWjY0NDUxeGdXOHZUSkliTEFVb2ZxS0svOXI3eHZpQlVxcWgzbXBK?=
 =?utf-8?B?SDVNYzc5YmdxWlNrYll6NWJGVWxaSStvalZkUFdDZWp0WEMwNVpSYWRHcUpU?=
 =?utf-8?B?VXlDaVJhZ2dpUzVESkJjbHk0bGFrYWtPOFVtbmVlRGMzclU0YWxhSDBDVXdQ?=
 =?utf-8?B?NkY1MU5iRENldHpYU1ZUbTVCTkc0TVVPRkR5VEdUdWNWWlZqMk8xSS9wQnZo?=
 =?utf-8?B?NG0zOWlwbk45U05xWmpSay9iU2l0c2w3endhRWRiRFU0WWg0Z3Evakl6MFRh?=
 =?utf-8?B?RXhSZ3BmMjd4U3dUTC8wTWFkOVU0WWszUHM3UWZOR0d4VnFOWTQ1U3hjSGlO?=
 =?utf-8?B?ZWdhQ1JIdmpDd1FEMVNSYTlBZCthMkFLRkVCd3o4bUVHZUdDc0tWUjI2K1dn?=
 =?utf-8?B?Nm5Rb2taVEZZVENaaU1xV25MVXlkbWhyOHV3Snh4NXFOZHQ0eDcrVmVHdFp3?=
 =?utf-8?B?SzFVZE5IakxrWVg5cXorRlB5YTFLQzZMZEZxNTZZb2ZEVjlWUzI4eG5QeWds?=
 =?utf-8?B?NC9rOFcxMy90ZHJtTjh3Q2NCbFRzMXZVaHNEamJMeVA2d3gwdVF1Q0krbGRr?=
 =?utf-8?B?bXNnalErdDRSdXROcWpKRDZUZXFKbHIzN29UWDk5SEp3Z1JHeDVrVzJJY1pH?=
 =?utf-8?B?aW9aU0tMZ21nWklRajlQL0hPSEQzUWVLZE5adzNlVkc0SUZtWGZsSWoxUlUr?=
 =?utf-8?B?MDQyRVE5WEZDWW1jR09WMGxzRzNTejE0NXVVMkdyYnEwZEFrS3Q0cm5yaTRX?=
 =?utf-8?B?aDgxTTkwd3I5U2lsNk9NbVV2TWlyMHpmTkFiU1E4N1hYdnZXeFdlZFVhdmxP?=
 =?utf-8?B?YW83NmkxNnBqOEpWMFZ6UW5xK0xLWEV0R2psVjZFMmdxRCtTN0krVzJheHE2?=
 =?utf-8?B?UDhaRmppUXk1bzZQQ2luZWVUUnErUExJaDJmSDNyWW81NDdvRlozbWFzUWt4?=
 =?utf-8?B?czZ5d2NLUE5GSmVHT1N5UkNFbm1wMkJZT2JFbnhNdUtGaVorekJtV3JZeUZj?=
 =?utf-8?B?VUZpMUNBVVBmNVRYUkU0Z25WcXJLTE5RekhPNVNNcW8xT0dpQXk3R3Z5Vmpl?=
 =?utf-8?Q?04flQcimdyV3do9cYX7s9E8BrPLoUmqRwVQHv08?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5967
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5e53801e-626b-4671-2508-08d9405a59e2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+B5rvcO/ZWQr+kA1yQf5QzNrnhnOHgXVym5hQOuGu/WLxRqnEPOdk4imhJ9k6rU9NvaVRG7IXYHo9nSI/xs7JXOv5SRmiz5DYYW1UqI2Ec9RE99N6+d64+VZshDx+rXsJOyW17cd+gyYC2rMQ8ogCPid7JFbZ0pEXnskDveRcMdRQ4OZOsE8MICT/xbupYVl7mJzyxVCh6Z5kIdER5tM1MP8k4Qh05OkYVyDgPhTHTHSWHlGIX6RPskGPjjRBgm7WaiNpAbciLKFJM0u59xETgYpqn9jnFcaGrmouDcftPtZEC+LblwqS8b3QqVTwvYa1oPHnBNdDqjAXdn3DwvCxZVyOr94huX2oik6GNE/efbjc7YuXQMMSHyytQdEPFSFJZEZ1MjAZjkDmtn+/TQbe8jE3Xkkx90l84i7UFKJvgSFXVTeQqSbrQPe1R47jHvI+gfMb98fTwk/iU18sMoP5WsXiii435MdVoOUhxeTg0RzjzVIGzNdpGwipH2+FPnQVOWAn575KBSkPm9OMGUHrTQcOetZf88dc+pxoRWyi50+jZAnOE9L6EP2spR4WRyvDxdnQk7H6zIchQabKOF8hjzrtx0g38xS8G+Y09stVQUh9fh/fodByqLpGSotdizGc9z8uKO2i4vr8NQtJrq4LmhG9/CfJKk2duVTedeZcwZFqHHHMEiZCOAgJrbjafYUh9OuSTBqorb+NoIY5da4fr7YykZX+s/xTLjJjxBJnrurUvu70+SotYyFWYsCbT0BfRn4yhr2zjFqCK+tLgsrjo3A7y8K1D3PshQ4WXUoP6A=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39840400004)(376002)(346002)(136003)(396003)(46966006)(36840700001)(478600001)(70586007)(53546011)(47076005)(16526019)(356005)(2906002)(316002)(83380400001)(36756003)(6506007)(81166007)(86362001)(8676002)(6862004)(6512007)(33656002)(82310400003)(336012)(6486002)(8936002)(54906003)(956004)(6666004)(186003)(70206006)(44832011)(5660300002)(2616005)(4326008)(26005)(966005)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 08:45:23.4798
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e01e037e-70ec-4ffa-fe28-08d9405a64ff
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3881



> On 5 Jul 2021, at 15:20, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Luca,
>=20
> On 05/07/2021 11:51, Luca Fancellu wrote:
>> Modification to include/public/grant_table.h:
>> 1) Add doxygen tags to:
>>  - Create Grant tables section
>>  - include variables in the generated documentation
>>  - Used @keepindent/@endkeepindent to enclose comment
>>    section that are indented using spaces, to keep
>>    the indentation.
>> 2) Add .rst file for grant table
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>> ---
>> v7 changes:
>> - commit message changed
>> - Add comment about grant table queries and uses
>> to the documentation
>> v6 changes:
>> - Fix misaligned comment
>> - Moved comments to make them display in the docs
>> - Included more documentation in the docs
>> v5 changes:
>> - Move GNTCOPY_* define next to the flags field
>> v4 changes:
>> - Used @keepindent/@endkeepindent doxygen commands
>>   to keep text with spaces indentation.
>> - drop changes to grant_entry_v1 comment, it will
>>   be changed and included in the docs in a future patch
>> - Move docs .rst to "common" folder
>> v3 changes:
>> - removed tags to skip anonymous union/struct
>> - moved back comment pointed out by Jan
>> - moved down defines related to struct gnttab_copy
>>   as pointed out by Jan
>> v2 changes:
>> - Revert back to anonymous union/struct
>> - add doxygen tags to skip anonymous union/struct
>> ---
>>  docs/hypercall-interfaces/arm64.rst           |   1 +
>>  .../common/grant_tables.rst                   |   9 +
>>  docs/xen-doxygen/doxy_input.list              |   1 +
>>  xen/include/public/grant_table.h              | 459 +++++++++++-------
>>  4 files changed, 288 insertions(+), 182 deletions(-)
>>  create mode 100644 docs/hypercall-interfaces/common/grant_tables.rst
>> diff --git a/docs/hypercall-interfaces/arm64.rst b/docs/hypercall-interf=
aces/arm64.rst
>> index 5e701a2adc..cb4c0d13de 100644
>> --- a/docs/hypercall-interfaces/arm64.rst
>> +++ b/docs/hypercall-interfaces/arm64.rst
>> @@ -8,6 +8,7 @@ Starting points
>>  .. toctree::
>>     :maxdepth: 2
>>  +   common/grant_tables
>>      Functions
>> diff --git a/docs/hypercall-interfaces/common/grant_tables.rst b/docs/hy=
percall-interfaces/common/grant_tables.rst
>> new file mode 100644
>> index 0000000000..b8a1ef8759
>> --- /dev/null
>> +++ b/docs/hypercall-interfaces/common/grant_tables.rst
>> @@ -0,0 +1,9 @@
>> +.. SPDX-License-Identifier: CC-BY-4.0
>> +
>> +Grant Tables
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +.. doxygengroup:: grant_table
>> +   :project: Xen
>> +   :members:
>> +   :undoc-members:
>> diff --git a/docs/xen-doxygen/doxy_input.list b/docs/xen-doxygen/doxy_in=
put.list
>> index e69de29bb2..233d692fa7 100644
>> --- a/docs/xen-doxygen/doxy_input.list
>> +++ b/docs/xen-doxygen/doxy_input.list
>> @@ -0,0 +1 @@
>> +xen/include/public/grant_table.h
>> diff --git a/xen/include/public/grant_table.h b/xen/include/public/grant=
_table.h
>> index 84b1d26b36..2f826c952d 100644
>> --- a/xen/include/public/grant_table.h
>> +++ b/xen/include/public/grant_table.h
>> @@ -25,15 +25,19 @@
>>   * Copyright (c) 2004, K A Fraser
>>   */
>>  +/**
>> + * @file
>> + * @brief Interface for granting foreign access to page frames, and rec=
eiving
>> + * page-ownership transfers.
>> + */
>> +
>>  #ifndef __XEN_PUBLIC_GRANT_TABLE_H__
>>  #define __XEN_PUBLIC_GRANT_TABLE_H__
>>    #include "xen.h"
>>  -/*
>> - * `incontents 150 gnttab Grant Tables
>=20

Hi Julien,

> `incontents is used by the script xen-headers to generate I believe [1].
>=20
> Looking through the commit messages, I can't find any suggestion that the=
 existing documentation has been retired or else. So can you clarify what's=
 the intention?
>=20
> If the plan to move to doxygen, then I think that
>  1) the commit message or cover letter ought to explain why this is bette=
r than the current documentation
>  2) you should remove xen-headers or outline the plan to do that. Note th=
at after this series, I believe the bits for the grant table would end up t=
o be broken.
>=20

Yes you are right, maybe it=E2=80=99s better to have a future serie that ca=
n reproduce and substitute the actual documentation.

All the patches below this one introduces the sphinx-doxygen system, so we =
are enabled to create the docs,
now we can agree on the structure that we want for the new documentation.

Cheers,

Luca=20


> Cheers,
>=20
> [1] https://xenbits.xen.org/docs/unstable/hypercall/index.html
>=20
> --=20
> Julien Grall


