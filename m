Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B7636E9E1
	for <lists+xen-devel@lfdr.de>; Thu, 29 Apr 2021 13:59:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119936.226768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc5Ka-00021J-E4; Thu, 29 Apr 2021 11:59:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119936.226768; Thu, 29 Apr 2021 11:59:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc5Ka-00020x-Ao; Thu, 29 Apr 2021 11:59:44 +0000
Received: by outflank-mailman (input) for mailman id 119936;
 Thu, 29 Apr 2021 11:59:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sKbL=J2=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1lc5KZ-00020s-1A
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 11:59:43 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.40]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8cd8d075-3415-4656-900f-301450f60256;
 Thu, 29 Apr 2021 11:59:40 +0000 (UTC)
Received: from MR1P264CA0026.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:2f::13)
 by AS8PR08MB6006.eurprd08.prod.outlook.com (2603:10a6:20b:29a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Thu, 29 Apr
 2021 11:59:37 +0000
Received: from VE1EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:501:2f:cafe::9f) by MR1P264CA0026.outlook.office365.com
 (2603:10a6:501:2f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.27 via Frontend
 Transport; Thu, 29 Apr 2021 11:59:37 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT016.mail.protection.outlook.com (10.152.18.115) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Thu, 29 Apr 2021 11:59:37 +0000
Received: ("Tessian outbound 13cdc29c30b8:v91");
 Thu, 29 Apr 2021 11:59:36 +0000
Received: from 35ac60e5a93c.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 28FA03B7-E263-41E9-95E4-24F821F0593F.1; 
 Thu, 29 Apr 2021 11:59:06 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 35ac60e5a93c.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 29 Apr 2021 11:59:06 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AM6PR08MB4708.eurprd08.prod.outlook.com (2603:10a6:20b:ce::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.25; Thu, 29 Apr
 2021 11:59:04 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::856e:d103:212c:8f50]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::856e:d103:212c:8f50%4]) with mapi id 15.20.4065.027; Thu, 29 Apr 2021
 11:59:04 +0000
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
X-Inumbo-ID: 8cd8d075-3415-4656-900f-301450f60256
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s2khhl9pdasRffxjkbVK8Pm3ROh/+0CR90sZoRfSWaI=;
 b=V/a5qdiKUS3x0oww4N5ZqLm2rJ/LhQuQJulmQficGIYLXI+/mhQDlGxYIJK+UjIftKvOcMC3ODNTsPgk5b4wlxZpta+jD5x91qCBdw1b54nAyfJAlFjrc/suNK3FdMcXHoa/g44iOn/YNV7kPEywa86AmbUUDnraMf3cFaZiHG0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4a8b3ef51c1fc583
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=odgsXFju7T/hhNGSUvC7DJf/Jpmu4KizK7j9u1/ieYMxiymJvNg7Vt8+2at7yQZe7A9caftsQbOGR9a2Ex3dP0QQ6a2qjAEqHwtvdGubn8TILMyKVRYGLsU7BG11gl7hbfiypUu3cd1i+kfw9VSHBAusLMO+x2Wv+kqu89gvmQdS7DzmaxV8AlJzPQ+6WqD3siFsmhRvhpeza3VYuU1g5n9W9xi9SM/MHWXwIZDEMdSiqaHEVbBgJzrTdXrMlvta5KQoqUKT74Y1vpmzMEMdCfNOelxERSfc0QwzWjECr3pSxmc1FonIGbPxgBNmU/b0cG/HROFr9SFv78rmOBYOeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s2khhl9pdasRffxjkbVK8Pm3ROh/+0CR90sZoRfSWaI=;
 b=fABBi3vLAYjaV34FbPa4YEdLE/PK+rlhu2B/b4rvjJq6eXeYK3XseyiKyiRw1IUkgQNlO6gy0AuCzNd5clRn7DzGb6eEWquZgz6eetWUJHGONtPGnE6GOV8769TlKV/s9nFZG0ohT3SvPDMjK0oJR1id3WUqUbWlDSBQqJxMRzdR2m8bl8SBW8ksJwGLmtDlejnliBzpFvf2TrOQPNDUJ89L0hiUbqsfUq9E5eEw4H5W8KUShAGg1GGgIHirTdvGnPZEnHzV9Tv3ErUH2SPraBqjxmal8pM3usoZafY8Ss/X3K4qGbwtR/PwYQ0epdBVRCN6yTBJSIBMDTVCLO5x5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s2khhl9pdasRffxjkbVK8Pm3ROh/+0CR90sZoRfSWaI=;
 b=V/a5qdiKUS3x0oww4N5ZqLm2rJ/LhQuQJulmQficGIYLXI+/mhQDlGxYIJK+UjIftKvOcMC3ODNTsPgk5b4wlxZpta+jD5x91qCBdw1b54nAyfJAlFjrc/suNK3FdMcXHoa/g44iOn/YNV7kPEywa86AmbUUDnraMf3cFaZiHG0=
