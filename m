Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 039B135845A
	for <lists+xen-devel@lfdr.de>; Thu,  8 Apr 2021 15:14:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107345.205220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUUUJ-0002gy-Bg; Thu, 08 Apr 2021 13:14:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107345.205220; Thu, 08 Apr 2021 13:14:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUUUJ-0002gc-8W; Thu, 08 Apr 2021 13:14:23 +0000
Received: by outflank-mailman (input) for mailman id 107345;
 Thu, 08 Apr 2021 13:14:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0/ag=JF=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lUUUH-0002gX-Lg
 for xen-devel@lists.xenproject.org; Thu, 08 Apr 2021 13:14:21 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0e::620])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3e289106-0e25-4dae-8616-6ca573243a20;
 Thu, 08 Apr 2021 13:14:20 +0000 (UTC)
Received: from AM0PR06CA0101.eurprd06.prod.outlook.com (2603:10a6:208:fa::42)
 by DB6PR0801MB1879.eurprd08.prod.outlook.com (2603:10a6:4:73::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Thu, 8 Apr
 2021 13:14:17 +0000
Received: from VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:fa:cafe::43) by AM0PR06CA0101.outlook.office365.com
 (2603:10a6:208:fa::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend
 Transport; Thu, 8 Apr 2021 13:14:17 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT007.mail.protection.outlook.com (10.152.18.114) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Thu, 8 Apr 2021 13:14:16 +0000
Received: ("Tessian outbound 34291f7cb530:v90");
 Thu, 08 Apr 2021 13:14:16 +0000
Received: from 978434886303.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E4F751C9-38E7-495D-A0F3-B65E24060023.1; 
 Thu, 08 Apr 2021 13:14:05 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 978434886303.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 08 Apr 2021 13:14:05 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com (2603:10a6:803:7f::25)
 by VI1PR08MB3374.eurprd08.prod.outlook.com (2603:10a6:803:82::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Thu, 8 Apr
 2021 13:14:01 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::9ed:7407:c969:2a7c]) by VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::9ed:7407:c969:2a7c%6]) with mapi id 15.20.3999.034; Thu, 8 Apr 2021
 13:14:01 +0000
