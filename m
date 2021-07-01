Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B62F3B926D
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 15:38:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148678.274752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lywt7-0007Qo-44; Thu, 01 Jul 2021 13:37:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148678.274752; Thu, 01 Jul 2021 13:37:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lywt6-0007Ov-VS; Thu, 01 Jul 2021 13:37:52 +0000
Received: by outflank-mailman (input) for mailman id 148678;
 Thu, 01 Jul 2021 13:37:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T0jQ=LZ=arm.com=Luca.Fancellu@srs-us1.protection.inumbo.net>)
 id 1lywt5-0007Op-4P
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 13:37:51 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.13.87]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 85c838ae-da71-11eb-831f-12813bfff9fa;
 Thu, 01 Jul 2021 13:37:48 +0000 (UTC)
Received: from DB6PR0202CA0010.eurprd02.prod.outlook.com (2603:10a6:4:29::20)
 by DBAPR08MB5800.eurprd08.prod.outlook.com (2603:10a6:10:1a9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Thu, 1 Jul
 2021 13:37:45 +0000
Received: from DB5EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:29:cafe::5f) by DB6PR0202CA0010.outlook.office365.com
 (2603:10a6:4:29::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.21 via Frontend
 Transport; Thu, 1 Jul 2021 13:37:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT011.mail.protection.outlook.com (10.152.20.95) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Thu, 1 Jul 2021 13:37:45 +0000
Received: ("Tessian outbound f29a5a293366:v97");
 Thu, 01 Jul 2021 13:37:45 +0000
Received: from 9c5152fe1225.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BFA2122E-116F-4386-821D-CC30FC2A63B2.1; 
 Thu, 01 Jul 2021 13:37:07 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9c5152fe1225.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 01 Jul 2021 13:37:07 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PAXPR08MB6735.eurprd08.prod.outlook.com (2603:10a6:102:138::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Thu, 1 Jul
 2021 13:37:05 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::7cfd:a8eb:b25a:f025]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::7cfd:a8eb:b25a:f025%7]) with mapi id 15.20.4264.026; Thu, 1 Jul 2021
 13:37:05 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO4P123CA0104.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:191::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Thu, 1 Jul 2021 13:37:04 +0000
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
X-Inumbo-ID: 85c838ae-da71-11eb-831f-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZPq7tTnEUcaJiVPkylVzrXBdU6+dNvknwRZOA2iUTws=;
 b=QntHPWYSKzhDc6QLcsxr7s1sgf5J2I0LBw3TgxiRuDN7IDJqzLuPG8ePn/zF2bHil3+rpzhEcnhBLYTT8x3jl0cGq50wfBv0G2UA40Sfk89uQrOAgcqqQXOwA54fTWfHeR1v3xystXQBuhS1Vf20FaIvcaIB8k45pdvd2HB48pA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: c784443f5173c14d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f9XKCYcweWI0VVELHkjaKCAG7aRohgBNyPvN3XM4CSNREPSgt0MDeTc/HcxoSvCYYI17kBU76kdFVqqgqRMVBtA0KqWtNDNTN5XusQv8nnEB9LNKdQL7F2p4VCzVfS3yRcGzLHARq0zD+rpdTU7odN5b3SEhkeVT5+MKHxH8ex1G9tht6NZ8e0g39FnXBXAxqjtdn7S96GxlanCeqlj2naxUYZ0wiBCJVC+tuMtxxlIt/o4pkZHKjCnS4ZyYg4RKCuqa7j5aQbrTx0vjmCvC5kkaoOYPlVzcLfIN81ANKa93E3KeX8QoKID73E6pu09H+CfS9GfHupfoaVEjE7vxJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZPq7tTnEUcaJiVPkylVzrXBdU6+dNvknwRZOA2iUTws=;
 b=fPoC+4PfqX6OaRKmlB5GDQOmPoDl/WFVIbZubY0OhlY/FAMoiw6W6sibfo1ZwbCMs8NtAcfabjT1UbZEa1XG7kjhTViJISRxnQ1tj7L9CUpQ3FuODt3XL/ZPdSEp8owy5fMnOFvMUET0zO3PQQExfvMduZmijcRkDZ9tIyK+gdkVQY8aCQf9bHxsjpn8mbWH7xn+C2+mDMZsxP0w9XO/mAQhDWjACi4W453Vcace1syDutoP92/cnx349uIhJ6ek8XTIQ0/g75lcDcoRzAMaBcNbsPMw1NrRbumNLvtdMdPx7uFA+mT26Jxk2Ts6o3GhXdYkOIXF837jk8HRGAaRCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZPq7tTnEUcaJiVPkylVzrXBdU6+dNvknwRZOA2iUTws=;
 b=QntHPWYSKzhDc6QLcsxr7s1sgf5J2I0LBw3TgxiRuDN7IDJqzLuPG8ePn/zF2bHil3+rpzhEcnhBLYTT8x3jl0cGq50wfBv0G2UA40Sfk89uQrOAgcqqQXOwA54fTWfHeR1v3xystXQBuhS1Vf20FaIvcaIB8k45pdvd2HB48pA=
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH v6 7/9] docs: Change Makefile and sphinx configuration for
 doxygen
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <alpine.DEB.2.21.2106231506040.24906@sstabellini-ThinkPad-T480s>
Date: Thu, 1 Jul 2021 14:36:59 +0100
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
Message-Id: <1FC1E8DF-8AED-4ABD-BE9A-DBBD9D66EDBB@arm.com>
References: <20210510084105.17108-1-luca.fancellu@arm.com>
 <20210510084105.17108-8-luca.fancellu@arm.com>
 <alpine.DEB.2.21.2106231506040.24906@sstabellini-ThinkPad-T480s>
