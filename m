Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FC03BBA6F
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 11:42:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150007.277420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0L6s-0006zj-OJ; Mon, 05 Jul 2021 09:41:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150007.277420; Mon, 05 Jul 2021 09:41:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0L6s-0006wl-KS; Mon, 05 Jul 2021 09:41:50 +0000
Received: by outflank-mailman (input) for mailman id 150007;
 Mon, 05 Jul 2021 09:41:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jU53=L5=arm.com=Luca.Fancellu@srs-us1.protection.inumbo.net>)
 id 1m0L6q-0006wf-8Y
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 09:41:48 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.4.77]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 364ecdcc-dd75-11eb-8440-12813bfff9fa;
 Mon, 05 Jul 2021 09:41:46 +0000 (UTC)
Received: from PR0P264CA0101.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:19::17)
 by AM0PR08MB3329.eurprd08.prod.outlook.com (2603:10a6:208:57::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.27; Mon, 5 Jul
 2021 09:41:43 +0000
Received: from VE1EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:100:19:cafe::5d) by PR0P264CA0101.outlook.office365.com
 (2603:10a6:100:19::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22 via Frontend
 Transport; Mon, 5 Jul 2021 09:41:43 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT013.mail.protection.outlook.com (10.152.19.37) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Mon, 5 Jul 2021 09:41:43 +0000
Received: ("Tessian outbound 71a9bd19c2b9:v97");
 Mon, 05 Jul 2021 09:41:42 +0000
Received: from ea1444c9712e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 60D9B237-B688-4DF7-99C6-486BA435B146.1; 
 Mon, 05 Jul 2021 09:41:22 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ea1444c9712e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 05 Jul 2021 09:41:22 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PAXPR08MB6543.eurprd08.prod.outlook.com (2603:10a6:102:12f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Mon, 5 Jul
 2021 09:41:20 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::4a9:5afa:372e:97f5]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::4a9:5afa:372e:97f5%3]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 09:41:20 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO2P265CA0401.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:f::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Mon, 5 Jul 2021 09:41:19 +0000
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
X-Inumbo-ID: 364ecdcc-dd75-11eb-8440-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HrAsSx0rfTEqLNvV8qc3N0KETcG70S8EnjOVMqOd7yQ=;
 b=TYOBDuGShVx+HNUgzJp8N0Y+I1jz8rH4pUlUlMfThXfNnP8RyFcgJZlcwV7cnndI7BEUvJTDVWHgBNQsV9qg61JUnnIDpgx5AWFhl685kGVb3Twh+3XlPzhgH+NgNH07/gNhEqKrWDmvXkI6oaCNm4bzJKesa9sR+YLpamkwE8c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 18d00f3ab4701cae
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UiWTkMZIzwrjl6UqEWmMO3L4AkU/0QcsUeEpwVPwYRebX9cxpwyg8acXa10zTXNRsXn2HRkIhNNleriMrIp++9TojOcqucHhscGdXQ9Jw8rdUKW2R7LL1myT2DtJ7e17MSGqlokTulMtSK2L1ctQyM5O3Vd6knAT8Fx9J9eYpBx6CYRifdYYhaQEquc39fqgNOAjxBMGk4D6lZfyXxXS3GG33mQHAYgXMLPJ90gM1L6GA8XSjK5WCqVR0+ExBphOlsJS5BLJb/Cci2nPNaRSR9RrVehbwE8WlbAdnMqCqgkL3rVFW0V91Xdqv8a74EwIAVM39vutCjmSnna2am9RnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HrAsSx0rfTEqLNvV8qc3N0KETcG70S8EnjOVMqOd7yQ=;
 b=i0HsNKVCc9B3h4LndvRxfnM4aT2JWRpBdo9AGpXsA5g0nLsC3kAYoL20EIBAHei3oS5wknqeGkCFMHymnu8nFKTuYPxiOEbWI+a9vGdXPlKr6qzqmVmIdLDNdX5gnLKZabNG5uwZ7YvR6LiW+rCWtxacemJH+7EETQ085SiofZdTAnqDA+R5bmndFYtuLxLCRyi72jvCRRwc9L1XiXrpDw70e/58Gj6CDK7GWNCTziP0N2AgSe5e02aqNMJxdcUl6wXrhbHcKgx1Xb0l+Ko0zyR/dyXdQZnrQ8giE3tfbqt4YfoKJXxhfJJb0wp09fNR6f3xcKa8jpy7TGjZYJelFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HrAsSx0rfTEqLNvV8qc3N0KETcG70S8EnjOVMqOd7yQ=;
 b=TYOBDuGShVx+HNUgzJp8N0Y+I1jz8rH4pUlUlMfThXfNnP8RyFcgJZlcwV7cnndI7BEUvJTDVWHgBNQsV9qg61JUnnIDpgx5AWFhl685kGVb3Twh+3XlPzhgH+NgNH07/gNhEqKrWDmvXkI6oaCNm4bzJKesa9sR+YLpamkwE8c=
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH v6 7/9] docs: Change Makefile and sphinx configuration for
 doxygen
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <alpine.DEB.2.21.2107021324090.9437@sstabellini-ThinkPad-T480s>
Date: Mon, 5 Jul 2021 10:41:13 +0100
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <9C2F15B2-2B24-4C23-9902-8FE355C01201@arm.com>
References: <20210510084105.17108-1-luca.fancellu@arm.com>
 <20210510084105.17108-8-luca.fancellu@arm.com>
 <alpine.DEB.2.21.2106231506040.24906@sstabellini-ThinkPad-T480s>
 <1FC1E8DF-8AED-4ABD-BE9A-DBBD9D66EDBB@arm.com>
 <alpine.DEB.2.21.2107011037580.9437@sstabellini-ThinkPad-T480s>
 <7C3269F1-3C61-4F39-82F9-9DE4C563849B@arm.com>
 <alpine.DEB.2.21.2107021324090.9437@sstabellini-ThinkPad-T480s>