Received: from [192.168.0.22] (82.8.129.65) by
 LO2P265CA0169.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.32 via Frontend Transport; Thu, 8 Apr 2021 13:14:01 +0000
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
X-Inumbo-ID: 3e289106-0e25-4dae-8616-6ca573243a20
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MCEtlsV4c+E+xeFipsp26PtPjOMFY6HsCWyCqiZIvZE=;
 b=hXugXrmGNFRlk6D0LcVgZQiJlkugVCkAgl5F3eDEgV+bnj4NPMDIo7S1tChtylDwOczeHUEjlBZbU0Qm4GqIYfrMVl8ljXNbYgduTmZwbwsuK/rqlJe6fv9W/vCGY+h6GuHlhxKdsU3CXMBoRs1ZdAuiTulYOzf3uidWtuiBBic=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: b9e483ce60a55f8e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OcqwhaIlO5VONt/aoTd4Pglo4M53Tqesbuht6TFLncpdqBFdjzu2XmcaHQzmJ4eJg+U7yD/XFxys4t4Ld6CE3u5ghYogYL80AkEb7/g1gvGcwIS9kRa92fmWX812emY/WGisOA2JnrV0wU2s2wgzBU7Y9dkM8yFavnKZtOsMCfjzL7nDCLijL/b5L/hIvg+A+Ciyx2ZyJWKR5rZ6scsCrJMq/dtnB+DUiSGWLeRYqEbwpLZLt3pdNDE6zzVsK8zIpKPc+4PBhchF/JizjjqPLfeVbB6050yOjI1sgETvxm8NNJWKziNgKATpLgpCB+N0+/ambOeY4yuztfTKrUwgyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MCEtlsV4c+E+xeFipsp26PtPjOMFY6HsCWyCqiZIvZE=;
 b=QSxLKBhAgu6XU4LsN4PGqRa7d1VB/YMv/ALBlTfknXcckPGgh3VauEKt3AnXXQ2R3ZUJU2ZySrBrY6A1C7GhI/V2tJWwdn7zcbIs33+KmyR3+Zo9YsesqjzSK4ahpCGQyGV7VRnMbsTxCYN6fIJ+fKmrowW20jvnDqfKPMwrafuVobEwlbheHCU5R72rO9wkSbAooNRfQ30GmZEYUD+zwBLqbVEAe5FZpgplONQJBxk5wfg8MxPGX+K7r9YbCBra9RypweNOrlQkAsrsTbbe5KdctIMwWMZyi8LCsgjUYtoeGJJAKSRh+6gdOqrJeqZCkNMZNqPbZbER+6SyrnfafQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MCEtlsV4c+E+xeFipsp26PtPjOMFY6HsCWyCqiZIvZE=;
 b=hXugXrmGNFRlk6D0LcVgZQiJlkugVCkAgl5F3eDEgV+bnj4NPMDIo7S1tChtylDwOczeHUEjlBZbU0Qm4GqIYfrMVl8ljXNbYgduTmZwbwsuK/rqlJe6fv9W/vCGY+h6GuHlhxKdsU3CXMBoRs1ZdAuiTulYOzf3uidWtuiBBic=
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH 3/3] docs/doxygen: doxygen documentation for grant_table.h
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <2b5b6cd8-7898-46f7-10bb-4a9d95da58ef@xen.org>
Date: Thu, 8 Apr 2021 14:13:57 +0100
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Jan Beulich <jbeulich@suse.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <1767D765-CF7E-4F35-8188-B8F027BDB8D1@arm.com>
References: <20210406103603.8530-1-luca.fancellu@arm.com>
 <20210406103603.8530-4-luca.fancellu@arm.com>
 <073e28bc-ad94-429d-6384-744864d12b57@suse.com>
 <alpine.DEB.2.21.2104061425040.31460@sstabellini-ThinkPad-T480s>
 <e15ed7b9-b153-b767-e625-e7a9d2aa76bf@suse.com>
 <DF5BE432-F79E-4874-92DF-60A4DCD9EDBD@arm.com>
 <5cad4ffb-44ec-4cde-f5bb-f59dc3ca59ca@suse.com>
 <alpine.DEB.2.21.2104071424190.31460@sstabellini-ThinkPad-T480s>
 <D0931FDE-29DA-41B0-87AF-EF18ABDDA37E@arm.com>
 <e3edf002-9d60-7836-f7f0-cd9877653c2c@xen.org>
 <2b5b6cd8-7898-46f7-10bb-4a9d95da58ef@xen.org>