To: Stefano Stabellini <sstabellini@kernel.org>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LO4P123CA0104.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::19) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ae41800-3dd9-4e41-b110-08d93c9568e7
X-MS-TrafficTypeDiagnostic: PAXPR08MB6735:|DBAPR08MB5800:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<DBAPR08MB5800BFBEE2998BBF73A10C9FE4009@DBAPR08MB5800.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 qL1dMJwDE7OqZNHXK78em6+jJje9hI7Fn2XX4k1AiM8ehDbbWBElbGIUf0PaGIPg9Zhx/xts/kUxZjIvLsH7vnYkD71s+Wup+XYSQwP5xhYvvKOFM3FNvpZPS1Imlj/NSqAJOyHenSBBEoRKk2mXoEdYbWpqw5p7hdhq3cJO8NZru9RvDYJaVcsChUn7g59rUkkoyzGWF5QumSlM4mBZhCh1kMRRDm9/ViJ+l56Ms8bUcLGqwNQJApswGdrSTOXJ6Zqzm9UR94YcPdSXRYES85QzS7u6hyM0uMGvryIpLFB+24g1PtcqfERqH78zQEuAgZkhEGhkXu04WeVQZsfQVtrLuGynha4k5FxQZCaib4RYzv5AAQ1a8lXH7B1cX8GoWf6ubm58bQAmpjdJyL9Ov3TY70iMb1Jot1knxFFMVUNdwD4GEXZDmO4zP3E0D9SeW21TaOmahePbmjpKLaNzdOiWqL70/PTJujHu8+IqixctO7n0c+OatKv18tJjEsBpxaN9NKzZZ1HUbvdDyx9EZTjTlkmoe2xYdpwdErz5CCIrPzJIBVCYhpZ4StxaLEW/q7JKbJKaKQnRfRoCNyWZLkY/6yUxXIGvxonnm4+KzuTaEMT8Wg+6o8ZiGAROVc+sWfz+DJv2LhoYhzlQF8I46GbpKTP46PEajcI/VblCLEtl2wGuyOmviNlfR9bonyWlMqFo5NPQmcA4F1sIhf9diiS2rvUmpm5jvp7Fw/d5DkkQIzWv4c8WxU5PQ4tEtBNH
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(346002)(376002)(39850400004)(83380400001)(66476007)(956004)(44832011)(38350700002)(66556008)(66946007)(2616005)(38100700002)(186003)(16526019)(2906002)(6666004)(86362001)(316002)(5660300002)(53546011)(4326008)(6506007)(36756003)(6512007)(8676002)(26005)(8936002)(6486002)(478600001)(52116002)(33656002)(6916009)(54906003)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?cFh4L2kwYzdOOER2V2l4azY3cE5PZ2VkV2FQNllSb2tIR21neWxiTnM5TlEv?=
 =?utf-8?B?ZTNodUl5MGEzcXpkaVcyTUFBNkM1azY1RVZxSG5KRlZ3Y29tRHRRUy9DQjVW?=
 =?utf-8?B?dTdCanB1WHNOZEowL3hIOXJ0QVVtOWRxUnducktYL1NsVjRZU2VCeWZ5dXhC?=
 =?utf-8?B?VVhEb1FNa0FTbnRCQVdDbGcyQWwvejMvd2JWZFJsMTNCbko0T2ZtamtYK29q?=
 =?utf-8?B?eWdaVVZiWDYvbUQ2bG5FUWdEY1htNlNSbi9OOVlyWWVBY3d3RkJGcmRheDZS?=
 =?utf-8?B?akNhRytyRHlub2lSRHh3R000L1FpMmgzb1c2ZDJVTmRBNUFSQVpSSFZOQ3Fs?=
 =?utf-8?B?OEIyaHcxS3RwT3pXNklYM2FUcllyOGcxQ2R2S0RLL2Zkd3cxenFVK1JkTnFK?=
 =?utf-8?B?MDhmVVR3TjVaSU4wNnBwQjF2eFFuK1NHNU9LbnowVUNsaWlBdGo4Z1UxVnJ1?=
 =?utf-8?B?eGlwa3huVU4yZ0JrYTJ6bkpxa3dYRWtxNm1ZMERvODFIZk9kRXQ5UVJXUDhr?=
 =?utf-8?B?QmpvTUtINHdlQ3BPQnNncFZveVA0NDlFbTcvQ3VsVkFxU0Y1bkZxZVFsdFl6?=
 =?utf-8?B?TWRXZEdJdFFqVHJlOEJQNmpPWnFJUHg2ckZXUzFucWlxaS9xbEMxR0dVaElv?=
 =?utf-8?B?VDRyN1BuWjM3b3hlclJYZXdvWDh6QUp4U3dqLzFEazU5NlR6K3ZXR0tQZWUx?=
 =?utf-8?B?RGRFZTBVMnVIN1dpV1JVN3I4V0I1VFduL2EyUWRLSGN4WXVJa3EzbmpVSk1K?=
 =?utf-8?B?cStZVVV1NUJ0TTRjcVZVNVpLK0xFam1YSHg5MWwyNDBha1czWDUxVjBYSVNy?=
 =?utf-8?B?RVB3THZWWWtld21KWHlOMStTWXVVRCtZYnM5S21pK05lWXBxdWRvTWxVZDhy?=
 =?utf-8?B?cmN2NEdPaGFkZCtoMHNLMGJicTR6bEZmcUdZS1Y4NEI5UERkd0I2ZzMwNlJU?=
 =?utf-8?B?NUN2Tm1na0N1RHV3RDRXN0gxMU5pQzNLcGNxem1KTjBYSjRzQThjM3RUbDh4?=
 =?utf-8?B?TGxiSWFvcnB5YUh3QTg3VzViY0dNdVZlY3dIdlI4M2FJNG9NS2puTWFDWktU?=
 =?utf-8?B?TWY5RzlrdkxadE5yWWhXZ0pRMjJ6VlRSMytNOTNYZlRTNm5kLzhBWnNPZmR0?=
 =?utf-8?B?aTFoTHNIOTFiRHV6NmVaYkdtNGN2bUlDZllCU1lUSy8wQ0UvRnhLR2ltRHdQ?=
 =?utf-8?B?VitsK3MxQVFzMU9qbGJGNVlSazJ2a1l1UzBGc2s0MTVFZldiTC9zNkt4aVBT?=
 =?utf-8?B?U2RJK0VGb1paV0tvZUo2Vk84Ti9MMDNGWVRlVmlSeWUyK0hKTUNPVzRNcHNY?=
 =?utf-8?B?R0FiWVpZU21ZVkltdjhCbWYrcTExbGtOUWt3a1dyNlg3RTl5Zkd1WS9jR1Zy?=
 =?utf-8?B?NnVBYXA1MnZ3dTNjSnVoTXpSWXFSc2kzVitkWlNLUHgvb2owdTBHQnJUc1F6?=
 =?utf-8?B?SENCNEFwSEJldnRmZ0w5MXFZN3FuYlpuTUsyRldLUlU1YUtFblprZ3EwUy9q?=
 =?utf-8?B?OVV3YmlQbEtzTHB3Y2wxRVlzbG1FNHhwUzZoU3Jid0c1WlRFdk1OTjYvN3pV?=
 =?utf-8?B?QjVVT1lNVEcwaG5jTThGU3Z0SXlER3F3R0lYbDZkK055RFZhYWoycVl5aTVF?=
 =?utf-8?B?ME9QcFdoeEFJbExmZTMxcHcra3R0aHg0VnpMMmJCSWpZeUtRNEZlOHJsQ1Qx?=
 =?utf-8?B?dDVVbFdjd3JMbHlQRjZDSHBreTJ4M3BsVEUwb1lwaGY0Zytxbkt4MjZ0QTE5?=
 =?utf-8?Q?rn4LjPy+nWaiDJZN0owIuvO/qBTwJcaYq4HCnKm?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6735
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a4abdd86-0b3c-4503-5540-08d93c9550c9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SAtR1rzYfWTmsdlEGioA7NP9gvmeoiTq+JRTATkVmTJkIWExQiq0OwfDKBUzbUw6sNx5YhYjRB4V5DbgjKB1HufxHtzYs/kVr0OkQtkCsod1LoPUCO/v4dDgoBi4hEDBaF+e3yXXUNPuzniW9d63Wg+5x4P88la7fKdZIVDBuhmc5hLwGHC6I02Rf0ZNNLv8ha3lQUnV6dR7Zvu26/OypIQrwVJlSsoCxxPH0CmOFhacVDkQbQVRBdHKpfDVho/SeXisnxy7rmPBnp+IfcGBw8941nBoTOKU/pFov0M4fl9UySns3mIthUwKEyrGLNG7N1ZbNk/e2SeBrxHcOUDCtjlfc/nswLs7J/ovWm7Eo+9ViOzhj10vmQm++pzkOOOO6uGI+Sydw/tqbbkJCm02FWpmxajXjaB4zXOVEo8rgUt4K1WhPULWfpvkcb08yJDLrPlht3J51GG+gVAqi4gK6/v20vrP+YF6J87mLOLO7+6kCr9UYN05/r6yDeVkC7SF2ZH3WYW/5Ql7y6c7s5zfxkF8Y763PW15CPASm7ujN/qW20nOPBl/BElGwNhQlkjpoUKngPjz6LEJsm18lHI82g0wjwezW1WExAn4tEyMENiA0j/ezsl3iwqg/D+6mXC4JVcLmKd3R0wRN4ApJp3/PbTpOnc+Np+gF06kCHtFPG8TC/zmMhDLP7sZk9YsmNzW1D0H085syAA4/VbIbjbWpw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(39850400004)(376002)(396003)(346002)(36840700001)(46966006)(6666004)(4326008)(6486002)(5660300002)(16526019)(82740400003)(186003)(36860700001)(8936002)(478600001)(956004)(81166007)(70206006)(6862004)(70586007)(356005)(26005)(6506007)(53546011)(336012)(36756003)(2616005)(316002)(2906002)(6512007)(86362001)(47076005)(54906003)(33656002)(82310400003)(83380400001)(44832011)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2021 13:37:45.7364
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ae41800-3dd9-4e41-b110-08d93c9568e7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5800



