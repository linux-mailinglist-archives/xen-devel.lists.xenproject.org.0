Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0EA6A7BEB
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 08:36:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504387.777036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXdTm-0007Q2-D5; Thu, 02 Mar 2023 07:35:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504387.777036; Thu, 02 Mar 2023 07:35:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXdTm-0007N5-AK; Thu, 02 Mar 2023 07:35:54 +0000
Received: by outflank-mailman (input) for mailman id 504387;
 Thu, 02 Mar 2023 07:35:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TfVa=62=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1pXdTl-0007Mr-6q
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 07:35:53 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0610.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dbaa55bf-b8cc-11ed-96a9-2f268f93b82a;
 Thu, 02 Mar 2023 08:35:51 +0100 (CET)
Received: from DB6P195CA0006.EURP195.PROD.OUTLOOK.COM (2603:10a6:4:cb::16) by
 DB9PR08MB9537.eurprd08.prod.outlook.com (2603:10a6:10:459::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.30; Thu, 2 Mar 2023 07:35:48 +0000
Received: from DBAEUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:cb:cafe::dc) by DB6P195CA0006.outlook.office365.com
 (2603:10a6:4:cb::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30 via Frontend
 Transport; Thu, 2 Mar 2023 07:35:48 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT014.mail.protection.outlook.com (100.127.143.22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.19 via Frontend Transport; Thu, 2 Mar 2023 07:35:48 +0000
Received: ("Tessian outbound fcd8b5fba459:v135");
 Thu, 02 Mar 2023 07:35:48 +0000
Received: from 8f9d4ab20853.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AA282D96-F787-4111-9418-FBAC6D4169DC.1; 
 Thu, 02 Mar 2023 07:35:41 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8f9d4ab20853.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 02 Mar 2023 07:35:41 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PR3PR08MB5612.eurprd08.prod.outlook.com (2603:10a6:102:8f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18; Thu, 2 Mar
 2023 07:35:39 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::806c:fd65:92cf:7b7a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::806c:fd65:92cf:7b7a%6]) with mapi id 15.20.6156.018; Thu, 2 Mar 2023
 07:35:38 +0000
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
X-Inumbo-ID: dbaa55bf-b8cc-11ed-96a9-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ulrS035++udyLxjlgcWIGvI82hX5VONbyaySdXzfIh0=;
 b=542Jru/qGHLe1al0OasBAFBCendIKJW/foNdSX8fQRtvP4QNJSqoJrmO8YqgWcB0vGMuEYJexEK8lsrZOScoxV6Za7ylCK//SJGoGmsnbBBOLvzR+fzTnnIGGzJbq33cifxhyH7bIZVyxbdyIZbaeUc3WEAjYJS2Le9qv2Jf+hk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 50cec23a2be772a6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BrerVn7Z7TBcq8cbZwOS8WDN2M8HRDeiOM4CrhgTOo49Lj/pJc5N+zQD/jAPRs7/TTL5nz+DodxJbBGcF7wuhhbaeJnOtf9XsFJIm7AnmciVjPC9O62Id2IlI4UqLojlhZAz6sB7UqFwNX+U3ToBkxwY55fwpSQzllgkxYINNQ7tKK6tvqPI8zE81Tk7Le5kzZyx5zbvXsPNQKIBcCt15jWHLvk5Th6bEwHtdD69xzkh23pQO49Qcqm/Rl0AeLPNB2Gu46GbdD+j5mISR9lZHdcgqQrKGKJbdEVngiLXyGn049/BaEAkbhvaDDtPJaxVBeYwlrs0pEXdyVNNz5pFwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ulrS035++udyLxjlgcWIGvI82hX5VONbyaySdXzfIh0=;
 b=V11PiSh5vavUK8ky/d4+kZrs09W0R6uAcOsNn6RqClfh/YJTAfg5LhmthT3g+TeA1Yu0/hY5e64wmIYjCWPe8SjuTHAXv72V5eHoQlYjH+uYHuCugq5gzjH3en2To18rhKcyLv1ST1GC3+AWTcWDtUedJKQVmoH2AFhhjZoQtgcPS4NV6U1jHohAxEuNp+nN7Z9EypWpCiATEIWyPcjL/Ott893Lh+mtUViwyVysS2zYDO7UBP9CAuLVScJ18oe+mLE91un8YnwpRR/nlH+tPK5UYDaP//+zVVbtMUT/h979IBUwUrV375cnp2Vk/yW2Sy/JfGXsIBjb/x4fANB4qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ulrS035++udyLxjlgcWIGvI82hX5VONbyaySdXzfIh0=;
 b=542Jru/qGHLe1al0OasBAFBCendIKJW/foNdSX8fQRtvP4QNJSqoJrmO8YqgWcB0vGMuEYJexEK8lsrZOScoxV6Za7ylCK//SJGoGmsnbBBOLvzR+fzTnnIGGzJbq33cifxhyH7bIZVyxbdyIZbaeUc3WEAjYJS2Le9qv2Jf+hk=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Marc Bonnici
	<Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: Re: [XEN PATCH v7 12/20] xen/arm: ffa: send guest events to Secure
 Partitions
Thread-Topic: [XEN PATCH v7 12/20] xen/arm: ffa: send guest events to Secure
 Partitions
Thread-Index: AQHZRtMbJTLQExtpBE6ThIQepjPcla7km2EAgAEk3QCAAC0KAIAAP38AgAD4rYA=
Date: Thu, 2 Mar 2023 07:35:36 +0000
Message-ID: <FBA6DD13-0585-45E4-B131-1FF2EF4E10CC@arm.com>
References: <cover.1677079671.git.jens.wiklander@linaro.org>
 <cfd9ae67bdf24bee796b418937dd1486018fd188.1677079672.git.jens.wiklander@linaro.org>
 <3DE2B127-8820-400A-86FC-3A38F40CADFD@arm.com>
 <CAHUa44EjD7mSE0DZShoRh9PAPVPWXL0gXUpi69s-2ktaMMSa8A@mail.gmail.com>
 <8D294745-AE0E-41B7-9B42-7C463AC77F93@arm.com>
 <CAHUa44E45G7jh+LgFdF8EZ7E68MCjmXUyNK=z3QrW+Rx_hAwAA@mail.gmail.com>
In-Reply-To:
 <CAHUa44E45G7jh+LgFdF8EZ7E68MCjmXUyNK=z3QrW+Rx_hAwAA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|PR3PR08MB5612:EE_|DBAEUR03FT014:EE_|DB9PR08MB9537:EE_
X-MS-Office365-Filtering-Correlation-Id: 92e846bc-5ce1-4f81-9fdd-08db1af0be20
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 GkRglCHnrb+eV0otLXJvu1HGg7Y1mNGBisKTUWajBSMvUNgy2AFtDb2+KBi6+JEghzflt5YlxXMayriRLnDNOjAFOLGX4dC3JBRzmCUGoTRwEKJCqmzlos7ESjBQAbVIOBsnwaqP0jCS+ZZLyE+EnVV+51kQ0Ji1omtEyDw1z0G0wRV5QIy+nf0y2hMuyagHqKXCXPrWcC28ziPFOu75UNldS+qDDzMc+L+w2QehHTcVVL1GBCjaTv/GwN1epLrYGsVfwRt4/GAw+nmX+AeUkCboRGSc18p+pvWvL7sCV6zi22FPprbazH9t6bESy0wziMfmJrZOYuqb7wniZS7M5KEouP3577jMswXgXs4x/15uF5MTWodq75+btQ1Tw0QahbkCvVlspB8hH4kO3JbVW4CJUOh/dbF8cUTQjtgTpBq8clVYxAZ/fGmXKXMKeAN1HRzGkDiXooERIfuOK5nxou4nAxLHwccz+6GRLwenRZ/3qYaiD0tHXqZLDFaVONb/V6H5GlUMlfrpKm4Guv0TLzpEUw9dQNffYyzBS+PQambqTR0lIAgjhynIFrMUqcAOXo8iobskbyILTwnUHHzrZM/l+ihVwySXbjgyJEOthTS7YI34cLMoWgzQXJoAa29PLELCnM31onnnXWUrLBJophDD4i1+fPnK47O/ClwbnKaHg5/PnAUBw7Hji6ye5Q0ZdzpvT5X9AMrFZsygdE1PMBgLKzD3PaadpL6vgIr+xF0=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(346002)(136003)(39860400002)(396003)(366004)(451199018)(36756003)(71200400001)(53546011)(6486002)(6506007)(186003)(6512007)(2616005)(6916009)(316002)(54906003)(41300700001)(91956017)(4326008)(66556008)(76116006)(66476007)(66446008)(2906002)(8676002)(64756008)(5660300002)(8936002)(478600001)(38100700002)(122000001)(33656002)(86362001)(38070700005)(66946007)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6D18F958CEB2B642B4EF422BE238A576@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5612
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e53f533b-0fb7-4fe8-109f-08db1af0b6e8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LViCT7zUcM23Feg4WlHBWUVG5zM6zwtQbSTqojOUe2lHXuZhQpT16Ux0EyqNMYHFKAkG7Ekulg2OOfAZ3sWqHei7/a8OYkneKKXPqxSQWJJR5kvggBOjflIyS8F2sgHWdS5Aku/fNKgx+TJDbsA43tY2mz6w12c1nhexbIPfL5oTOVNKU6YeM8c8neTH0pOscRM/UsHCTWm2722xIJYDQ43uSH9VUm4MVOY34Dp1qbDSrr9ufLk3O+tePqyWL2zGnLb/rQvvYLXaelV6ML3foM7RywM/tEpxJpzkZxROcFyN15XunT6J0oDU1eJIUyPDbbjqlPMMwkAhbpxBQAS6v/2X7yQOPD4JAH7RvVQGpsT8/8YWOmBikmzVvKUqJYE/tpWQffwVwT1jdoTbve1RWgdCv5kSFM6pxFKPrxjvc6Ij5PUi6C3h+5L0kyUBgRmYR7qtjDgBwKuEfTDgFmfFkpkUZvOO2hLtC7GGjJRiUzt4Tvl/9+w3Ns+YgW05XXuNw9BqYRPRFw0dKEFn/dlulzuPKAKKi3k0zCierY1OR7WgdL+ZubGaRGjjuVa2QjCeZ4SYsGpyuXgazhpe7Qyl7CKXPWWeRLOgg7mCsMsykWMstTizXhmTuU06i5bjzPLGsehR/+QY6UgPb13eC/RdVnDPkpYu5fkIcUJm9Plh5dSFXfE2Pnqf+nqFtXZeW6DXkIsxcmNRpXmUjIErzBf9ug==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(396003)(376002)(346002)(136003)(39860400002)(451199018)(46966006)(36840700001)(40470700004)(36756003)(336012)(2616005)(53546011)(26005)(186003)(47076005)(41300700001)(82740400003)(81166007)(8936002)(356005)(40480700001)(82310400005)(4326008)(40460700003)(70206006)(86362001)(8676002)(6862004)(70586007)(83380400001)(478600001)(5660300002)(316002)(54906003)(36860700001)(33656002)(2906002)(6486002)(6512007)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2023 07:35:48.7183
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92e846bc-5ce1-4f81-9fdd-08db1af0be20
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9537

Hi Jens,

> On 1 Mar 2023, at 17:45, Jens Wiklander <jens.wiklander@linaro.org> wrote=
:
>=20
> Hi,
>=20
> On Wed, Mar 1, 2023 at 1:58 PM Bertrand Marquis
> <Bertrand.Marquis@arm.com> wrote:
>>=20
>> Hi Jens,
>>=20
>>> On 1 Mar 2023, at 11:16, Jens Wiklander <jens.wiklander@linaro.org> wro=
te:
>>>=20
>>> Hi Bertrand,
>>>=20
>>> On Tue, Feb 28, 2023 at 5:49 PM Bertrand Marquis
>>> <Bertrand.Marquis@arm.com> wrote:
>>>>=20
>>>> Hi Jens,
>>>>=20
>>>>> On 22 Feb 2023, at 16:33, Jens Wiklander <jens.wiklander@linaro.org> =
wrote:
>>>>>=20
>>>>> The FF-A specification defines framework messages sent as direct
>>>>> requests when certain events occurs. For instance when a VM (guest) i=
s
>>>>> created or destroyed. Only SPs which have subscribed to these events
>>>>> will receive them. An SP can subscribe to these messages in its
>>>>> partition properties.
>>>>>=20
>>>>> Adds a check that the SP supports the needed FF-A features
>>>>> FFA_PARTITION_INFO_GET and FFA_RX_RELEASE.
>>>>>=20
>>>>> The partition properties of each SP is retrieved with
>>>>> FFA_PARTITION_INFO_GET which returns the information in our RX buffer=
.
>>>>> Using FFA_PARTITION_INFO_GET changes the owner of the RX buffer to th=
e
>>>>> caller (us), so once we're done with the buffer it must be released
>>>>> using FFA_RX_RELEASE before another call can be made.
>>>>>=20
>>>>> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
>>>>> ---
>>>>> xen/arch/arm/tee/ffa.c | 191 ++++++++++++++++++++++++++++++++++++++++=
-
>>>>> 1 file changed, 190 insertions(+), 1 deletion(-)
>>>>>=20
>>>>> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
>>>>> index 07dd5c36d54b..f1b014b6c7f4 100644
>>>>> --- a/xen/arch/arm/tee/ffa.c
>>>>> +++ b/xen/arch/arm/tee/ffa.c
>>>>> @@ -140,6 +140,14 @@
>>>>> #define FFA_MSG_SEND                    0x8400006EU
>>>>> #define FFA_MSG_POLL                    0x8400006AU
>>>>>=20
>>>>> +/* Partition information descriptor */
>>>>> +struct ffa_partition_info_1_1 {
>>>>> +    uint16_t id;
>>>>> +    uint16_t execution_context;
>>>>> +    uint32_t partition_properties;
>>>>> +    uint8_t uuid[16];
>>>>> +};
>>>>> +
>>>>> struct ffa_ctx {
>>>>>   uint32_t guest_vers;
>>>>>   bool interrupted;
>>>>> @@ -148,6 +156,12 @@ struct ffa_ctx {
>>>>> /* Negotiated FF-A version to use with the SPMC */
>>>>> static uint32_t ffa_version __ro_after_init;
>>>>>=20
>>>>> +/* SPs subscribing to VM_CREATE and VM_DESTROYED events */
>>>>> +static uint16_t *subscr_vm_created __read_mostly;
>>>>> +static unsigned int subscr_vm_created_count __read_mostly;
>>>>=20
>>>> In the spec the number is returned in w2 so you should utse uint32_t h=
ere.
>>>=20
>>> I don't understand. This value is increased for each SP which has the
>>> property set in the Partition information descriptor.
>>=20
>> Using generic types should be prevented when possible.
>=20
> I'm usually of the opposite opinion, fixed width integers should only
> be used when there's a good reason to do so. However, if this is the
> Xen philosophy I can replace all those unsigned int with uint32_t if
> that's preferable.

Safety standards usually enforce to use explicit size types to prevent
compiler dependencies.

>=20
>> Here this is a subset of the number of partition which is uint32_t (wX r=
eg) so
>> i think this would be the logical type for this.
>=20
> The maximum number is actually UINT16_MAX so an observant reader might
> wonder why the uint32_t type was used here.

Switching to uint16_t might make sense then but you will have to check that=
 you
are not going over UINT16_MAX in the code as you get a uint32_t back from t=
he call.


Cheers
Bertrand

>=20
>>=20
>>>=20
>>>>=20
>>>>> +static uint16_t *subscr_vm_destroyed __read_mostly;
>>>>> +static unsigned int subscr_vm_destroyed_count __read_mostly;
>>>>=20
>>>> Same here
>>>>=20
>>>>> +
>>>>> /*
>>>>> * Our rx/tx buffers shared with the SPMC.
>>>>> *
>>>>> @@ -237,6 +251,72 @@ static int32_t ffa_rxtx_map(register_t tx_addr, =
register_t rx_addr,
>>>>>   return ffa_simple_call(fid, tx_addr, rx_addr, page_count, 0);
>>>>> }
>>>>>=20
>>>>> +static int32_t ffa_partition_info_get(uint32_t w1, uint32_t w2, uint=
32_t w3,
>>>>> +                                      uint32_t w4, uint32_t w5,
>>>>> +                                      uint32_t *count)
>>>>> +{
>>>>> +    const struct arm_smccc_1_2_regs arg =3D {
>>>>> +        .a0 =3D FFA_PARTITION_INFO_GET,
>>>>> +        .a1 =3D w1,
>>>>> +        .a2 =3D w2,
>>>>> +        .a3 =3D w3,
>>>>> +        .a4 =3D w4,
>>>>> +        .a5 =3D w5,
>>>>> +    };
>>>>> +    struct arm_smccc_1_2_regs resp;
>>>>> +    uint32_t ret;
>>>>> +
>>>>> +    arm_smccc_1_2_smc(&arg, &resp);
>>>>> +
>>>>> +    ret =3D get_ffa_ret_code(&resp);
>>>>> +    if ( !ret )
>>>>> +        *count =3D resp.a2;
>>>>> +
>>>>> +    return ret;
>>>>> +}
>>>>> +
>>>>> +static int32_t ffa_rx_release(void)
>>>>> +{
>>>>> +    return ffa_simple_call(FFA_RX_RELEASE, 0, 0, 0, 0);
>>>>> +}
>>>>> +
>>>>> +static int32_t ffa_direct_req_send_vm(uint16_t sp_id, uint16_t vm_id=
,
>>>>> +                                      uint8_t msg)
>>>>=20
>>>> This function is actually only useable to send framework created/destr=
oyed
>>>> messages so the function name should be adapted to be less generic.
>>>>=20
>>>> ffa_send_vm_events ?
>>>>=20
>>>> unless you want to modify it later to send more framework messages ?
>>>=20
>>> That was the plan, but that may never happen. I'll rename it to
>>> ffa_send_vm_event() since we're only sending one event at a time.
>>>=20
>>>>=20
>>>>> +{
>>>>> +    uint32_t exp_resp =3D FFA_MSG_FLAG_FRAMEWORK;
>>>>> +    int32_t res;
>>>>> +
>>>>> +    if ( msg =3D=3D FFA_MSG_SEND_VM_CREATED )
>>>>> +        exp_resp |=3D FFA_MSG_RESP_VM_CREATED;
>>>>> +    else if ( msg =3D=3D FFA_MSG_SEND_VM_DESTROYED )
>>>>> +        exp_resp |=3D FFA_MSG_RESP_VM_DESTROYED;
>>>>> +    else
>>>>> +        return FFA_RET_INVALID_PARAMETERS;
>>>>> +
>>>>> +    do {
>>>>> +        const struct arm_smccc_1_2_regs arg =3D {
>>>>> +            .a0 =3D FFA_MSG_SEND_DIRECT_REQ_32,
>>>>> +            .a1 =3D sp_id,
>>>>> +            .a2 =3D FFA_MSG_FLAG_FRAMEWORK | msg,
>>>>> +            .a5 =3D vm_id,
>>>>> +        };
>>>>> +        struct arm_smccc_1_2_regs resp;
>>>>> +
>>>>> +        arm_smccc_1_2_smc(&arg, &resp);
>>>>> +        if ( resp.a0 !=3D FFA_MSG_SEND_DIRECT_RESP_32 || resp.a2 !=
=3D exp_resp )
>>>>> +        {
>>>>> +            /*
>>>>> +             * This is an invalid response, likely due to some error=
 in the
>>>>> +             * implementation of the ABI.
>>>>> +             */
>>>>> +            return FFA_RET_INVALID_PARAMETERS;
>>>>> +        }
>>>>> +        res =3D resp.a3;
>>>>> +    } while ( res =3D=3D FFA_RET_INTERRUPTED || res =3D=3D FFA_RET_R=
ETRY );
>>>>=20
>>>> We might end up in an infinite loop here or increase interrupt respons=
e time.
>>>> In the general case we could return that code directly to the VM but h=
ere we
>>>> are in the VM creation/destroy path so we cannot do that.
>>>>=20
>>>> Maybe in debug mode at least we should have a retry counter here for n=
ow
>>>> with a print ?
>>>=20
>>> OK, I'll add something.
>>>=20
>>>>=20
>>>>> +
>>>>> +    return res;
>>>>> +}
>>>>> +
>>>>> static uint16_t get_vm_id(const struct domain *d)
>>>>> {
>>>>>   /* +1 since 0 is reserved for the hypervisor in FF-A */
>>>>> @@ -371,6 +451,10 @@ static bool ffa_handle_call(struct cpu_user_regs=
 *regs)
>>>>> static int ffa_domain_init(struct domain *d)
>>>>> {
>>>>>   struct ffa_ctx *ctx;
>>>>> +    unsigned int n;
>>>>> +    unsigned int m;
>>>>> +    unsigned int c_pos;
>>>>> +    int32_t res;
>>>>>=20
>>>>>    /*
>>>>>     * We can't use that last possible domain ID or get_vm_id() would =
cause
>>>>> @@ -383,24 +467,121 @@ static int ffa_domain_init(struct domain *d)
>>>>>   if ( !ctx )
>>>>>       return -ENOMEM;
>>>>>=20
>>>>> +    for ( n =3D 0; n < subscr_vm_created_count; n++ )
>>>>> +    {
>>>>> +        res =3D ffa_direct_req_send_vm(subscr_vm_created[n], get_vm_=
id(d),
>>>>> +                                     FFA_MSG_SEND_VM_CREATED);
>>>>> +        if ( res )
>>>>> +        {
>>>>> +            printk(XENLOG_ERR "ffa: Failed to report creation of vm_=
id %u to  %u: res %d\n",
>>>>> +                   get_vm_id(d), subscr_vm_created[n], res);
>>>>=20
>>>> in this function, get_vm_id(d) will not change so i would suggest to s=
tore it in a local variable
>>>> instead of calling get_vm_id each time.
>>>=20
>>> OK
>>>=20
>>>>=20
>>>>> +            c_pos =3D n;
>>>>> +            goto err;
>>>>> +        }
>>>>> +    }
>>>>> +
>>>>>   d->arch.tee =3D ctx;
>>>>>=20
>>>>>   return 0;
>>>>> +
>>>>> +err:
>>>>> +    /* Undo any already sent vm created messaged */
>>>>> +    for ( n =3D 0; n < c_pos; n++ )
>>>>> +        for ( m =3D 0; m < subscr_vm_destroyed_count; m++ )
>>>>> +            if ( subscr_vm_destroyed[m] =3D=3D subscr_vm_created[n] =
)
>>>>> +                ffa_direct_req_send_vm(subscr_vm_destroyed[n], get_v=
m_id(d),
>>>>> +                                       FFA_MSG_SEND_VM_DESTROYED);
>>>>> +
>>>>> +    return -ENOMEM;
>>>>=20
>>>> The VM creation is not failing due to missing memory here.
>>>> We need to find a better error code.
>>>> Maybe ENOTCONN ?
>>>> I am open to ideas here :-)
>>>=20
>>> That makes sense, I'll change it to ENOTCONN.
>>>=20
>>>>=20
>>>>> }
>>>>>=20
>>>>> /* This function is supposed to undo what ffa_domain_init() has done =
*/
>>>>> static int ffa_relinquish_resources(struct domain *d)
>>>>> {
>>>>>   struct ffa_ctx *ctx =3D d->arch.tee;
>>>>> +    unsigned int n;
>>>>> +    int32_t res;
>>>>>=20
>>>>>   if ( !ctx )
>>>>>       return 0;
>>>>>=20
>>>>> +    for ( n =3D 0; n < subscr_vm_destroyed_count; n++ )
>>>>> +    {
>>>>> +        res =3D ffa_direct_req_send_vm(subscr_vm_destroyed[n], get_v=
m_id(d),
>>>>> +                                     FFA_MSG_SEND_VM_DESTROYED);
>>>>> +
>>>>> +        if ( res )
>>>>> +            printk(XENLOG_ERR "ffa: Failed to report destruction of =
vm_id %u to  %u: res %d\n",
>>>>> +                   get_vm_id(d), subscr_vm_destroyed[n], res);
>>>>> +    }
>>>>> +
>>>>>   XFREE(d->arch.tee);
>>>>>=20
>>>>>   return 0;
>>>>> }
>>>>>=20
>>>>> +static bool init_subscribers(void)
>>>>> +{
>>>>> +    struct ffa_partition_info_1_1 *fpi;
>>>>> +    bool ret =3D false;
>>>>> +    uint32_t count;
>>>>> +    int e;
>>>>> +    uint32_t n;
>>>>> +    uint32_t c_pos;
>>>>> +    uint32_t d_pos;
>>>>> +
>>>>> +    if ( ffa_version < FFA_VERSION_1_1 )
>>>>> +        return true;
>>>>=20
>>>> Correct me if i am wrong but on 1.0 version we cannot retrieve the cou=
nt but
>>>> we could do the slow path and do a first loop on info_get until we get=
 an error ?
>>>=20
>>> Sending the events is not supported in 1.0 so there's nothing to
>>> record in that case.
>>=20
>> Please add a comment here to say that subscribers are only supported aft=
er 1.1
>> and also mention it in the commit message.
>=20
> OK.
>=20
> Thanks,
> Jens