To: Julien Grall <julien@xen.org>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LO2P265CA0169.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::13) To VI1PR08MB3629.eurprd08.prod.outlook.com
 (2603:10a6:803:7f::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b5dba07-5a73-4256-6e65-08d8fa903687
X-MS-TrafficTypeDiagnostic: VI1PR08MB3374:|DB6PR0801MB1879:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<DB6PR0801MB1879DC857B500B10EF9772D5E4749@DB6PR0801MB1879.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 KFXuaV1NzTSkhL3B5sqqRjf3I6bhoUb0PgYT0XZ3q/4IwscCFW380vML8LwmxOlhDj58D/8pVaBcF5KmiPgR5d86HXq2j9JAcvlIdMRgRwlxUPqnsALrtwZUYP/LmShkcNerwu+oLq5puhvWFaDBUCLt+Go4LoZ+bNViKy9emn/AaFcFiTHtk9olYpZ47xzKU0Cys2dUcKTlLNtsx1Lj4ffbhkI/qgKBrJHvgAyNhk49GF+sr4T2ijv+iYqjcvPNsiqrRv6TwD+337q0gw8yK1wH0CY9Y5bs18esJDu+IzFNw8sWiHkCyBDYABQ0S0ZRGI/pYsifaXyXxZj07UI2/a0M0EtIkEbOJqMRK21DMQzxGJ85DXItDT67Ec5IbK/JF/NgZrb3AcVL4taur+XW/T44LpMOJp1YKXHNbalhMKVvNWskONiOKeSHCF+AliYudpWyXoMBGwQVLJKwXngRjEzxxvzywEqCjP07Yy/p2YqhnaOqEwNkqHl8qqJvyiPp1hclOAR0I3OUSE2ssW4kHyFQ1oubpsuCqGv4sSPXROgdh974wqstqn7tU0XZZygkMuNDp4TrK+RxPrBUEDAPtz6dYzP0QUzETlkr/MNbqr2BCj4vXYbF08o+emeP7ixzcGmK9/TTfvDirN1909Mi1Z1bYVHct8OPqlsPhVjegoYA4T6dFPyzSuYAa9rSvDRuFX3rhaibO2BL4ag9ho0N41ofi+uenpbwwTZ761ClxIQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3629.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(136003)(396003)(366004)(376002)(2906002)(33656002)(26005)(8936002)(16526019)(186003)(478600001)(53546011)(36756003)(52116002)(5660300002)(86362001)(2616005)(956004)(66476007)(66556008)(66946007)(16576012)(6666004)(8676002)(38350700001)(44832011)(38100700001)(4326008)(6486002)(54906003)(6916009)(83380400001)(316002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
 =?utf-8?B?S3FFU3JTTWdUTE1VUjIrLzZJNlNLMzYyVWNsaXgzdWF0bHZKdVhXZzUzRUwr?=
 =?utf-8?B?UXJlYkNLQ3VpemtadVFlNG45MFpTSWtXNWQvb2d2OURXSlVrUFdDS0Flemtz?=
 =?utf-8?B?dGMyUi9YMGZzUlh1QzhNUTVsYVNPK0NXbEVqOFMxTW5JaTE0ODhLbHpoUS9B?=
 =?utf-8?B?d1VtT1lhVFR0VHBjS1dkbm1NOXcrd3VNQW4zTG5ZNCtoK1JhakZ4RThJVCtT?=
 =?utf-8?B?OXBqeUdxelN6VTV1Um05ZHJRRXdralZLMlVSS1ZRTW01TzYxczZsMGg4V0tF?=
 =?utf-8?B?YnJKMXptN3UxNy9aQUoxeVYrc0xxSGtJcGo3ZDBoWlBoaHZJbTU1T3B1TlpE?=
 =?utf-8?B?cEZDYzFIWkNhdEloajFhL1ZrSlJhY0Ntc0FRWmFycnVna3lQcUVUZnd0ZUY0?=
 =?utf-8?B?dkdrNll0OGExUTRYdGpNOW9EMnovaFdMem9vSVZSdEVoRDUvUGpOZzZpdjMx?=
 =?utf-8?B?TndCRTREMlBROGVZSHRnZkFkMnBzcXNzVE5iWHJGbkxqK041TlNsN2F0SGYy?=
 =?utf-8?B?SjZmdjA4UzVaZGRFWi9OVW9JcXljOFNHOGpjMEpkQnB0Z1U2TnRRV2xjV2pu?=
 =?utf-8?B?Q0QwbnJwUk1JQzJvb0c5OExGSEpVQXhIekFyS2RJcGFlMkNESldveWxmcHVa?=
 =?utf-8?B?eEJoUEl6aWFmamUxaExUbHQ5NnI3L2xlMktIY1VTLzVFOHRieWhjYzJqOWxT?=
 =?utf-8?B?ajhETzgzTnk4QVBTMU5ZN25DdkcraDZna21tOHdUcFA2YWZnU3g0bVV4OGJr?=
 =?utf-8?B?YUNSMXNsK09aOUZLMWJYbE5vclQyV3kxY3dBM2VNZnFUOEpiZEFUekdxSnh6?=
 =?utf-8?B?Zy9hYjhmbjVlWXo5MmJBd0E1SjEvK1BPb3RkcWxuSDkxOW82SjJmQ2hRSGdp?=
 =?utf-8?B?SGM5SDZBQ1NLNnd6bkV1aE9UbXFZdW5uZnc0RW5xQ3lYSWRoYlJtQ0tJNDhh?=
 =?utf-8?B?ZXVFZzZlSHhzZXNkRDZzZjBROVNWR0cxVTJhdnYyLytPWWp1MXNCbnZ5TDVX?=
 =?utf-8?B?eVZ4YSt3U3dKSTZoakpVUXpmMFB1YUVoT1UvcVBUQ1JNY2JTMkxtMVRCYmM3?=
 =?utf-8?B?cjEwYTNKU3VqWVU1OFFLNHdBZ1Z1MDdFZHJSeTBpVjc0RlNPUlZlR0UxbVFr?=
 =?utf-8?B?V0R3TjZ6V25vSGhIRldpQ3ZoUmwrUUcrYndxMkJTUGplNDZrUjdrQVFNMnBS?=
 =?utf-8?B?dDVzb3ZzdlZEQjlMa2tEUHdRbVFNb0RJYnNqZW1SMThMMzRJdGQ2TGhHSVc3?=
 =?utf-8?B?NTNsajRHRWJCMGNPSkIwcU5jaWZnVHN5dmFoNEtFcjROWjY3Z2xmOFJ0S1Q3?=
 =?utf-8?B?QlpQTzNqeWF0eXd3ZVdJRVVRK0NONmpVMnlQdkxjeFNYNFZydCt5WklDT2p4?=
 =?utf-8?B?eDNmVjVKaldTaFRpbUU5b1g3YUg1c2lzNkNINkZzVFlmNWhKL0l6YStqVWtj?=
 =?utf-8?B?SG4xTlNoMzJBVlo2N2tmN1dRTm1lUEUzRm45RGVLVW5WNTlVYlNsREMxNnRj?=
 =?utf-8?B?cWVlU1hITzZyVjdKR2pJVWlmcHBMdUFVcFM3YnQwTVpVTG92bUJ3dGVITW0y?=
 =?utf-8?B?WGJKVDlyd1o5ZUh3NnpHbkhTZnFHbXV1MkZjQXp3eTBXdkVlRzVUNFJzamp0?=
 =?utf-8?B?bHgvZUNBVzlkMzZrcWhidm1NYTB2bTh1WXZGVHk5ZmhSQlFJb253NWpSTVNV?=
 =?utf-8?B?RGs4am10TVRKUlJkRmUyVTVIRk5ua25sSmkrT0VheEhHbW5nV1QvR3lGU0pa?=
 =?utf-8?Q?7vlk13FPSBwx3ltlX4kf9WI/iG8snNRcd+htJfw?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3374
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4624b7b9-ce46-4e1b-f698-08d8fa902d5a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7Cq5yUAfboJX7MLFQSmfwF9Xd6GyIQSCCKdkvQArbUQpu6BTS4Eud9Z/QorGGUu3JKVx/XZXqVlbkTOntsPEzd/8oqw8xGoVNJbEm1vJLSUG6qGu/vMHaeqLlYJzdI71s3/SXKesnNIeFOM/sP1Q7oQR0XStGDGA7H4gdcT49TEjkDUDKK+9c4c5F+jCbSVXUKcL0ZKwfqRAOs3Mocu+RBCpztDYI3xvn/RLcjjkAwLVD0Zwx/lRLL8K5q11CCyRBPZOn0Liam2Ca4zj1WSnGX1rnaQkQxCyd3ThxLfKgHzFq9cTZ4CsyBvwNpDQAfh9LMwsBApF2sXp5jxamXgJ7cpKfBTcK+Gd088Nu45hD5G584uM00cl0IHSN+j26POLzbHMwEpsHT+Uyk0g78HAmTNuJIjvUewRVeOW8gUxTfTEDPph+sVyXZIVkUyAkHbKp5LEqmz0Jk6qzyIuk9Bws/EtcyofA27rUIZQrSC4v5/zcxDCmqqcnfG2bfEF+SFlNPQjv8uFc9/xC0+mT/nq2Ht5AC2zM/IrtqgEElJSIbFxvsNF+qbG39z9acTIj1cBu1+RqQDcUx5ydZtTJVhqF+qwVjUyNZvMt8j8CxAdflcmAS9eHqd7UjEaHH9+Yv8xu+IrDvZbx2iQrvrnFJty6ynmojedZhGu0urzjU1QP7Q=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(396003)(39860400002)(46966006)(36840700001)(2616005)(478600001)(5660300002)(36860700001)(81166007)(16526019)(6486002)(356005)(36756003)(53546011)(16576012)(956004)(8676002)(54906003)(83380400001)(2906002)(6862004)(70206006)(70586007)(336012)(4326008)(33656002)(8936002)(47076005)(82740400003)(26005)(186003)(44832011)(6666004)(316002)(82310400003)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 13:14:16.8722
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b5dba07-5a73-4256-6e65-08d8fa903687
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1879



> On 8 Apr 2021, at 12:50, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 08/04/2021 12:40, Julien Grall wrote:
>> Hi Luca,
>> On 08/04/2021 12:02, Luca Fancellu wrote:
>>>=20
>>>=20
>>>> On 7 Apr 2021, at 22:26, Stefano Stabellini <sstabellini@kernel.org> w=
rote:
>>>>=20
>>>> On Wed, 7 Apr 2021, Jan Beulich wrote:
>>>>> On 07.04.2021 10:42, Luca Fancellu wrote:
>>>>>> Just to be sure that we are in the same page, are you suggesting to =
modify the name
>>>>>> In this way?
>>>>>>=20
>>>>>> struct gnttab_cache_flush {
>>>>>> -    union {
>>>>>> +    union xen_gnttab_cache_flush_a {
>>>>>>         uint64_t dev_bus_addr;
>>>>>>         grant_ref_t ref;
>>>>>>     } a;
>>>>>>=20
>>>>>> Following this kind of pattern: xen_<upper struct name>_<member name=
> ?
>>>>>=20
>>>>> While in general I would be fine with this scheme, for field names li=
ke
>>>>> "a" or "u" it doesn't fit well imo.
>>>>=20
>>>> "a" is a bad name anyway, even for the member. We can take the
>>>> opportunity to find a better name. Almost anything would be better tha=
n
>>>> "a". Maybe "refaddr"?
>>>>=20
>>>>=20
>>>>> I'm also unconvinced this would be
>>>>> scalable to the case where there's further struct/union nesting.
>>>>=20
>>>> How many of these instances of multilevel nesting do we have? Luca mig=
ht
>>>> know. Probably not many? They could be special-cased.
>>>=20
>>> There are not many multilevel nesting instances of anonymous struct/uni=
on and the maximum level of nesting I found in the public headers is 2:
>>>=20
>>> union {
>>>     union/struct {
>>>         =E2=80=A6
>>>     } <name>
>>> } <name>
>>>=20
>>> I also see that in the majority of cases the unions have not meaningful=
 names like =E2=80=9Ca=E2=80=9D or =E2=80=9Cu=E2=80=9D as member name, inst=
ead struct names are fine,
>>> It could be fine to keep the meaningful name the same for the struct ty=
pe name and use the pattern for the non-meaningful ones as long
>>> as the names doesn=E2=80=99t create compilation errors?
>>>=20
>>> Example:
>>>=20
>>> struct upper_level {
>>>     union {
>>>         struct {
>>>=20
>>>         } meaningful_name1;
>>>         struct {
>>>=20
>>>         } meaningful_name2;
>>>     } u;
>>> };
>>>=20
>>> becomes:
>>>=20
>>> struct upper_level {
>>>     union upper_level_u {
>>>         struct meaningful_name1 {
>>>=20
>>>         } meaningful_name1;
>>>         struct meaningful_name2 {
>>>=20
>>>         } meaningful_name2;
>>>     } u;
>>> };
>> If I understand correctly your proposal, the name of the structure would=
 be the name of the field. The name of the fields are usually pretty generi=
c so you will likely end up to redefine the structure name.
>> Unless we want to provide random name, the only safe naming would be to =
define the structure as upper_level_u_meaningful_name{1, 2}. But, this is g=
oing to be pretty awful to read.
>> But I am still a bit puzzled by the fact doxygen is not capable to deal =
with anynomous/unamed union. How do other projects deal with them?
>=20
> While going through the list of anynomous union in Xen, I noticed we also=
 have something like:
>=20
> struct test {
>    union {
>        int a;
>        int b;
>    };
> };
>=20
> We can't name them because of syntactic reasons. What's your plan for the=
m?

I would say that if the fields a and b are not meant to be described in the=
 documentation, they can be hidden, so there is no need to change the struc=
ture itself but we might just add some comment containing
Doxygen tags for skipping them.
In Zephyr they have some kind of structures like that.

>=20
> Cheers,
>=20
> --=20
> Julien Grall