> On 24 Jun 2021, at 00:33, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> On Mon, 10 May 2021, Luca Fancellu wrote:
>> Modify docs/Makefile to call doxygen and generate sphinx
>> html documentation given the doxygen XML output.
>>=20
>> Modify docs/conf.py sphinx configuration file to setup
>> the breathe extension that works as bridge between
>> sphinx and doxygen.
>>=20
>> Add some files to the .gitignore to ignore some
>> generated files for doxygen.
>>=20
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>> ---
>> .gitignore    |  6 ++++++
>> docs/Makefile | 42 +++++++++++++++++++++++++++++++++++++++---
>> docs/conf.py  | 48 +++++++++++++++++++++++++++++++++++++++++++++---
>> 3 files changed, 90 insertions(+), 6 deletions(-)
>>=20
>> diff --git a/.gitignore b/.gitignore
>> index 1c2fa1530b..d271e0ce6a 100644
>> --- a/.gitignore
>> +++ b/.gitignore
>> @@ -58,6 +58,12 @@ docs/man7/
>> docs/man8/
>> docs/pdf/
>> docs/txt/
>> +docs/doxygen-output
>> +docs/sphinx
>> +docs/xen.doxyfile
>> +docs/xen.doxyfile.tmp
>> +docs/xen-doxygen/doxygen_include.h
>> +docs/xen-doxygen/doxygen_include.h.tmp
>> extras/mini-os*
>> install/*
>> stubdom/*-minios-config.mk
>> diff --git a/docs/Makefile b/docs/Makefile
>> index 8de1efb6f5..2f784c36ce 100644
>> --- a/docs/Makefile
>> +++ b/docs/Makefile
>> @@ -17,6 +17,18 @@ TXTSRC-y :=3D $(sort $(shell find misc -name '*.txt' =
-print))
>>=20
>> PANDOCSRC-y :=3D $(sort $(shell find designs/ features/ misc/ process/ s=
pecs/ \( -name '*.pandoc' -o -name '*.md' \) -print))
>>=20
>> +# Directory in which the doxygen documentation is created
>> +# This must be kept in sync with breathe_projects value in conf.py
>> +DOXYGEN_OUTPUT =3D doxygen-output
>> +
>> +# Doxygen input headers from xen-doxygen/doxy_input.list file
>> +DOXY_LIST_SOURCES !=3D cat "xen-doxygen/doxy_input.list"
>> +DOXY_LIST_SOURCES :=3D $(realpath $(addprefix $(XEN_ROOT)/,$(DOXY_LIST_=
SOURCES)))

Hi Stefano,

>=20
> I cannot find exactly who is populating doxy_input.list. I can see it is
> empty in patch #6. Does it get populated during the build?

doxy_input.list is the only file that should be modified by the developer w=
hen he/she wants to add documentation
for a new file to be parsed by Doxygen, in my patch about documenting grant=
_tables.h you can see I add
there the path =E2=80=9Cxen/include/public/grant_table.h"

>=20
>=20
>> +DOXY_DEPS :=3D xen.doxyfile \
>> +			 xen-doxygen/mainpage.md \
>> +			 xen-doxygen/doxygen_include.h
>> +
>> # Documentation targets
>> $(foreach i,$(MAN_SECTIONS), \
>>   $(eval DOC_MAN$(i) :=3D $(patsubst man/%.$(i),man$(i)/%.$(i), \
>> @@ -46,8 +58,28 @@ all: build
>> build: html txt pdf man-pages figs
>>=20
>> .PHONY: sphinx-html
>> -sphinx-html:
>> -	sphinx-build -b html . sphinx/html
>> +sphinx-html: $(DOXY_DEPS) $(DOXY_LIST_SOURCES)
>> +ifneq ($(SPHINXBUILD),no)
>=20
> This check on SPHINXBUILD is new, it wasn't there before. Why do we need
> it now? We are not really changing anything in regards to Sphinx, just
> adding Doxygen support. Or was it a mistake that it was missing even
> before this patch?

Yes this is new, I saw that we didn=E2=80=99t look if sphinx was installed =
in the system, so now we did

>=20
>=20
>> +	$(DOXYGEN) xen.doxyfile
>> +	XEN_ROOT=3D$(realpath $(XEN_ROOT)) $(SPHINXBUILD) -b html . sphinx/htm=
l
>> +else
>> +	@echo "Sphinx is not installed; skipping sphinx-html documentation."
>> +endif
>> +
>> +xen.doxyfile: xen.doxyfile.in xen-doxygen/doxy_input.list
>> +	@echo "Generating $@"
>> +	@sed -e "s,@XEN_BASE@,$(realpath $(XEN_ROOT)),g" $< \
>> +		| sed -e "s,@DOXY_OUT@,$(DOXYGEN_OUTPUT),g" > $@.tmp
>> +	@$(foreach inc,\
>> +		$(DOXY_LIST_SOURCES),\
>> +		echo "INPUT +=3D \"$(inc)\"" >> $@.tmp; \
>> +	)
>> +	mv $@.tmp $@
>> +
>> +xen-doxygen/doxygen_include.h: xen-doxygen/doxygen_include.h.in
>> +	@echo "Generating $@"
>> +	@sed -e "s,@XEN_BASE@,$(realpath $(XEN_ROOT)),g" $< > $@.tmp
>> +	@mv $@.tmp $@
>=20
> Is the absolute path required? If not, we can probably get rid of this
> generation step and simply have the relative path in
> xen-doxygen/doxygen_include.h. I think this could apply to
> xen.doxyfile.in above.

Unfortunately yes, the doxygen_include.h is a file that is included in ever=
y documented header before=20
starting the doxygen parser, since we don=E2=80=99t have all the headers in=
 one path, it is impossible to have here
a relative path that is good for every header in Xen.

>=20
>=20
>> .PHONY: html
>> html: $(DOC_HTML) html/index.html
>> @@ -71,7 +103,11 @@ clean: clean-man-pages
>> 	$(MAKE) -C figs clean
>> 	rm -rf .word_count *.aux *.dvi *.bbl *.blg *.glo *.idx *~
>> 	rm -rf *.ilg *.log *.ind *.toc *.bak *.tmp core
>> -	rm -rf html txt pdf sphinx/html
>> +	rm -rf html txt pdf sphinx $(DOXYGEN_OUTPUT)
>> +	rm -f xen.doxyfile
>> +	rm -f xen.doxyfile.tmp
>> +	rm -f xen-doxygen/doxygen_include.h
>> +	rm -f xen-doxygen/doxygen_include.h.tmp
>>=20
>> .PHONY: distclean
>> distclean: clean
>> diff --git a/docs/conf.py b/docs/conf.py
>> index 50e41501db..a48de42331 100644
>> --- a/docs/conf.py
>> +++ b/docs/conf.py
>> @@ -13,13 +13,17 @@
>> # add these directories to sys.path here. If the directory is relative t=
o the
>> # documentation root, use os.path.abspath to make it absolute, like show=
n here.
>> #
>> -# import os
>> -# import sys
>> +import os
>> +import sys
>> # sys.path.insert(0, os.path.abspath('.'))
>>=20
>>=20
>> # -- Project information -----------------------------------------------=
------
>>=20
>> +if "XEN_ROOT" not in os.environ:
>> +    sys.exit("$XEN_ROOT environment variable undefined.")
>> +XEN_ROOT =3D os.path.abspath(os.environ["XEN_ROOT"])
>> +
>> project =3D u'Xen'
>> copyright =3D u'2019, The Xen development community'
>> author =3D u'The Xen development community'
>> @@ -35,6 +39,7 @@ try:
>>             xen_subver =3D line.split(u"=3D")[1].strip()
>>         elif line.startswith(u"export XEN_EXTRAVERSION"):
>>             xen_extra =3D line.split(u"=3D")[1].split(u"$", 1)[0].strip(=
)
>> +
>=20
> spurious change?

I think I=E2=80=99ve intentionally added a new line to separate the code fr=
om the except: below,
but if it is a problem I can remove it

>=20
>=20
>> except:
>>     pass
>> finally:
>> @@ -44,6 +49,15 @@ finally:
>>     else:
>>         version =3D release =3D u"unknown version"
>>=20
>> +try:
>> +    xen_doxygen_output =3D None
>> +
>> +    for line in open(u"Makefile"):
>> +        if line.startswith(u"DOXYGEN_OUTPUT"):
>> +                xen_doxygen_output =3D line.split(u"=3D")[1].strip()
>> +except:
>> +    sys.exit("DOXYGEN_OUTPUT variable undefined.")
>=20
> This is a bit strange: isn't there a better way to get the
> DOXYGEN_OUTPUT variable than reading the Makefile?
>=20
> At that point I think it would be better to define DOXYGEN_OUTPUT a
> second time in conf.py. But maybe it could be passed as an evironmental
> variable?

Yes we could pass it as an environment variable as we do with XEN_ROOT,
I will fix it in a next release.

>=20
>=20
>> # -- General configuration ---------------------------------------------=
------
>>=20
>> # If your documentation needs a minimal Sphinx version, state it here.
>> @@ -53,7 +67,8 @@ needs_sphinx =3D '1.4'
>> # Add any Sphinx extension module names here, as strings. They can be
>> # extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
>> # ones.
>> -extensions =3D []
>> +# breathe -> extension that integrates doxygen xml output with sphinx
>> +extensions =3D ['breathe']
>>=20
>> # Add any paths that contain templates here, relative to this directory.
>> templates_path =3D ['_templates']
>> @@ -175,6 +190,33 @@ texinfo_documents =3D [
>>      'Miscellaneous'),
>> ]
>>=20
>> +# -- Options for Breathe extension ------------------------------------=
-------
>> +
>> +breathe_projects =3D {
>> +    "Xen": "{}/docs/{}/xml".format(XEN_ROOT, xen_doxygen_output)
>> +}
>> +breathe_default_project =3D "Xen"
>> +
>> +breathe_domain_by_extension =3D {
>> +    "h": "c",
>> +    "c": "c",
>> +}
>> +breathe_separate_member_pages =3D True
>> +breathe_show_enumvalue_initializer =3D True
>> +breathe_show_define_initializer =3D True
>> +
>> +# Qualifiers to a function are causing Sphihx/Breathe to warn about
>> +# Error when parsing function declaration and more.  This is a list
>> +# of strings that the parser additionally should accept as
>> +# attributes.
>> +cpp_id_attributes =3D [
>> +    '__syscall', '__deprecated', '__may_alias',
>> +    '__used', '__unused', '__weak',
>> +    '__DEPRECATED_MACRO', 'FUNC_NORETURN',
>> +    '__subsystem',
>=20
> Should we also have any of following:
>=20
> __packed
> __init
> __attribute__
> __aligned__
>=20
> in the list? In any case, we don't have to add them right now, we could
> add them later as we expand Doxygen coverage if they become needed.

Sure it is possible, I can add them now since I have to push a fix for this=
 patch
If you want.

Cheers,

Luca


>=20
>=20
>> +]
>> +c_id_attributes =3D cpp_id_attributes
>> +
>>=20
>> # -- Options for Epub output -------------------------------------------=
------


