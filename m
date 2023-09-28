Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 358DD7B16E1
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 11:12:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609390.948454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qln3Y-00025b-I2; Thu, 28 Sep 2023 09:11:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609390.948454; Thu, 28 Sep 2023 09:11:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qln3Y-00023q-FC; Thu, 28 Sep 2023 09:11:36 +0000
Received: by outflank-mailman (input) for mailman id 609390;
 Thu, 28 Sep 2023 09:11:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IVKH=FM=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qln3X-0001Xr-Gk
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 09:11:35 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0614.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 048c65d6-5ddf-11ee-9b0d-b553b5be7939;
 Thu, 28 Sep 2023 11:11:33 +0200 (CEST)
Received: from AS9PR07CA0051.eurprd07.prod.outlook.com (2603:10a6:20b:46b::16)
 by AS8PR08MB9071.eurprd08.prod.outlook.com (2603:10a6:20b:5c1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.21; Thu, 28 Sep
 2023 09:11:30 +0000
Received: from AM7EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46b:cafe::69) by AS9PR07CA0051.outlook.office365.com
 (2603:10a6:20b:46b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.13 via Frontend
 Transport; Thu, 28 Sep 2023 09:11:30 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT063.mail.protection.outlook.com (100.127.140.221) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.21 via Frontend Transport; Thu, 28 Sep 2023 09:11:29 +0000
Received: ("Tessian outbound ee9c7f88acf7:v211");
 Thu, 28 Sep 2023 09:11:29 +0000
Received: from b229d2465802.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 14F85139-130D-4323-8F00-C109FD94C63B.1; 
 Thu, 28 Sep 2023 09:11:18 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b229d2465802.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 28 Sep 2023 09:11:18 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB9148.eurprd08.prod.outlook.com (2603:10a6:20b:57f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.21; Thu, 28 Sep
 2023 09:11:15 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::30ea:681d:5fa7:8bfb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::30ea:681d:5fa7:8bfb%2]) with mapi id 15.20.6813.027; Thu, 28 Sep 2023
 09:11:15 +0000
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
X-Inumbo-ID: 048c65d6-5ddf-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iAPzE90dL9OQX53OaVeeCgxM9CGdm/CkDpxDOJlfpuw=;
 b=E++pCQXRt4CKJtnsnIT+nZVgy3JdyH3a3gMDP4aVavqS9UzE3oDxDEhynmU6crCYQyq8FExxL2Hlys3fLYKWzG/rB1CxsNNRsmfOfQdpaUXgLYW8f/4CgNVOwyzN9jvQxEtopR1inLVIZ/1vkx80Kvd00D/fMhVIL2jYpWYdb/c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1849e17d47198fc4
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IpPywE9jYLAb9yFvCIs3pqdhZSAM1HDh9Zs75oS5r7RJjfTYRZ8ekhaq2vEPeA88axb2j3sQIEuk6tg9GBi6paBuU9/ZKJIPKhbSUnyQfMxiG/pcwoZFZdidOdzcEj+FCPcnCFZwwJqD9gJ6Te3h37EtRtccpsVxCsvhiUeeEFihkmqTOKUhA1qzgXwani0oy/9r9wUuLXXH0LOkcG0th5a8/9TSz5LAWW5QW/Em3bwmnP209Xt0j2pP8egX7PB4Axa/8YkIhtBaFYd2OAMm7l17N06UB9EG2GXGuE5YM28fKo+mCCwOonev1Hkrhc179wX9JcNMHZDcotWH2dbF0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iAPzE90dL9OQX53OaVeeCgxM9CGdm/CkDpxDOJlfpuw=;
 b=UbA8OWJrmhGaunMRWZP3SXha3NdIv+U4Aqw2EcmIgQUliJN/9g79TRtieYp5u1UdYoJaWwo8jOU9aUHJ2wKQLLFt1ohFIGqCXBK0ueDfbx2rX7ciQs0BHs5/smHzpMMV7iPdTCOqiJCMHX6oe/JXUiUsFPN8ZVDiTskTshXie4MmbFTGlJhbblDvBNgQ1pNBzb6p9pwqHrZ1LqJsAm5U6qef5leppDkhpFE+e/kpPjCmHfPJ7T7gqhj5L5GjLkpJzB2Q4KBQ3+jM3yl6BArmt/YImyVJ4kHTqTHJHN1dBn/4MHCxRf4qgMe/XShe7O4uS7tCpngZjUU1rLL2rka5lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iAPzE90dL9OQX53OaVeeCgxM9CGdm/CkDpxDOJlfpuw=;
 b=E++pCQXRt4CKJtnsnIT+nZVgy3JdyH3a3gMDP4aVavqS9UzE3oDxDEhynmU6crCYQyq8FExxL2Hlys3fLYKWzG/rB1CxsNNRsmfOfQdpaUXgLYW8f/4CgNVOwyzN9jvQxEtopR1inLVIZ/1vkx80Kvd00D/fMhVIL2jYpWYdb/c=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"roger.pau@citrix.com" <roger.pau@citrix.com>, "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>, "roberto.bagnara@bugseng.com"
	<roberto.bagnara@bugseng.com>, "julien@xen.org" <julien@xen.org>, Stefano
 Stabellini <stefano.stabellini@amd.com>, Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH v3] docs/misra: add rule 2.1 exceptions