From: Rahul Singh <Rahul.Singh@arm.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Jan Beulich <jbeulich@suse.com>, Paul Durrant
	<paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v3 3/3] xen/pci: Refactor MSI code that implements MSI
 functionality within XEN
Thread-Topic: [PATCH v3 3/3] xen/pci: Refactor MSI code that implements MSI
 functionality within XEN
Thread-Index: AQHXOrh4cv5EbJqd3U+gSr1g4kEjParJx4aAgAGhIYA=
Date: Thu, 29 Apr 2021 11:59:04 +0000
Message-ID: <11500C08-219E-4638-AD4A-9DADD20910ED@arm.com>
References: <cover.1619453100.git.rahul.singh@arm.com>
 <7b6651f10922571a10685dc7652fbce03b6b6e51.1619453100.git.rahul.singh@arm.com>
 <YIlBnQO+iuFFx2XO@Air-de-Roger>
In-Reply-To: <YIlBnQO+iuFFx2XO@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 6f827aa0-beb4-4bfe-7fed-08d90b064325
x-ms-traffictypediagnostic: AM6PR08MB4708:|AS8PR08MB6006:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB6006F28001D184C09B309288FC5F9@AS8PR08MB6006.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 RHEsdkOfiHhumD7WyHsQnsp+iOEtuMlNe9q5akafmRtH/fJ5YvYX4qtDwQOP0DgnGynQv+iNim7kg/B/f9nzak/Ha94a7rvPFugj8KdqW05OhMc0Vm+6ffiVfP4g6hvvMHBGLl7siAs3XSLTuRN3a5qeKyO0SRcYiL157dVLQJrq+gBEjor5+KbNH9Uu1hlG4jeKSm6/S3vcuCg7UdwbYmWWLYRzoL7cF7P+Wyv/hBn7JCPmQn3+WEUOEdiqFtD+qutNEaTsAj8HygEE77efjYxHFc6uhgQZqWbrIJ+NkDrDZvRsOfsUT4WjtRMqClWvUl2Yio+JUa0y0ivzEOjIpum5vXotj/n5YK1HAQACIgVIy2DzOhVCZNRISJHYzqWndRuoTvPleT/ze1aJj4kDAv77ZwpR08xf2PXuS7Doqo6+HaDt1/r5Q8cFvJLKPfzCfD5V5OL+dM8Y3Pc7GUCP0t1gdO2VfVWoSiIZK/umGzdrxG1sHcvN7NULsMBFU4lC2wGcsAuhA5gBlrv6IOlUlaDYh6wVeebetqLJDIM8ogqTjqCWFVkS+9Jkytody6PAswqQ3/GWmBen++sAW+HtnhaiPhWWoqR7YbvYIM+GuP8zeYXXwb0Dq3EaF0OTd4shOt+DcKh/La2xjEHOrc+/ZKH6qAjIx5+9fig5g+iOSc0=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(376002)(346002)(366004)(136003)(71200400001)(2616005)(83380400001)(8936002)(54906003)(2906002)(4326008)(36756003)(6486002)(6512007)(6506007)(38100700002)(53546011)(6916009)(7416002)(33656002)(186003)(66946007)(5660300002)(86362001)(478600001)(64756008)(91956017)(316002)(66446008)(66556008)(66476007)(26005)(76116006)(122000001)(8676002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?ZUtMejlyaVRUSVpMNEJ4RDk4QkkzSk9MWnAwV2s3cm9LS2pFaEE0VE93S1pR?=
 =?utf-8?B?YnFCVWREazNtdm9BaWNubWYveVFyTm5kQk9uRW9hdVp1cUZQSjhwYlBieGJH?=
 =?utf-8?B?RWYydWUzTzNKSXQwdWMvWEZxUmtuSTBIdzZWRWZqMSt0bm8yMUFPVHN1M3hB?=
 =?utf-8?B?OEVOUkI4b24ydFFiMkFmS29nVForenJQTmtIWS8zT2VqSVBkN2Yrei9DY290?=
 =?utf-8?B?UjVrdVRsOU00UHl1OFhnMHQyUHlGMEJER3hMQW1KNnpzbGJMWXAwWFlkbEwv?=
 =?utf-8?B?cGc1ZFpxazkvU1RXeXcyUWR6L3F5cEhLYk1Hbkt6c210aWhKcVNFd1NEdmF1?=
 =?utf-8?B?ZzIySWgxc1I5ck12UEJzU1prdkhQSUtoVzRHOW5hZnViRkZHaGlwNkRPK1pC?=
 =?utf-8?B?RDFTMzJORWNuUVlTNmFnbmZMckxSMUVHc29hV1VXcVdIbjBiRnpmYzJxM2Zz?=
 =?utf-8?B?cS9ZZDZDNUMxYnJMVFJSRjd0WXA5Sk9QRUtOU1B0ZHBPdGZyTWNSKzlKQ3ND?=
 =?utf-8?B?UTlOazMyRlpERUZXSTNHcVpVN2s2MkN5bTR6a2VPYWNGUW0xKy9PZmtvSkVh?=
 =?utf-8?B?N3pyaVZHRkpFU3BzN2lRb2phNzZ3VDBsSVZMOXBiOXExZWZLYWpLYjBTNVRm?=
 =?utf-8?B?OCtOejV5VktlbnlyaWExWEcxVWVhbjJHNHFXeWQ4cnRMOHNQTHZPVlF1Q2NT?=
 =?utf-8?B?RFQ4RXdxdld1RHplRGZZYmg2RTFVTWcrK3hjd3ZURGtiT0drODRDUUpNNWlv?=
 =?utf-8?B?b256S0cvdUJrNVZIMlFsYXRVSjh2ZkhQT1FjSG5hQVdIbkVjY01SUTVzSHND?=
 =?utf-8?B?TTVQUHk2QXlUNVVIOGtDV2JUWVdTV1A5MGZHMGtFcFhCRFUwOXFJSHU2SWtL?=
 =?utf-8?B?ajFQQXlaQmFFU0JvZ2cveFlUcjBWeWZBVjNjZkJiVWl3SnJLQVFDWXB3QS90?=
 =?utf-8?B?UE5KZU5UcytxRmZSSXpFSG40d0c5dGptcFJsRWM4ZDMzVlI2MEdXYlRGcTdM?=
 =?utf-8?B?SllaV01Nd2FMYStjQ0V5VU9uSFM4VXhQeTl6OVRwTkpVb2hNUzMrRjJzc2Mv?=
 =?utf-8?B?WFBJaG5zZXZXY0N6M202VW1icE1CSDNmVlZXVnNyeGhLcCtWM1lqU0Fzam96?=
 =?utf-8?B?a3Z0ZTFFWnEvSWRUM0tnd2tZaDdMMklOR3dEYmJUczJlRXNQaDlBcFBDOTZP?=
 =?utf-8?B?R3FtRHRVSURDaXZ3dkxsQVZ3a1VJRVFrS05BSzlQZXA5Mk1oWWhmTkwvejlY?=
 =?utf-8?B?eU1GN2N3RFNlL3VMU05kWndhb3pJbTAxRHI0SlUycDdsTUhzbGp5ZVR3dXJX?=
 =?utf-8?B?KzErL0RYWG1iUWQvMERZQkR5MzlISDhHbHBwNytEajVSRHIvR1lCT0luQ29I?=
 =?utf-8?B?TTVYK3ZYMWppV2VMRDUwWm9yOTNXQ0xVaWF1S29EeDU0Ym5nRXFZcm9oQ1do?=
 =?utf-8?B?bGZMOFRzMzBFSHlLeTNUQnVsa3RPMjdRQlVMSTFmVU93UDl3SnExMmUxSTh5?=
 =?utf-8?B?bU5Kb1NDWnV6M0VKTm5uQ1RDK2tOUU1icDZBUGl4R21Ud0ZXKzc3MTdrUS8r?=
 =?utf-8?B?c1Q0czRNbkl4Y0NLRHRHdWFxdnMzOEpoaVNBMHFmVWZHdjl3cFVSMlBRQW9o?=
 =?utf-8?B?SEpvNHIyTE5XNWM2U1VQNWhZSktMTkxSUlhGeW5HamQvUzcwNVBWNVhvRjFF?=
 =?utf-8?B?MFNUYzA0VGpMMDFETnhoVHg2dUV5MU95OExZNUlMcmZuT0QxVzBTU0tSWFhE?=
 =?utf-8?Q?GjTrKsBotzwrfLfhBwLuQo4cYOKLk1EvNY1ZOza?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0B330B871D7D0F4F8A19739780CE9566@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4708
Original-Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e17da56a-4c93-4ba4-5a38-08d90b062f62
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OKeAG+BqIiMw5+2leahvkgozgVzO5j/dL09R53NZFjvnopzD0BtbUP7RjiVT3zkulflCrSm+EItW5+yAywRNqPV8vlPNsXUoUjTPsQaq+ZDN8dmdeRGjI28kSiUbJyIBK0wuM3VSZucI/XpJVB/Cn3PdlswExwEszAnZSA+2V0IrXROB/3Ni9q4oGnZhByI47k1jV1zvU6sV5VHlTmrVauKCMaOjCYiRIfHXUloSOUyhJ49k2uDeDgRcVN48L2EfAw4SjFMVYQQ9s5feGPpkM7mildYUZbSH82qmI8twyYtmwFrsKDUqyc4U0RRT5xqEZ2ASHr7cY9vOQRs+XCo2wKhp9yHdGZPuiatT3bp5l9cz1uUALk2tlxC8QqiJyxHKCi42OjI2pooBj54ZuRCymhzssnknXb2NKbHfobJ7a1Ok/flwTS+PRZUm56kcgLuGArpyWylI4cUMMiePGAGMyVqNulZy4DmLC44cYMu0jqrA8395Dbc+gaT7BbCLcpdhRTde6PoZhwqGZBevB6zCadDQO1Gdyg2q6udg3MQ4/iQHO6kT+gTb2cYDdaJEx9bfpLJGuE+3z7zaVLezzhBj8c3L7uys4SFHkLsK/SbxMuqa72sEN9BJzoTGPlyfWwJX33J4TkJYAECOgVMlhpfiAhtIJg6RAwl/slTLTFGGcUQOZTaCEmA1sU8s12gfQzak
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(346002)(396003)(136003)(36840700001)(46966006)(36756003)(36860700001)(83380400001)(54906003)(86362001)(478600001)(2906002)(4326008)(33656002)(53546011)(336012)(6862004)(186003)(6512007)(316002)(5660300002)(8676002)(8936002)(70206006)(70586007)(6506007)(6486002)(356005)(82740400003)(26005)(34020700004)(2616005)(47076005)(81166007)(82310400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2021 11:59:37.2186
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f827aa0-beb4-4bfe-7fed-08d90b064325
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6006

SGkgUm9nZXIsDQoNCj4gT24gMjggQXByIDIwMjEsIGF0IDEyOjA2IHBtLCBSb2dlciBQYXUgTW9u
bsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBNb24sIEFwciAyNiwg
MjAyMSBhdCAwNToyMToyN1BNICswMTAwLCBSYWh1bCBTaW5naCB3cm90ZToNCj4+IE1TSSBjb2Rl
IHRoYXQgaW1wbGVtZW50cyBNU0kgZnVuY3Rpb25hbGl0eSB0byBzdXBwb3J0IE1TSSB3aXRoaW4g
WEVOIGlzDQo+PiBub3QgdXNhYmxlIG9uIEFSTS4gTW92ZSB0aGUgY29kZSB1bmRlciBDT05GSUdf
UENJX01TSV9JTlRFUkNFUFQgZmxhZyB0bw0KPj4gZ2F0ZSB0aGUgY29kZSBmb3IgQVJNLg0KPj4g
DQo+PiBDdXJyZW50bHksIHdlIGhhdmUgbm8gaWRlYSBob3cgTVNJIGZ1bmN0aW9uYWxpdHkgd2ls
bCBiZSBzdXBwb3J0ZWQgZm9yDQo+PiBvdGhlciBhcmNoaXRlY3R1cmUgdGhlcmVmb3JlIHdlIGhh
dmUgZGVjaWRlZCB0byBtb3ZlIHRoZSBjb2RlIHVuZGVyDQo+PiBDT05GSUdfUENJX01TSV9JTlRF
UkNFUFQuIFdlIGtub3cgdGhpcyBpcyBub3QgdGhlIHJpZ2h0IGZsYWcgdG8gZ2F0ZSB0aGUNCj4+
IGNvZGUgYnV0IHRvIGF2b2lkIGFuIGV4dHJhIGZsYWcgd2UgZGVjaWRlZCB0byB1c2UgdGhpcy4N
Cj4+IA0KPj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50ZW5kZWQuDQo+PiANCj4+IFNpZ25lZC1v
ZmYtYnk6IFJhaHVsIFNpbmdoIDxyYWh1bC5zaW5naEBhcm0uY29tPg0KPiANCj4gSSB0aGluayB0
aGlzIGlzIGZpbmUsIGFzIHdlIGRvbid0IHJlYWxseSB3YW50IHRvIGFkZCBhbm90aGVyIEtjb25m
aWcNCj4gb3B0aW9uIChpZTogQ09ORklHX1BDSV9NU0kpIGZvciBqdXN0IHRoZSBub24gZXhwbGlj
aXRseSBpbnRlcmNlcHQgTVNJDQo+IGNvZGUuDQo+IA0KPiBSZXZpZXdlZC1ieTogUm9nZXIgUGF1
IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+IA0KDQpUaGFua3MuDQoNCj4gU29tZSBu
aXRzIGJlbG93Li4uDQo+IA0KPj4gLS0tDQo+PiBDaGFuZ2VzIHNpbmNlIHYyOg0KPj4gLSBUaGlz
IHBhdGNoIGlzIGFkZGVkIGluIHRoaXMgdmVyc2lvbi4NCj4+IC0tLQ0KPj4geGVuL2RyaXZlcnMv
cGFzc3Rocm91Z2gvbXNpLWludGVyY2VwdC5jIHwgNDEgKysrKysrKysrKysrKysrKysrKysrKysr
Kw0KPj4geGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMgICAgICAgICAgIHwgMzQgKysrKy0t
LS0tLS0tLS0tLS0tLS0NCj4+IHhlbi9pbmNsdWRlL3hlbi9tc2ktaW50ZXJjZXB0LmggICAgICAg
ICB8ICA3ICsrKysrDQo+PiB4ZW4vaW5jbHVkZS94ZW4vcGNpLmggICAgICAgICAgICAgICAgICAg
fCAxMSArKysrLS0tDQo+PiA0IGZpbGVzIGNoYW5nZWQsIDYxIGluc2VydGlvbnMoKyksIDMyIGRl
bGV0aW9ucygtKQ0KPj4gDQo+PiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gv
bXNpLWludGVyY2VwdC5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvbXNpLWludGVyY2VwdC5j
DQo+PiBpbmRleCAxZWRhZTZkNGU4Li4zM2FiNzE1MTRkIDEwMDY0NA0KPj4gLS0tIGEveGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gvbXNpLWludGVyY2VwdC5jDQo+PiArKysgYi94ZW4vZHJpdmVycy9w
YXNzdGhyb3VnaC9tc2ktaW50ZXJjZXB0LmMNCj4+IEBAIC0xOSw2ICsxOSw0NyBAQA0KPj4gI2lu
Y2x1ZGUgPGFzbS9tc2kuaD4NCj4+ICNpbmNsdWRlIDxhc20vaHZtL2lvLmg+DQo+PiANCj4+ICtp
bnQgcGRldl9tc2lfaW5pdChzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+ICt7DQo+PiArICAgIHVu
c2lnbmVkIGludCBwb3M7DQo+PiArDQo+PiArICAgIElOSVRfTElTVF9IRUFEKCZwZGV2LT5tc2lf
bGlzdCk7DQo+PiArDQo+PiArICAgIHBvcyA9IHBjaV9maW5kX2NhcF9vZmZzZXQocGRldi0+c2Vn
LCBwZGV2LT5idXMsIFBDSV9TTE9UKHBkZXYtPmRldmZuKSwNCj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBQQ0lfRlVOQyhwZGV2LT5kZXZmbiksIFBDSV9DQVBfSURfTVNJKTsNCj4+
ICsgICAgaWYgKCBwb3MgKQ0KPj4gKyAgICB7DQo+PiArICAgICAgICB1aW50MTZfdCBjdHJsID0g
cGNpX2NvbmZfcmVhZDE2KHBkZXYtPnNiZGYsIG1zaV9jb250cm9sX3JlZyhwb3MpKTsNCj4+ICsN
Cj4+ICsgICAgICAgIHBkZXYtPm1zaV9tYXh2ZWMgPSBtdWx0aV9tc2lfY2FwYWJsZShjdHJsKTsN
Cj4+ICsgICAgfQ0KPj4gKw0KPj4gKyAgICBwb3MgPSBwY2lfZmluZF9jYXBfb2Zmc2V0KHBkZXYt
PnNlZywgcGRldi0+YnVzLCBQQ0lfU0xPVChwZGV2LT5kZXZmbiksDQo+PiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgUENJX0ZVTkMocGRldi0+ZGV2Zm4pLCBQQ0lfQ0FQX0lEX01TSVgp
Ow0KPj4gKyAgICBpZiAoIHBvcyApDQo+PiArICAgIHsNCj4+ICsgICAgICAgIHN0cnVjdCBhcmNo
X21zaXggKm1zaXggPSB4emFsbG9jKHN0cnVjdCBhcmNoX21zaXgpOw0KPj4gKyAgICAgICAgdWlu
dDE2X3QgY3RybDsNCj4+ICsNCj4+ICsgICAgICAgIGlmICggIW1zaXggKQ0KPj4gKyAgICAgICAg
ICAgIHJldHVybiAtRU5PTUVNOw0KPj4gKw0KPj4gKyAgICAgICAgc3Bpbl9sb2NrX2luaXQoJm1z
aXgtPnRhYmxlX2xvY2spOw0KPj4gKw0KPj4gKyAgICAgICAgY3RybCA9IHBjaV9jb25mX3JlYWQx
NihwZGV2LT5zYmRmLCBtc2l4X2NvbnRyb2xfcmVnKHBvcykpOw0KPj4gKyAgICAgICAgbXNpeC0+
bnJfZW50cmllcyA9IG1zaXhfdGFibGVfc2l6ZShjdHJsKTsNCj4+ICsNCj4+ICsgICAgICAgIHBk
ZXYtPm1zaXggPSBtc2l4Ow0KPj4gKyAgICB9DQo+PiArDQo+PiArICAgIHJldHVybiAwOw0KPj4g
K30NCj4+ICsNCj4+ICt2b2lkIHBkZXZfbXNpX2RlaW5pdChzdHJ1Y3QgcGNpX2RldiAqcGRldikN
Cj4+ICt7DQo+PiArICAgIFhGUkVFKHBkZXYtPm1zaXgpOw0KPj4gK30NCj4+ICsNCj4+IGludCBw
ZGV2X21zaXhfYXNzaWduKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0K
Pj4gew0KPj4gICAgIGludCByYzsNCj4+IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhy
b3VnaC9wY2kuYyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jDQo+PiBpbmRleCAyOThi
ZTIxYjViLi5iMWUzYzcxMWFkIDEwMDY0NA0KPj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91
Z2gvcGNpLmMNCj4+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jDQo+PiBAQCAt
MzE0LDYgKzMxNCw3IEBAIHN0YXRpYyBzdHJ1Y3QgcGNpX2RldiAqYWxsb2NfcGRldihzdHJ1Y3Qg
cGNpX3NlZyAqcHNlZywgdTggYnVzLCB1OCBkZXZmbikNCj4+IHsNCj4+ICAgICBzdHJ1Y3QgcGNp
X2RldiAqcGRldjsNCj4+ICAgICB1bnNpZ25lZCBpbnQgcG9zOw0KPj4gKyAgICBpbnQgcmM7DQo+
PiANCj4+ICAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5ICggcGRldiwgJnBzZWctPmFsbGRldnNfbGlz
dCwgYWxsZGV2c19saXN0ICkNCj4+ICAgICAgICAgaWYgKCBwZGV2LT5idXMgPT0gYnVzICYmIHBk
ZXYtPmRldmZuID09IGRldmZuICkNCj4+IEBAIC0zMjcsMzUgKzMyOCwxMiBAQCBzdGF0aWMgc3Ry
dWN0IHBjaV9kZXYgKmFsbG9jX3BkZXYoc3RydWN0IHBjaV9zZWcgKnBzZWcsIHU4IGJ1cywgdTgg
ZGV2Zm4pDQo+PiAgICAgKigodTgqKSAmcGRldi0+YnVzKSA9IGJ1czsNCj4+ICAgICAqKCh1OCop
ICZwZGV2LT5kZXZmbikgPSBkZXZmbjsNCj4+ICAgICBwZGV2LT5kb21haW4gPSBOVUxMOw0KPj4g
LSAgICBJTklUX0xJU1RfSEVBRCgmcGRldi0+bXNpX2xpc3QpOw0KPj4gLQ0KPj4gLSAgICBwb3Mg
PSBwY2lfZmluZF9jYXBfb2Zmc2V0KHBzZWctPm5yLCBidXMsIFBDSV9TTE9UKGRldmZuKSwgUENJ
X0ZVTkMoZGV2Zm4pLA0KPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBDSV9DQVBf
SURfTVNJKTsNCj4+IC0gICAgaWYgKCBwb3MgKQ0KPj4gLSAgICB7DQo+PiAtICAgICAgICB1aW50
MTZfdCBjdHJsID0gcGNpX2NvbmZfcmVhZDE2KHBkZXYtPnNiZGYsIG1zaV9jb250cm9sX3JlZyhw
b3MpKTsNCj4+IA0KPj4gLSAgICAgICAgcGRldi0+bXNpX21heHZlYyA9IG11bHRpX21zaV9jYXBh
YmxlKGN0cmwpOw0KPj4gLSAgICB9DQo+PiAtDQo+PiAtICAgIHBvcyA9IHBjaV9maW5kX2NhcF9v
ZmZzZXQocHNlZy0+bnIsIGJ1cywgUENJX1NMT1QoZGV2Zm4pLCBQQ0lfRlVOQyhkZXZmbiksDQo+
PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUENJX0NBUF9JRF9NU0lYKTsNCj4+IC0g
ICAgaWYgKCBwb3MgKQ0KPj4gKyAgICByYyA9IHBkZXZfbXNpX2luaXQocGRldik7DQo+PiArICAg
IGlmICggcmMgKQ0KPj4gICAgIHsNCj4+IC0gICAgICAgIHN0cnVjdCBhcmNoX21zaXggKm1zaXgg
PSB4emFsbG9jKHN0cnVjdCBhcmNoX21zaXgpOw0KPj4gLSAgICAgICAgdWludDE2X3QgY3RybDsN
Cj4+IC0NCj4+IC0gICAgICAgIGlmICggIW1zaXggKQ0KPj4gLSAgICAgICAgew0KPj4gLSAgICAg
ICAgICAgIHhmcmVlKHBkZXYpOw0KPj4gLSAgICAgICAgICAgIHJldHVybiBOVUxMOw0KPj4gLSAg
ICAgICAgfQ0KPj4gLSAgICAgICAgc3Bpbl9sb2NrX2luaXQoJm1zaXgtPnRhYmxlX2xvY2spOw0K
Pj4gLQ0KPj4gLSAgICAgICAgY3RybCA9IHBjaV9jb25mX3JlYWQxNihwZGV2LT5zYmRmLCBtc2l4
X2NvbnRyb2xfcmVnKHBvcykpOw0KPj4gLSAgICAgICAgbXNpeC0+bnJfZW50cmllcyA9IG1zaXhf
dGFibGVfc2l6ZShjdHJsKTsNCj4+IC0NCj4+IC0gICAgICAgIHBkZXYtPm1zaXggPSBtc2l4Ow0K
Pj4gKyAgICAgICAgWEZSRUUocGRldik7DQo+IA0KPiBUaGVyZSdzIG5vIG5lZWQgdG8gdXNlIFhG
UkVFIGhlcmUsIHBsYWluIHhmcmVlIGlzIGZpbmUgc2luY2UgcGRldiBpcyBhDQo+IGxvY2FsIHZh
cmlhYmxlIHNvIG1ha2VzIG5vIHNlbnNlIHRvIGFzc2lnbiB0byBOVUxMIGJlZm9yZSByZXR1cm5p
bmcuDQoNCk9rLiBJIHdpbGwgY2hhbmdlIGl0IHRvIHhmcmVlIGluIG5leHQgdmVyc2lvbi4NCg0K
PiANCj4+ICsgICAgICAgIHJldHVybiBOVUxMOw0KPj4gICAgIH0NCj4+IA0KPj4gICAgIGxpc3Rf
YWRkKCZwZGV2LT5hbGxkZXZzX2xpc3QsICZwc2VnLT5hbGxkZXZzX2xpc3QpOw0KPj4gQEAgLTQ0
OSw3ICs0MjcsNyBAQCBzdGF0aWMgdm9pZCBmcmVlX3BkZXYoc3RydWN0IHBjaV9zZWcgKnBzZWcs
IHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4gICAgIH0NCj4+IA0KPj4gICAgIGxpc3RfZGVsKCZw
ZGV2LT5hbGxkZXZzX2xpc3QpOw0KPj4gLSAgICB4ZnJlZShwZGV2LT5tc2l4KTsNCj4+ICsgICAg
cGRldl9tc2lfZGVpbml0KHBkZXYpOw0KPj4gICAgIHhmcmVlKHBkZXYpOw0KPj4gfQ0KPj4gDQo+
PiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL21zaS1pbnRlcmNlcHQuaCBiL3hlbi9pbmNs
dWRlL3hlbi9tc2ktaW50ZXJjZXB0LmgNCj4+IGluZGV4IDc3YzEwNWUyODYuLjM4ZmY3YTA5ZTEg
MTAwNjQ0DQo+PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vbXNpLWludGVyY2VwdC5oDQo+PiArKysg
Yi94ZW4vaW5jbHVkZS94ZW4vbXNpLWludGVyY2VwdC5oDQo+PiBAQCAtMjEsMTYgKzIxLDIzIEBA
DQo+PiANCj4+ICNpbmNsdWRlIDxhc20vbXNpLmg+DQo+PiANCj4+ICtpbnQgcGRldl9tc2lfaW5p
dChzdHJ1Y3QgcGNpX2RldiAqcGRldik7DQo+PiArdm9pZCBwZGV2X21zaV9kZWluaXQoc3RydWN0
IHBjaV9kZXYgKnBkZXYpOw0KPj4gaW50IHBkZXZfbXNpeF9hc3NpZ24oc3RydWN0IGRvbWFpbiAq
ZCwgc3RydWN0IHBjaV9kZXYgKnBkZXYpOw0KPj4gdm9pZCBwZGV2X2R1bXBfbXNpKGNvbnN0IHN0
cnVjdCBwY2lfZGV2ICpwZGV2KTsNCj4+IA0KPj4gI2Vsc2UgLyogIUNPTkZJR19QQ0lfTVNJX0lO
VEVSQ0VQVCAqLw0KPj4gK3N0YXRpYyBpbmxpbmUgaW50IHBkZXZfbXNpX2luaXQoc3RydWN0IHBj
aV9kZXYgKnBkZXYpDQo+PiArew0KPj4gKyAgICByZXR1cm4gMDsNCj4+ICt9DQo+PiANCj4+IHN0
YXRpYyBpbmxpbmUgaW50IHBkZXZfbXNpeF9hc3NpZ24oc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0
IHBjaV9kZXYgKnBkZXYpDQo+PiB7DQo+PiAgICAgcmV0dXJuIDA7DQo+PiB9DQo+PiANCj4+ICtz
dGF0aWMgaW5saW5lIHZvaWQgcGRldl9tc2lfZGVpbml0KHN0cnVjdCBwY2lfZGV2ICpwZGV2KSB7
fQ0KPj4gc3RhdGljIGlubGluZSB2b2lkIHBkZXZfZHVtcF9tc2koY29uc3Qgc3RydWN0IHBjaV9k
ZXYgKnBkZXYpIHt9DQo+PiBzdGF0aWMgaW5saW5lIHZvaWQgcGNpX2NsZWFudXBfbXNpKHN0cnVj
dCBwY2lfZGV2ICpwZGV2KSB7fQ0KPj4gDQo+PiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVu
L3BjaS5oIGIveGVuL2luY2x1ZGUveGVuL3BjaS5oDQo+PiBpbmRleCA4ZTNkNGQ5NDU0Li5mNWI1
NzI3MGJlIDEwMDY0NA0KPj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL3BjaS5oDQo+PiArKysgYi94
ZW4vaW5jbHVkZS94ZW4vcGNpLmgNCj4+IEBAIC03OSwxMCArNzksNiBAQCBzdHJ1Y3QgcGNpX2Rl
diB7DQo+PiAgICAgc3RydWN0IGxpc3RfaGVhZCBhbGxkZXZzX2xpc3Q7DQo+PiAgICAgc3RydWN0
IGxpc3RfaGVhZCBkb21haW5fbGlzdDsNCj4+IA0KPj4gLSAgICBzdHJ1Y3QgbGlzdF9oZWFkIG1z
aV9saXN0Ow0KPj4gLQ0KPj4gLSAgICBzdHJ1Y3QgYXJjaF9tc2l4ICptc2l4Ow0KPj4gLQ0KPj4g
ICAgIHN0cnVjdCBkb21haW4gKmRvbWFpbjsNCj4+IA0KPj4gICAgIGNvbnN0IHVuaW9uIHsNCj4+
IEBAIC05NCw3ICs5MCwxNCBAQCBzdHJ1Y3QgcGNpX2RldiB7DQo+PiAgICAgICAgIHBjaV9zYmRm
X3Qgc2JkZjsNCj4+ICAgICB9Ow0KPj4gDQo+PiArI2lmZGVmIENPTkZJR19QQ0lfTVNJX0lOVEVS
Q0VQVA0KPj4gKyAgICBzdHJ1Y3QgbGlzdF9oZWFkIG1zaV9saXN0Ow0KPj4gKw0KPj4gKyAgICBz
dHJ1Y3QgYXJjaF9tc2l4ICptc2l4Ow0KPj4gKw0KPj4gICAgIHVpbnQ4X3QgbXNpX21heHZlYzsN
Cj4+ICsjZW5kaWYNCj4gDQo+IFRoaXMgc2VlbXMgdG8gaW50cm9kdWNlIHNvbWUgcGFkZGluZyBi
ZXR3ZWVuIHRoZSBzYmRmIGFuZCB0aGUgbXNpX2xpc3QNCj4gZmllbGQuIEkgZ3Vlc3MgdGhhdCdz
IGJldHRlciB0aGFuIGhhdmluZyB0d28gZGlmZmVyZW50DQo+IENPTkZJR19QQ0lfTVNJX0lOVEVS
Q0VQVCBndWFyZGVkIHJlZ2lvbnM/DQoNClllcy4gVGhhdOKAmXMgd2h5IEkgbW92ZSBhbGwgdGhl
IGZpZWxkcyByZWxhdGVkIHRvIE1TSSB0byBvbmUgcGxhY2UgdG8gYXZvaWQgdGhlIA0KZXh0cmEg
Q09ORklHX1BDSV9NU0lfSU5URVJDRVBUIGluc3RhbmNlLg0KDQpSZWdhcmRzLA0KUmFodWwNCj4g
DQo+IFRoYW5rcywgUm9nZXIuDQoNCg==

