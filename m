Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D973577622F
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 16:16:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581157.909731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTjyX-0004mu-M0; Wed, 09 Aug 2023 14:15:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581157.909731; Wed, 09 Aug 2023 14:15:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTjyX-0004i0-Iw; Wed, 09 Aug 2023 14:15:49 +0000
Received: by outflank-mailman (input) for mailman id 581157;
 Wed, 09 Aug 2023 14:15:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kmRr=D2=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qTjyW-0004co-1P
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 14:15:48 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20603.outbound.protection.outlook.com
 [2a01:111:f400:fe13::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b0659eb-36bf-11ee-8613-37d641c3527e;
 Wed, 09 Aug 2023 16:15:45 +0200 (CEST)
Received: from AS9PR07CA0001.eurprd07.prod.outlook.com (2603:10a6:20b:46c::11)
 by GVXPR08MB7823.eurprd08.prod.outlook.com (2603:10a6:150:2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Wed, 9 Aug
 2023 14:15:30 +0000
Received: from AM7EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46c:cafe::be) by AS9PR07CA0001.outlook.office365.com
 (2603:10a6:20b:46c::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.16 via Frontend
 Transport; Wed, 9 Aug 2023 14:15:30 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT053.mail.protection.outlook.com (100.127.140.202) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6678.18 via Frontend Transport; Wed, 9 Aug 2023 14:15:30 +0000
Received: ("Tessian outbound d7adc65d10b4:v145");
 Wed, 09 Aug 2023 14:15:30 +0000
Received: from 6173bcbeebb4.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 88C104C3-4C56-4BFC-88A0-181BE510A1E7.1; 
 Wed, 09 Aug 2023 14:15:02 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6173bcbeebb4.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 09 Aug 2023 14:15:02 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by VI1PR08MB10102.eurprd08.prod.outlook.com (2603:10a6:800:1cf::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Wed, 9 Aug
 2023 14:14:58 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a%4]) with mapi id 15.20.6652.028; Wed, 9 Aug 2023
 14:14:58 +0000
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
X-Inumbo-ID: 3b0659eb-36bf-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=//FkV4ksvf/p2bNa4niW0ittErPqSYgl/6jmAxuAk6A=;
 b=JLzubRAZMd+Ug2bl8NlvldvrkMSMCqwwJCdkBqoeTZsvdEgxC5eFVIzCDN0W/B7wNQOBTpHGwYWk1HaesN7LEIH4ZPvWeM37H4ioaeoN2mlTui5mynNwtXrjyUsFQcHSKFYYpMsvaFF6NnRzyUOX19ySklcLczgllIMApYqMO7I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2c5594971fdbb592
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NCEW01dodYRVRIBn19sJ9Mox7XpVE1L+z5hEGqg3PInX5N6Rq9yucnpPrxUl9wPACH/wClZM7qfLKfPJjTdqeBMwSn1OmzjNfGQXcBay1ChLBMEvhwAgGciapnNICUHWLpDhUbUqmfIMF6tgN5u05TOeANrTuOTbi5EjaZuhryMtxTGg2g3Gevb/KgjgEH3wOMOzSKDdg7Pgn7hgKUlKDcdCmEUFv2q1/Vvs2CPJuJEUQBV4qAUolzaPQ5Db7fZ/DDz5kBOYA88Unwkx8b0ui1jGlSZZDe1fMLfY/TWocSlw81XlEoFcZYOVniVbutKyYZPnScLnlL7+PEbVdX4Tsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=//FkV4ksvf/p2bNa4niW0ittErPqSYgl/6jmAxuAk6A=;
 b=DDyztEsWaZvnFX7C/iXUimseaO2iVsJn5lfXxOiwPp4ugkJYwpZzN8GTM5g/iA8Y3NO3i9ZkyoUPlzO8HRSPNZ4nXyzJ4WmpApKobghX2JlXlqAwkg4lZ9X3ZjRMBFTxwxVOval1yT4UqJhcFk+MWfM0oQfoMITCSOSmL2nXt5L2A71YKPFX3qhOU/2/gFv4K60r5vM4fJHzey8/fyKINiq4t+qCLQPGCfrJAhljwXE13oE0TZtnqYiaQVyEd5eA1K+lp99Nci3anyJOdjgMT/1SOkGgWl3AcS3CsHCQMEavwZcijxElnzGIAWIjhvaf0VVx8+6cHCYpCC2hRBeODA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=//FkV4ksvf/p2bNa4niW0ittErPqSYgl/6jmAxuAk6A=;
 b=JLzubRAZMd+Ug2bl8NlvldvrkMSMCqwwJCdkBqoeTZsvdEgxC5eFVIzCDN0W/B7wNQOBTpHGwYWk1HaesN7LEIH4ZPvWeM37H4ioaeoN2mlTui5mynNwtXrjyUsFQcHSKFYYpMsvaFF6NnRzyUOX19ySklcLczgllIMApYqMO7I=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, "michal.orzel@amd.com" <michal.orzel@amd.com>,
	"xenia.ragiadakou@amd.com" <xenia.ragiadakou@amd.com>,
	"ayan.kumar.halder@amd.com" <ayan.kumar.halder@amd.com>,
	"consulting@bugseng.com" <consulting@bugseng.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>
Subject: Re: [XEN PATCH 3/8] xen: address MISRA C:2012 Rule 8.4
Thread-Topic: [XEN PATCH 3/8] xen: address MISRA C:2012 Rule 8.4
Thread-Index: AQHZyrEYmlGLQrMXXU2mT8iNskDvw6/h+3gAgAAEg4CAAAJWgA==
Date: Wed, 9 Aug 2023 14:14:58 +0000
Message-ID: <771C6AF9-8BB8-466C-B9A4-1745016BEB1E@arm.com>
References: <cover.1691575243.git.nicola.vetrini@bugseng.com>
 <c010bbb270ff3b546d4790487cf973413ca2af26.1691575243.git.nicola.vetrini@bugseng.com>
 <F44603D5-6DB1-4266-AD2A-482AD481E9C2@arm.com>
 <041f2137-8a90-79f6-3677-f764cb1b6656@suse.com>
In-Reply-To: <041f2137-8a90-79f6-3677-f764cb1b6656@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|VI1PR08MB10102:EE_|AM7EUR03FT053:EE_|GVXPR08MB7823:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c07b279-b456-429c-c4a2-08db98e31663
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 vRfJ0dRRLVXTV88UPlAnWIFLXKSq8lRD7Os4Euzm0Ul9ZV/0XET6gJXpIVmlCd74Y0SMtjXebcCifmRUjAnzBLtY464mE4bYTpVLACzmgCYMXGPmj8TGo13Y22/j9MsRINZzlXdnUyLQ+uqe0D5WjYtD5w7ruaVLm21LaHcsKM/vgfnYwLBV9B3iYKY2LLSQhfbF/bR8+tJFYrOdTP6bUH/B047FwaUw9LzEc1z/SX74x4GkMJdAPnEWeJ/VH6Iw10UMlNBgPA1fSwl2sVbxGIfE8XvFR3pC+AlYoGOQay59U2ewiWGE/4hs8G/uXVbUh/dJKb8/v4RnJBg7zthsHVSK9NF3guTWncfwKnsSmAbL62jA9pys2I7UUdDJ17sx9MV8oF5rfMyTLTsbhNTGS8zLUEM/LSIcuFYjPEACHPX5uTB0kwwqCwkzoSqOZuMIR+LCZ5PY2NQmXuoDvqk3wzXWS1cofMwJASWAGJJoyyL+bOv/Qk5DlK/gpdewKehWP6rbUYEtISOlalnczbfWrIp4v9DmLJGIQhEeMYqQ4Cl2z1i5OhQ0WY/WGTUTsR3TWqd9BfC/U8m85tabI3VldXFzCdGivgfTdo6p6DxEao2RWlCvILXm4oMD320fehcrBpXojQzoZUkbswhVDazGWg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(396003)(376002)(366004)(346002)(1800799006)(451199021)(186006)(122000001)(478600001)(6486002)(2616005)(83380400001)(6916009)(6512007)(53546011)(6506007)(26005)(76116006)(66946007)(66476007)(8676002)(8936002)(41300700001)(33656002)(64756008)(66446008)(66556008)(316002)(4326008)(2906002)(91956017)(71200400001)(36756003)(38100700002)(38070700005)(5660300002)(54906003)(86362001)(7416002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <18C13D500FBE4A4E8C803DE9B01F35FA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10102
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1deefa6b-d3c0-4560-602e-08db98e30376
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	v+x3F9RibBb6WfTe9cdsmWNoWkt16hWkWNS2GneFWniCN2Ktg23cwk5GX6at41xQjVICNLwDUHiLNCvuyTTqFHuXhWDARAvO5wR/vZHJRWlipheSPWiW7x0g7sp6abaD0WO9p+q+FbLdMhIHL25nd4ZR8EN+UbqVU+gncQDmSVFp/3SeDLzve2xN4SJpH2UlxMI6i93WmmPjATNVPpZH9/Nb61E2GdN9xfaaVz9vmw+2DLgTowYRkcYz4mMdcAv3BLe9tORzjON0Cw0AsWxvsZip+oKEVCQ5SMZkBq9G48cdOHKg6erhL2RvXqaSDr1W+peAby5GWMqYLgu/N8sye1DgyUTIZ9qi6nQt43rjO9WZHm1kq2gJgp2/u2nM3DsdIsMKco4ZfTw3ZjPq0mtUJ8ohtbpAmEX7VKVlCXUd3gsbWgVuw6q58FjKJ4/gkjYQJSGH+KkgCc8LgFq7/iDqWc+iZWwOTiB4WgSLS6Axkr8jX95fmKutAu8Bv9VyGSNEcyWo9RSHGvc9jNXEKPhjBnNjZVIQPo6uUlHNQg2coElLn4HCeNdlIaMu1xxIxRVRuPWov1pZNN8p5bqEW6UKhMnylzT2ptW79mYoHSuvzMMOM39slIF5MUE8EunQbAOouwpmKPWfJ77Y5D47TiHmXsEgyiHCIkQw/7VcL0OnIgN44ukFHseMZswyu7tqIDn2qEEGu+heSNBNVuK0k++KpnVd5ogBXczalP2zAZe0FCc/4UjuqX+5mgUO1eJGf0h5
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(376002)(396003)(346002)(1800799006)(451199021)(186006)(82310400008)(36840700001)(40470700004)(46966006)(40480700001)(2616005)(40460700003)(6486002)(478600001)(86362001)(82740400003)(33656002)(81166007)(6512007)(356005)(53546011)(26005)(36756003)(6506007)(107886003)(41300700001)(6862004)(5660300002)(8676002)(316002)(4326008)(70586007)(2906002)(54906003)(70206006)(336012)(8936002)(83380400001)(47076005)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2023 14:15:30.3067
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c07b279-b456-429c-c4a2-08db98e31663
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7823



> On 9 Aug 2023, at 15:06, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 09.08.2023 15:50, Luca Fancellu wrote:
>>> On 9 Aug 2023, at 12:02, Nicola Vetrini <nicola.vetrini@bugseng.com> wr=
ote:
>>>=20
>>> The variable 'saved_cmdline' can be defined static,
>>> as its only uses are within the same file. This in turn avoids
>>> violating Rule 8.4 because no declaration is present.
>>>=20
>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>> ---
>>> xen/common/kernel.c | 2 +-
>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>=20
>>> diff --git a/xen/common/kernel.c b/xen/common/kernel.c
>>> index fb919f3d9c..52aa287627 100644
>>> --- a/xen/common/kernel.c
>>> +++ b/xen/common/kernel.c
>>> @@ -28,7 +28,7 @@ CHECK_feature_info;
>>>=20
>>> enum system_state system_state =3D SYS_STATE_early_boot;
>>>=20
>>> -xen_commandline_t saved_cmdline;
>>> +static xen_commandline_t saved_cmdline;
>>=20
>> I see this line was touched by fa97833ae18e4a42c0e5ba4e781173457b5d3397,
>> have you checked that making it static was not affecting anything else?
>=20
> The code requiring the symbol to be non-static went away in e6ee01ad24b6
> ("xen/version: Drop compat/kernel.c"). That's where the symbol would have
> wanted to become static. But that was very easy to overlook.

Yes you are right Jan,

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Possibly with the Fixes tag

Cheers,
Luca=