Thread-Topic: [PATCH v3] docs/misra: add rule 2.1 exceptions
Thread-Index:
 AQHZ4qiwUwH3koR9JUa91LeAyizAArAVxOqAgACZsICAGAuKgIAABdgAgAETh4CAAI6WgA==
Date: Thu, 28 Sep 2023 09:11:15 +0000
Message-ID: <0CAE1C36-7823-429B-8D29-1E7F9D69A06E@arm.com>
References: <20230908230318.1719290-1-sstabellini@kernel.org>
 <91d5ea6d-bdfa-45bf-a54b-5acdf1784ec4@xen.org>
 <alpine.DEB.2.22.394.2309111740160.1847660@ubuntu-linux-20-04-desktop>
 <156fac1ee8e37cddac95813f72a108e0@bugseng.com>
 <BEAF1369-C1FE-4B81-A0A1-5A4F39426E9E@arm.com>
 <alpine.DEB.2.22.394.2309271740280.1996340@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2309271740280.1996340@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS8PR08MB9148:EE_|AM7EUR03FT063:EE_|AS8PR08MB9071:EE_
X-MS-Office365-Filtering-Correlation-Id: ca8f3b41-2303-4784-ac28-08dbc002e6ec
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 2s/En6IF+lGkWYL2jmTm/sLEwQrMCCjgfL5hxXkO1Q7Lh3ozt0lbLt5JkHq12oYxCB+DHq9ZHHswLGpDrdti1x0xvJ0Mf2SKsCCekHCpeJYN6z98/f6RmzoHkajG4vP7zxlLjJrYu93nX4BhKDnK8swJ7RHqCCoR9+eOm4P3SKE5rdUN23AjWJv4VGeUujZJTalFVCPy9l4/fdtBtNv6PE+Kpm6XNEJ23OzbQ5zu7prkr4+hH/AfmSKcQ+stj/ucdT2nnfRqG4V37b67Ef42u7wrrmMAm0u/OY+i4Hwabwd16YXUpb4Y+Ebg7g68FBLeBkJzIy+3dr20mEng61jxq2pG9XMbrvAWht8Ozp5b2N4ibyGQeCcQPsj8SwpKzdfOhuesOrRYX+X1KuBfLBzMoqMXX0yEzUvULhYq8jh/U7PyQiSUWY65A/lgnngCgslhXUeQVvKN0uOwLM1S1MzaV07zjEUIW3doNvI5hVML+pXODOjlQexjDXBgsug1nsXB09/srBfbzIDDptMaauDIH7AxHVi5qzZi/VTSv2UuwdWKt/5uav9Hci4Fhs/vUY2yveCbTyFXnuitsD2PLQyYerdxbXs8AmdBNOEYodntZ7LNx4brzih8lAWuDzbHzPS+Wv/sqEFBUPjcekPqk+YPNA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(396003)(366004)(346002)(376002)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(5660300002)(76116006)(91956017)(66556008)(41300700001)(66476007)(64756008)(66946007)(66446008)(54906003)(316002)(2616005)(53546011)(478600001)(6506007)(71200400001)(6512007)(6486002)(2906002)(6916009)(8676002)(122000001)(7416002)(4326008)(38070700005)(8936002)(33656002)(966005)(36756003)(86362001)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E703E4F4B478EC42B9FCE1E24F8658DD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9148
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	50b62348-d439-41c4-519a-08dbc002de6f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3CYmalauatwGPbqLvtp/LNNXFPJtvFIFWJwhVpvqqx2hn/yBBi/rWzNxSUq6vxrMP1g7VHHdEMA4KujdHmKsyn4kjaUroSk/M0KuNRsr0QKRDthFPjVj35k0z8zwY791sRIxQFoh0GXSi2arOcZSFHKfpkVK4R6dw1sKBvwNUvdkDdx7qdyv2Dt2LcwVfi0Rf6lwa1tP71fzu7SJvZvya4JR+Npg5zRcZXzXYW8AizooViviiBY754RMcilAlRierkOdRqZniaY1r+YPx0oHr/9oB794fVAciCY8zwLxLGPFAuPN/fB8HbCDRfuSQt4s8Q1eMK80l+vV5zlajMrOigpQ7k9hWklRGeUoczaPwVjwvXCXB4BrrVo6Yafh98ifDiEWhrwxGF/DeYNxs2vSjz80AMdiPuaHOavXLVqcyYO/hpfQFWBM4ouANEdPqV14/pC2MTzuwQP/DCVIpsqIUIta8a6m+J0ar5ZsIMb5oZW86xRVOLcYUm1xyP1zsUol75tsNnw+4PLCqgHzHRvbQRmJHxNmnjRV3NPTU3H3wjrxYaT5vu8xk5ZlBUgZYWALTZT1Te7GmdQmbRdm9HQ/RWkGS1pL5QQnhl1Jjb3YHNu1+FoNWcwwCxAv50lVQsP0wiJUaIAYTkMdVFu3YQlSyRsHyMMtOg5jg7u7dXcHpJ3vyA5c2pAAk6Cs2XYaH6nJlBqB8+T3dm4v0BogmglOf2Ip0Nya5rzQmn5uVUWLFBc=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(136003)(346002)(376002)(230922051799003)(186009)(64100799003)(1800799009)(82310400011)(451199024)(46966006)(36840700001)(40470700004)(2616005)(336012)(26005)(53546011)(6506007)(6512007)(36860700001)(47076005)(86362001)(81166007)(82740400003)(36756003)(40480700001)(356005)(33656002)(40460700003)(70586007)(70206006)(2906002)(54906003)(316002)(8936002)(41300700001)(8676002)(4326008)(6862004)(5660300002)(966005)(478600001)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 09:11:29.9013
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca8f3b41-2303-4784-ac28-08dbc002e6ec
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9071