To: Stefano Stabellini <sstabellini@kernel.org>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LO2P265CA0401.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::29) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bec5dace-d9aa-4840-1c0b-08d93f991933
X-MS-TrafficTypeDiagnostic: PAXPR08MB6543:|AM0PR08MB3329:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB3329049E6575037A1B282A97E41C9@AM0PR08MB3329.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 eTS+uPfKWQIGqVHg3orVhv8K7PLzIPuvKHFNBJ/qFb4o3BlhvxlQ5kcfnjkQMxYMa/ByS6pGIGzYWfn+Z8/R/6POFJksph4ztCjbIKSxgO/8q/Z1FbWiRdl8wDCdQDJ23lGi0NRhg6XZeFjlH2w4TdKfyBWgOvc3gWMorogoRxky5PVtDa5ImZlGgh+vQ1NgX94FTzP80NNdZoM4vGE10gVHsEmAvRpDL3W6qHzd7n/86IeCg2kwlp4CUDQ8iy44WJDkaO69i+lWLDsOJ8jqxBOrUpnBLEezpPPMMeN4HKM/QSYvfNC4Y0YuRVx1ujuO8nl8V/d21ktwKVHqX4MHxHlVRSXSy99jG5nyWJEMsNf2su0+n76Yk55/+DRL4qaFCzZREzHq5OMGrlWwUXh6DgOJ1PGPQOFBT2zPI9dHk1yCB2QMCNdU21twiOqUAyZIZqykSaJh5XLr1P4vlqA36BseSJsAWlaAK/t4AeXmH9AfOjGO1yVcNXrm2pvLoGod6/Hyn1eFMQX31m5tCVp1MstrWgh86RRBtOwdkKd3JO+C8mVaXHcseVhNagBQnMZlzGNfHnmal9HyxU5dlwgE6i2G1kvaQNiILq6SpVofTqSXy9txX7utJm5vujlfXilzZXKnJfzdP5sRjnYLKYkVPxUugrncehD0nSANPnMHheL5nEmW9NkXREaGkiXbYQSjrAdyWEe6zcTgQCcFxpkG4d8mkxm2O1G1mMOHqjVBJnBBwdVarhXiBKxdVPL8sT91
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(346002)(366004)(136003)(376002)(478600001)(8676002)(66556008)(66476007)(66946007)(16526019)(2616005)(5660300002)(44832011)(956004)(4326008)(8936002)(38100700002)(38350700002)(54906003)(186003)(83380400001)(26005)(6666004)(6512007)(6486002)(2906002)(36756003)(52116002)(316002)(6506007)(53546011)(86362001)(6916009)(33656002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?Sm00azRDSTZyOGNjdUZZY0xIYmZsZjlaSVRZR3JRMHRiY0JlTnR4NC9ZWU1u?=
 =?utf-8?B?TzRDUHB6TDhBeXUrRlUwdVhvWGptdEV1N0gzRWdLdWRmRGQzclZza0JHeFp4?=
 =?utf-8?B?Y1IxaGpXTEIzZllsaFdQRmhiRUIyaWFXMFpZSTJoV2E5OXZrWTdqN0dxVFFn?=
 =?utf-8?B?Vk5YUnJ5blZpR2Y5OFBacFJKUmIxazY0WURNaGk4dGVlaHJsUTZtUXNuWWpG?=
 =?utf-8?B?eWdyZWVHMzI2bVVGOGdEdEQxbEhDemppbXV3dVVZMWZZdTZaL05uaHYvRzRw?=
 =?utf-8?B?Zk85SlZ0eUpXSUM5VDNpb1dOQTJwb0VUc2hsZTBmMVo4bEdZdkJ6b2JYc0hX?=
 =?utf-8?B?RG9UZHFraXRrbzBKbmp0U2l3d1lnMy9DV3Q5ZkwwTThJeWRBdzlJMTFOalhN?=
 =?utf-8?B?ejlmRy9IUWtSNzR1dVkvaCtPTFdEMFFibzJGUC9ibkg2MjVCNml4SlZGVVFJ?=
 =?utf-8?B?KzF4ckpnOHcxOHFmWk5GZnI1TXhDUFJlVVlBUEp1cER1RlpkNDlzMHVIdity?=
 =?utf-8?B?SklKQ3QwYTJNb1h6b0w2UEZVNUs3NGwrNHFNVllkZm1hT0FRMzkvdFRCN1ZS?=
 =?utf-8?B?VmxRY29VcjA2dWd3c2dpdm4rWTgvTk1OcjhhYnFzVVd0b09qS1kyWDlaanpx?=
 =?utf-8?B?WGN1UldzTEFhY3ljVnhrcHk1b0JZQ0YvSkg1U08yTlJkclg2bkxRdGN0NzJK?=
 =?utf-8?B?d1ZyeVZHRnptYjNhSDEvVHVVM2xpNmUrWENlUEpUMXRZa2k5Ym5yeWtMVUdR?=
 =?utf-8?B?SG9jODlxVVZHTWg0dXNKMnFnOHNYYUNwYjRITVJJdlRtQUNFVWZLaUxEbGJE?=
 =?utf-8?B?emVLaHB1WUxucXJlWG9QQTRnOFBlVzdmSUNhUE5oaGpXckMrVElhNDFadFpJ?=
 =?utf-8?B?ZzVYYXpKNWZJOGR0dTBMWDBXVDZwaGZMdFo2cVgydTA1UitjZDgxOEVSNnRV?=
 =?utf-8?B?TkIvTDV2ZkZvSzhyT0dMLzBOUFpTYzgxb1pIRjRtQjBTZmZGYWFiSmFkL3Z1?=
 =?utf-8?B?MHBqZVRyTWhsdFB5Tys0YnRnQ0l1a2JhaEwzM1lraWJJUC9sK3V1VnkxdEhq?=
 =?utf-8?B?OXB3MC9QdEc0OWxwbXk0TWpJLzUvdWRLUHY0UUlOeXMxMlllRkczTVVtb1lC?=
 =?utf-8?B?MDBJdEFPaVhvRkk1U3UvZWxDU1RwdS9sZjh0b2JwSVBrRkJ1SmNFYzdoSWpX?=
 =?utf-8?B?Qm1Ob3ZTcGx6RG9nUll2d0t6bklteE1EdFpCZWs3MlhMME1jeHZrVVBsUGVa?=
 =?utf-8?B?eXlWRWFLdFBidVArQXNiYnArT3dtRlp4K3hGSlE4YUhRb3NmazAvTWlYU2c3?=
 =?utf-8?B?OWVjQzNYYkRMR0swRTl6UkgrZkJoRFhtMHRIK2ZLUndXdXpRZ0dianZ4eWR0?=
 =?utf-8?B?djU4Zlh3NW9yalpFZHpuQXhjYS8rcmloRTFRNmE0Q3R2bnJwb3hsZml0WFcy?=
 =?utf-8?B?VjR0eWZoYjhoVkZDa3UvdG1EaGFydXJXbXZtSmprOFdrdi9ncEU0Q3V5Y0hZ?=
 =?utf-8?B?WnVNUThISG5IV2NzZkQrQ2VwNzFSWDg0Z2JQQmJJRnQvYVNTdFUwZzQrRTUx?=
 =?utf-8?B?cDkyamc0TFhEZGovZGp4WWxtZ0pJWm9VeTUxakNvd2lJNVFpYzdNNm0vVElE?=
 =?utf-8?B?T3ViWURBQnhiL2tGOGRFNW55eDFwajU0R2tNRDh0SkpZZkZLN1doWC80NSs2?=
 =?utf-8?B?NUJhRHhZZGZUeks3c2pEcHZjaEwra0ZxdmxFTFRITkJjT0dZQU0vYW1mR3Nj?=
 =?utf-8?Q?fDHCVVbuqrdY9cBPaR8aDt72wwmFP04s9Q/epA/?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6543
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7f7c21b9-bb60-4209-47eb-08d93f990b46
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	elR7CDNrEN9GRgyMfswsjbkiSG5FyW6G1o6dukSMtPq55pixMPzT8kkY4tgxQ/fj/lxpFsedblIcIz8JYli5Qs78l7dfs17OIbRRZhjqA9yUljFz3q82GWadgTfypDMpYALwSfeh1vKEPMWw1ZZgyfdX+VqStZWylOyFkH2A2xQXXfWVDdKP3Au1m2XJDlHzoXk79mXYyFGjCHrZN8vGoa2r6WUIMH+gmHB5iTfhvkA92WamZVdraLsRRJYzO0OWDZ53vbLMqOMIkQjh063ciXdZ7qEIye1bleYEk2cLHwQioAUujDqCjUnnlg6rOz5JN07r1ATS4kIhdnzNCLD759t6m16W9mXeRxmYzeDrDFTgN/R114+PBIAlD8PBClt9nOl40X27psrnP3i6+ngIuG1I8H2Tw4rDSH6CwWAelcHO/p75avp7cz623vaPQ3oKk2zsyMkWBgDrYF+RaIzxr4m97sQ1Ue7Vmy52uiP7oaEc+UYHpVPqHA58ACYyhO+R5um8cscxoTYRE2Z/XdEOftPvFfvEH2DYF0zTZA5y7xlmk46CsoqHPZaA8+bgpPpNbdbznSA3R/IBk8wHAlnyhHjj+hl4TSPG6USFHFMxKpEE+6angkPd+ue7gRUPkP7EFW4Laa+IaZhB3SKfKSVzHwt9n299Mv1nz0FSCQHF+YRMfGEAQlVkN/vwXIi0eAbxNJVP6x0Fso5ivdqjgfUWFQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(39850400004)(136003)(346002)(396003)(36840700001)(46966006)(6512007)(82310400003)(36756003)(956004)(86362001)(2616005)(5660300002)(8676002)(2906002)(70586007)(47076005)(8936002)(336012)(70206006)(186003)(16526019)(53546011)(83380400001)(6506007)(82740400003)(4326008)(356005)(36860700001)(478600001)(54906003)(81166007)(6862004)(6666004)(26005)(33656002)(6486002)(44832011)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 09:41:43.3402
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bec5dace-d9aa-4840-1c0b-08d93f991933
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3329



> On 2 Jul 2021, at 23:23, Stefano Stabellini <sstabellini@kernel.org> wrot=
e:
>=20
> On Fri, 2 Jul 2021, Luca Fancellu wrote:
>>> On 1 Jul 2021, at 18:43, Stefano Stabellini <sstabellini@kernel.org> wr=
ote:
>>>=20
>>> On Thu, 1 Jul 2021, Luca Fancellu wrote:
>>>>> On 24 Jun 2021, at 00:33, Stefano Stabellini <sstabellini@kernel.org>=
 wrote:
>>>>>=20
>>>>> On Mon, 10 May 2021, Luca Fancellu wrote:
>>>>>> Modify docs/Makefile to call doxygen and generate sphinx
>>>>>> html documentation given the doxygen XML output.
>>>>>>=20
>>>>>> Modify docs/conf.py sphinx configuration file to setup
>>>>>> the breathe extension that works as bridge between
>>>>>> sphinx and doxygen.
>>>>>>=20
>>>>>> Add some files to the .gitignore to ignore some
>>>>>> generated files for doxygen.
>>>>>>=20
>>>>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>>>>> ---
>>>>>> .gitignore    |  6 ++++++
>>>>>> docs/Makefile | 42 +++++++++++++++++++++++++++++++++++++++---
>>>>>> docs/conf.py  | 48 +++++++++++++++++++++++++++++++++++++++++++++---
>>>>>> 3 files changed, 90 insertions(+), 6 deletions(-)
>>>>>>=20
>>>>>> diff --git a/.gitignore b/.gitignore
>>>>>> index 1c2fa1530b..d271e0ce6a 100644
>>>>>> --- a/.gitignore
>>>>>> +++ b/.gitignore
>>>>>> @@ -58,6 +58,12 @@ docs/man7/
>>>>>> docs/man8/
>>>>>> docs/pdf/
>>>>>> docs/txt/
>>>>>> +docs/doxygen-output
>>>>>> +docs/sphinx
>>>>>> +docs/xen.doxyfile
>>>>>> +docs/xen.doxyfile.tmp
>>>>>> +docs/xen-doxygen/doxygen_include.h
>>>>>> +docs/xen-doxygen/doxygen_include.h.tmp
>>>>>> extras/mini-os*
>>>>>> install/*
>>>>>> stubdom/*-minios-config.mk
>>>>>> diff --git a/docs/Makefile b/docs/Makefile
>>>>>> index 8de1efb6f5..2f784c36ce 100644
>>>>>> --- a/docs/Makefile
>>>>>> +++ b/docs/Makefile
>>>>>> @@ -17,6 +17,18 @@ TXTSRC-y :=3D $(sort $(shell find misc -name '*.t=
xt' -print))
>>>>>>=20
>>>>>> PANDOCSRC-y :=3D $(sort $(shell find designs/ features/ misc/ proces=
s/ specs/ \( -name '*.pandoc' -o -name '*.md' \) -print))
>>>>>>=20
>>>>>> +# Directory in which the doxygen documentation is created
>>>>>> +# This must be kept in sync with breathe_projects value in conf.py
>>>>>> +DOXYGEN_OUTPUT =3D doxygen-output
>>>>>> +
>>>>>> +# Doxygen input headers from xen-doxygen/doxy_input.list file
>>>>>> +DOXY_LIST_SOURCES !=3D cat "xen-doxygen/doxy_input.list"
>>>>>> +DOXY_LIST_SOURCES :=3D $(realpath $(addprefix $(XEN_ROOT)/,$(DOXY_L=
IST_SOURCES)))
>>>>=20
>>>> Hi Stefano,
>>>>=20
>>>>>=20
>>>>> I cannot find exactly who is populating doxy_input.list. I can see it=
 is
>>>>> empty in patch #6. Does it get populated during the build?
>>>>=20
>>>> doxy_input.list is the only file that should be modified by the develo=
per when he/she wants to add documentation
>>>> for a new file to be parsed by Doxygen, in my patch about documenting =
grant_tables.h you can see I add
>>>> there the path =E2=80=9Cxen/include/public/grant_table.h"
>>>=20
>>> OK, thanks. I missed that addition.
>>>=20
>>>=20
>>>>>=20
>>>>>> +DOXY_DEPS :=3D xen.doxyfile \
>>>>>> +			 xen-doxygen/mainpage.md \
>>>>>> +			 xen-doxygen/doxygen_include.h
>>>>>> +
>>>>>> # Documentation targets
>>>>>> $(foreach i,$(MAN_SECTIONS), \
>>>>>> $(eval DOC_MAN$(i) :=3D $(patsubst man/%.$(i),man$(i)/%.$(i), \
>>>>>> @@ -46,8 +58,28 @@ all: build
>>>>>> build: html txt pdf man-pages figs
>>>>>>=20
>>>>>> .PHONY: sphinx-html
>>>>>> -sphinx-html:
>>>>>> -	sphinx-build -b html . sphinx/html
>>>>>> +sphinx-html: $(DOXY_DEPS) $(DOXY_LIST_SOURCES)
>>>>>> +ifneq ($(SPHINXBUILD),no)
>>>>>=20
>>>>> This check on SPHINXBUILD is new, it wasn't there before. Why do we n=
eed
>>>>> it now? We are not really changing anything in regards to Sphinx, jus=
t
>>>>> adding Doxygen support. Or was it a mistake that it was missing even
>>>>> before this patch?
>>>>=20
>>>> Yes this is new, I saw that we didn=E2=80=99t look if sphinx was insta=
lled in the system, so now we did
>>>=20
>>> In that case, I think anything related to SPHINXBUILD and whether sphin=
x
>>> is installed or not, should be a separate patch at the beginning of the
>>> series. It could be committed independently before the rest of the
>>> series. When we get to this patch, SPHINXBUILD should be already there.
>>=20
>> I=E2=80=99ve introduced SPHINXBUILD in this patch: [PATCH v6 5/9] docs: =
add checks to configure for sphinx and doxygen,
>> In your commend do you mean that you would like it to be outside this se=
rie and this serie to be based on top of that one?
>=20

Hi Stefano,

> I totally missed patches 4 and 5. Can you please CC me to the whole
> series next time?

Yes, I think the script add_maintainers.pl didn=E2=80=99t add you in CC on =
these patches, for the next version I will add you manually

Cheers,

Luca

>=20
> I meant as a separate patch, like you have done in patch #5. It doesn't
> necessarily need to be at the beginning of the series so what you have
> already done is OK.