> On 28 Sep 2023, at 02:40, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> On Wed, 27 Sep 2023, Bertrand Marquis wrote:
>>> On 27 Sep 2023, at 09:53, Nicola Vetrini <nicola.vetrini@bugseng.com> w=
rote:
>>>=20
>>>>>> diff --git a/xen/arch/arm/psci.c b/xen/arch/arm/psci.c
>>>>>> index 695d2fa1f1..2a8527cacc 100644
>>>>>> --- a/xen/arch/arm/psci.c
>>>>>> +++ b/xen/arch/arm/psci.c
>>>>>> @@ -59,6 +59,7 @@ void call_psci_cpu_off(void)
>>>>>>      }
>>>>>>  }
>>>>>>  +/* SAF-2-safe */
>>>>> I think any use of SAF-2-safe should be accompanied with an attribute=
...
>>>>>>  void call_psci_system_off(void)
>>>>> ... noreturn for function or ...
>>>>>>  {
>>>>>>      if ( psci_ver > PSCI_VERSION(0, 1) )
>>>>>> diff --git a/xen/arch/x86/shutdown.c b/xen/arch/x86/shutdown.c
>>>>>> index 7619544d14..47e0f59024 100644
>>>>>> --- a/xen/arch/x86/shutdown.c
>>>>>> +++ b/xen/arch/x86/shutdown.c
>>>>>> @@ -118,6 +118,7 @@ static inline void kb_wait(void)
>>>>>>              break;
>>>>>>  }
>>>>>>  +/* SAF-2-safe */
>>>>>>  static void noreturn cf_check __machine_halt(void *unused)
>>>>>>  {
>>>>>>      local_irq_disable();
>>>>>> diff --git a/xen/include/xen/bug.h b/xen/include/xen/bug.h
>>>>>> index e8a4eea71a..d47c54f034 100644
>>>>>> --- a/xen/include/xen/bug.h
>>>>>> +++ b/xen/include/xen/bug.h
>>>>>> @@ -117,6 +117,7 @@ struct bug_frame {
>>>>>>  #endif
>>>>>>    #ifndef BUG
>>>>>> +/* SAF-2-safe */
>>>>>>  #define BUG() do {                                              \
>>>>>>      BUG_FRAME(BUGFRAME_bug,  __LINE__, __FILE__, 0, NULL);      \
>>>>>>      unreachable();                                              \
>>>>> ... unreachable for macros. But the /* SAF-2-safe */ feels a little b=
it
>>>>> redundant when a function is marked as 'noreturn'.
>>>>> Is there any way to teach eclair about noreturn?
>>>> Actually I had the same thought while writing this patch. If we can
>>>> adopt unreachable and noreturn consistently maybe we don't need
>>>> SAF-2-safe. If the checker can support it.
>>>> Nicola, what do you think?
>>>=20
>>> A couple of remarks:
>>> - if you put the noreturn attribute on some functions, then surely the =
code after those is
>>> reported as unreachable. ECLAIR should pick up all forms of noreturn au=
tomatically; otherwise, a simple configuration can be used.
>>>=20
>>> - Note that the cause of unreachability in the vast majority of cases i=
s the call to
>>> __builtin_unreachable(), therefore a textual deviation on the definitio=
n of unreachable, plus
>>> a bit of ECLAIR configuration, can deviate it (to be clear, just the SA=
F comment is not
>>> sufficient, since deviations comments are meant to be applied at the to=
p expansion location,
>>> which is not on the macro definition).
>>> This is what it should look like, roughly:
>>>=20
>>> -config=3DMC3R1.R2.1,reports+=3D{deliberate, "any_area(any_loc(text(^<R=
EGEX>$, -1)))"}
>>>=20
>>> #if (!defined(__clang__) && (__GNUC__ =3D=3D 4) && (__GNUC_MINOR__ < 5)=
)
>>> /* SAF-2-safe */
>>> #define unreachable() do {} while (1)
>>> #else
>>> /* SAF-2-safe */
>>> #define unreachable() __builtin_unreachable()
>>> #endif
>>>=20
>>> where REGEX will match the translation of SAF-2-safe.
>>>=20
>>> However, this will then entail that *some* SAF comments are treated spe=
cially and, moreover,
>>> that some modification to the definition of unreachable won't work
>>> (e.g.
>>> #define M() __builtin_unreachable()
>>> /* SAF-2-safe */
>>> #define unreachable() M()
>>>=20
>>> My opinion is that it's far easier for this to be an eclair configurati=
on (which has the
>>> advantage not to depend on the exact definition of unreachable) and the=
n perhaps a comment
>>> above it explaining the situation.
>>=20
>> I agree here and it is easier to make an overall exception where we list=
 the cases
>> where this is acceptable (ie all flavors of unreacheable) and document t=
hat eclair
>> was configured using "xxxx" to handle this.
>=20
> In that case it looks like we all agree that we can go ahead with this
> patch with just the changes to docs/misra/rules.rst to add rule 2.1 and
> remove everything else. Which is v2 of this patch:
> https://marc.info/?l=3Dxen-devel&m=3D169283027729298
>=20
> Henry, can I get one more release-ack for v2 of this patch (only changes
> to docs/misra, no code changes)?
>=20
> Also Bertrand can you provide a formal Ack for v2?
>=20

Done, you just need to handle the comment from Julien for it.

Cheers
Bertrand

>=20
> I do think we should have a document to track this kind of deviations
> that are not managed by safe.json or exclude-list.json. But I think for
> now the rules.rst notes and the ECLAIR config file (which is under
> xen.git) will suffice.


