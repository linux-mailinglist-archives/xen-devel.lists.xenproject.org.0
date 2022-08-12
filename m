Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DD1590F60
	for <lists+xen-devel@lfdr.de>; Fri, 12 Aug 2022 12:23:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.385541.621213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMRoJ-0001aY-AP; Fri, 12 Aug 2022 10:22:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 385541.621213; Fri, 12 Aug 2022 10:22:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMRoJ-0001X2-5m; Fri, 12 Aug 2022 10:22:35 +0000
Received: by outflank-mailman (input) for mailman id 385541;
 Fri, 12 Aug 2022 10:22:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hyho=YQ=citrix.com=prvs=2169cd8bb=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oMRoH-0001Ww-4z
 for xen-devel@lists.xenproject.org; Fri, 12 Aug 2022 10:22:33 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab6ad19c-1a28-11ed-924f-1f966e50362f;
 Fri, 12 Aug 2022 12:22:31 +0200 (CEST)
Received: from mail-mw2nam12lp2044.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Aug 2022 06:22:28 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB5118.namprd03.prod.outlook.com (2603:10b6:208:1af::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Fri, 12 Aug
 2022 10:22:25 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd%4]) with mapi id 15.20.5504.020; Fri, 12 Aug 2022
 10:22:25 +0000
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
X-Inumbo-ID: ab6ad19c-1a28-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660299751;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=VkWM/VENhM/uTnPmoiN2dQjsGAICGS3Kb3d/rvy8paI=;
  b=EsgVSPTu19tcdAnC0k5/ExcBvuStuT3EisLGTv78OOw6kjk3TvTm1A9w
   cD3Ebabkt/kextE664LU7BohMkB8dvV0MhS2DlR9MchixoYtJfYUQHbC9
   gX+jJ1szPwnrCqYpHaGiBCtidcMBm0PDoXhFrDR2p5AldFQVlR4Rmx9aY
   U=;
X-IronPort-RemoteIP: 104.47.66.44
X-IronPort-MID: 77951374
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3AT6NVXKktzv/VmE5PYL9QSFzo5mJPLRO4T7NN2?=
 =?us-ascii?q?KgyY2vmR7AEGURwNzJs89viY1XMGPRfL3Py3WupzRYxVX4lji++r92TOSDQ9?=
 =?us-ascii?q?sz0v5ui+AYdo8p35YNINiYNwqifp0DMlqbu0vX3w0J0ZQ1mKKGczYTfCzpcr?=
 =?us-ascii?q?ik6qLoy99qJoNBFhWB/NkawKX5/c5yZDssTevAtRAUBmpLnJe3rGo617GDyy?=
 =?us-ascii?q?gE48hLSnbZ4qIzjP6Hy6QRBBnTUm8rb3cZQHQ5G1RoFBOjQqJF8i+HfPw1jL?=
 =?us-ascii?q?++are4xUN+ob+ZtZ7paJBa8cy91f35kZlWd64HsuqiiOycm+75YhDMQS8arA?=
 =?us-ascii?q?wRSlhR0J8zVRfTP7qnVSpk4GboEqBs+N6SZxYr7ZMaljG6wxgo2lzJATy+tt?=
 =?us-ascii?q?58VwVUEuvuxYHyuudqglvEsflkSuTNMED1rjNvRRzEfegFTp7GsZazsOFxWY?=
 =?us-ascii?q?vMZ2PquPoJ4WWNqVTUfFOkhKTsLyau5dFL9jdICZioAzw3NisET0hl/M3nzh?=
 =?us-ascii?q?vFQzC4qDGyFSxoqrGy56zSzcEUEzsP3v1Eczi3VmBW1XQ9G11ypNoPPCAijH?=
 =?us-ascii?q?f94PafkaGprd9FFF02aNlvzGznCMW2fpXKJDjVix2Z5CQ0ZacLC+pgTxmVBX?=
 =?us-ascii?q?hUly59ht9hiPqBpCO6wK9wwD+nRQV01jbNX9OwAw4URtbcDu/+WXaCshoYh8?=
 =?us-ascii?q?QI+tRwWxaDX0oiwUCSYtcxsNMs0PNFI7Rf/P8Z51rgV395cYNgTHwSn345i5?=
 =?us-ascii?q?OHWpIaqR/E/OweBs9Ao/n1UXspvt/G9m5UNuzCyxjj+ZMKYoBsEW/rdusQhS?=
 =?us-ascii?q?FzJOY09F/HoPy5HjyCO9dnseWxk6R8iWJZPGJMqUVA3NeKk0qndWdzVk0G4T?=
 =?us-ascii?q?WulHg1QKlJHKcjeizMfYQJ3AGLj7L5oqaX1yLXUZFhmLDWi72smSYAkXuXsk?=
 =?us-ascii?q?HFyw8YwkV6ScHJbk3T5M5hCIAAgdJ8XojNAFqku+H8mkG0YFvPfnTxlJGFav?=
 =?us-ascii?q?MWI+dFgU9m54Nap1iyGUyXoJx12B4JUeBExg60qPbWm142Ic3RZqhS6shljm?=
 =?us-ascii?q?TuTUsWOo0OkiIvl3q5lWiYe1iIG0Bcs8uuMqqFXa5y1RhJJxlxWya/FdZmO7?=
 =?us-ascii?q?E7wmwNmNQ7Ib17IvdtWVNR3p4O0D7C5sqVS0m8Tzr3zuAbGeaGCxN2mze9is?=
 =?us-ascii?q?Y5hBOFvk7o0oRpTPvKF/vLrRCx4yUtd2VfcRtIFDBZBvXfZGOBCWOaFhRQXz?=
 =?us-ascii?q?sKZGyEtAa19irFGNfpKk1ya7hmRs0jBt8X3jGwzxSUfgkcZ3X/+RlR7qlsp2?=
 =?us-ascii?q?/bJikoHN9+XRUQ2aHCzrq5CCLTwVsw8p3cKtJGjfh3VtOV+5iCFshI1SvSx8?=
 =?us-ascii?q?t3OJ4xL13man89R70YZoI9sYh/G23k6fr1YoMnoqzC8LxQkxBjEtsmj3Q/tF?=
 =?us-ascii?q?JWaZTh4GdfXJ5LTj19SBdLZpUgAustoU1mO4o8aOs3Sr95G+Tq/V0RPHJ78T?=
 =?us-ascii?q?Q145Og6GfvnJEa43Ebs/Ge9lz8uMik4HT0E0U7BcnqNcu+0fbuWQ+VKvc9IP?=
 =?us-ascii?q?bm6pS5wft0WbZrpRTzMTC+SRReVzn6Z/34Z+JToOyqOPU4xwajfX2OcIelQ1?=
 =?us-ascii?q?6Fx0eCKk+H9spoyapkb/3VLY7x8jAe8bZNa0bKnYbVPss5QcyfnVBNS9h6mP?=
 =?us-ascii?q?KEqWoLC/FexAFeDe5OCEC1rQY1etxqiap8y5aaDKT30q4GLDmf00/86Sa16r?=
 =?us-ascii?q?boPqFk8r10lyvq7g2ZXtJp4sDtic/CXM5r+2cG7PnrIsy6hJks4nN9eetUji?=
 =?us-ascii?q?adB8jaHzLEGwIRwkVdD0vVFmY6sjPty/k8h9JvpjsEgvOaRaJ82ti23LjTj9?=
 =?us-ascii?q?R6KIog+kXaewdV0MB8N6CKmNKcvPISaGGqUUVydTvTE1uchD/vZ7joPGzH8k?=
 =?us-ascii?q?/DnSHIsp+WP/4SPYVDo8WJNTchOXR4WKRGA6PvIRiWXWoUUeX66NTFTy7gqH?=
 =?us-ascii?q?3mwe86tJvq4DyGZNMNQP8UH0S1oBqlIOgP88nKoCHyCcQQXJSvHG5jnaBzvx?=
 =?us-ascii?q?63EkMzkl2v9PKd4cMt7vXXMGZs8v6agXtqyJaSZ0N6zt9LfqLk1mrdmQecyI?=
 =?us-ascii?q?dvfVkcusACSElvIQN4uclhs0Ck7/pkYKkHSfIXbob8HAQ5iVYlfuJSftLkbN?=
 =?us-ascii?q?T7uAtx6Ev9PRDHik+xTBTpomDRikLnixZa6BLbIoFHeJpEHzEXFzryNMuCRK?=
 =?us-ascii?q?F69lnowm3NI7mkWq4JJJOjUjxKTqbYsKs317ymvYTwALtFQ/XhhpdS43+tty?=
 =?us-ascii?q?J11rrYRxn+ZBPOtks/ra0WbjzU+CVYOQKF7Yl3JYY/7F0+4GBrOJXdn2VsP0?=
 =?us-ascii?q?57FJUe25B8hBjDL6js=3D?=
X-IronPort-AV: E=Sophos;i="5.93,231,1654574400"; 
   d="scan'208";a="77951374"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ACGsSNwtkYOM6DWTGlt6EfM6aS1GLL16gaxUXqEAYPMDfdvR99ieiWjF4qi1vmsh2kaebtxcvmu1YFE3u7+rjLph4Cx7Xfw2aoq2QaWVZawYOLhoVwabIsachKUDWn6zYwvMhvEsJlED0m2M04BBBpWdcVHeBG3Jh8jGwcFytXid3Ox2ugjWOXd945ll7yNCg6h99TPiR/jE6mbTxu32GLAXqr9W1kIVm6Fx2XbBOOGcjgNMa7rXPuIIIYHeNWuS0X1zgYqvY1CsENhyL53SU8y6B90Q777aI0J8P5bLyjQC1e3Czv/kp0s481MHsgt5d1DqrJyvYQLGT/DsFMA8Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VkWM/VENhM/uTnPmoiN2dQjsGAICGS3Kb3d/rvy8paI=;
 b=G6k9tdWXGY8rqS84VVguBQuOYrCITRvw2GpC1OGrnTD14rHL9GyT4lSCn6vPuFmbvJzXDKgfeeyVJ2VrVaK2CfpPKPFZNmPvPTxBy8BKBoKsTtFKtq8c6birHfjACEgqpQAMUL6xasVcYBM3X2qdrbiUXvhffjBWIH1kFktN/5olVpLKdMhf6OjUnpXRY3ZroSKlupiirdRl9eeg1ECWd9Ukpp1g3BRJsH4vclHH+ATxUeBDrEERyK0ghiul4Qw7vFy0ZTDUAl+Iw2z23DRQRTA/ovA37uGWockG/XiAKi9CkivSNn5rE2aR+0rN1IOvAp540U5iuu6ryAtB23dtiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VkWM/VENhM/uTnPmoiN2dQjsGAICGS3Kb3d/rvy8paI=;
 b=dnKFBhzpB4rtrtdDmqWYcGQcHOkoh6AnnjH9QNDXxN7s1JIQr+N0YlwH9a9rFZX87pkTjJnMihC0BbZy5a1cDKHtM1Fm6kwPVopNKfWEfL9uRIx8fFUxkVbvdZ7BHI/Cv0y3iXxkCSKUX3Bm62rBZV+L8vi+GO5JnpPHSzOKOgI=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/msi: Switch msi_info to using pci_sbdf_t
Thread-Topic: [PATCH] x86/msi: Switch msi_info to using pci_sbdf_t
Thread-Index: AQHYraDAO1BrPwl+zkW5rB84Wzymza2q0tqAgAA8uAA=
Date: Fri, 12 Aug 2022 10:22:25 +0000
Message-ID: <498b0a64-4049-00cc-76b5-a1a1aead72c9@citrix.com>
References: <5379b4bb-76c9-d7be-4bd7-2f75dde470a8@suse.com>
 <20220811163740.31494-1-andrew.cooper3@citrix.com>
 <82a9cb69-3a32-3bab-c28a-889bc11570aa@suse.com>
In-Reply-To: <82a9cb69-3a32-3bab-c28a-889bc11570aa@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3838fecb-4920-44a5-b7d9-08da7c4c8d1f
x-ms-traffictypediagnostic: MN2PR03MB5118:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 gXFaTjyt3RGqnhyTNfKm/Xk0S7ca27jk5W2fyOvUdBeZRvpE5NZc+KCc8cuJxm7m3D9cWF5y4BPIYIppIPxwfXGmznalxvvXubmPf7PhVajj0dMCAS/LJORt435Zmw9qAoTcS0kD0GbrMKZUk6plNVJLrlGTMhoH1nIHqtrYNbRrVpta3ibeVfC/n7iUoe1un4+JE8PGFYyMGiS1DcF2iw6rEbRm9nigYivkpyEPsR07/DpTluVkvD0D0pJ1WDvFILCRR1TWXc4Hcp3L53E3XqyYlaIEF8UIW91BOHTEYyyvP9ElPm5DKVoauFvycti/YRpX5+fazWzwaCwEtplTtvuUEsBWAwXe+ZnDKX6JsMm3wqG28XeDuqtfj26/1o5m78kBxgTjySHsDLiTsYU7CvsntsHojloW6tL2NWAotp1Zx76HY0uXDYp75TJDjnImWzaY6+gmrFFKxE1I1/0w5HBj12dFKO4vUiKSgLeLAcdnpY3fDrfq4bXJgkRLHfhZvNKrLrkXYr0c9JRKrAvgn5ZUbJUkoTXndppUwqb7J1QlMEv/qhX9SzdkjUFBgY0Iy38fM7PKeVrb8cYKfQ7w/xUpqRZZzXdVB52W2YfcixB0zYt0fT41uSt5+enq3M6WXJfiTlbXVkKoaFA83I1UVCU5zH/EIqk6b+EZbWpUnMvAA9NIqiB5us6peRJoc3EzZn9j3v31+5L8sdAwbFKobdAJpj+X8fGAuOKWvfv0nYRPbO773hNaXMkjB327SQgFGhHvvjXj2zJ5xqzLxMZpx0Sf1mq4+sgCoDajBhYI/1GaQ+WdZ0oiaC39aqFvlCzUvx80hOw4A13BaflYcymmEnKaf+KHmuDUt+Bivzhh0L+8Nyl/A7daohNXgRj51uPI
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(39860400002)(136003)(396003)(366004)(6486002)(4326008)(64756008)(478600001)(66476007)(66556008)(76116006)(8676002)(6916009)(186003)(66946007)(91956017)(82960400001)(53546011)(54906003)(66446008)(6512007)(41300700001)(26005)(6506007)(31696002)(86362001)(2616005)(38070700005)(316002)(71200400001)(36756003)(122000001)(31686004)(38100700002)(8936002)(4744005)(83380400001)(5660300002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UUVudCtlb1V0Mzd3cCtBaHFXem5MUkMxQ0M1ekl2YmtYeDRDNjRHdGMzWXYz?=
 =?utf-8?B?TU9SQkFsbi9GZ1hTNnVUcXp0dCtXS1NHVkFFbGFoYTNEOUpRVlJ4c3VWVlp0?=
 =?utf-8?B?c1BPd3h4Nk9reEs4dHZaQ0w1cWF0b1VyOUExUUNEc1ZqYjMybjkrSFZEN0FH?=
 =?utf-8?B?d2l6WkhKWHRSaDRLbS8vdkQwemdRbkZrYkVlaXRIT0NRQjNNZVRpSnFER1Jw?=
 =?utf-8?B?blRyWUdheGhuM0tIQ3Fab0wzTktJditRSDNHTEhJZ2pjb2kwOURCY3VnaTJR?=
 =?utf-8?B?dW9SUUxlUUlDTUFXSHlHeVMyclVqcjByYWlENlh1YVNONFRhUUFEVWk1SU5x?=
 =?utf-8?B?b29yWXQ4ZFVpLzIrV2FNWkxuNHZWK3VlSHRLVW00ZzNMbVN4aGFVNGRVTlNz?=
 =?utf-8?B?K2srM1k0eTZURVRzZmV1VGJ2S2R0elExdW5HdXdiRmtzS0ErVUprdjFMU25J?=
 =?utf-8?B?RU8veW5BUVVzWlhlQ0ROOVd2SktRb2xvcGJRT09jaEhjeU9yNWlxZmlEMEZW?=
 =?utf-8?B?dkRVdDBQSkJqdmhuL2RmNEo4Y016MGNLeVNqeEZkTFhnYnFkWEZVNUZDdWVa?=
 =?utf-8?B?aWUwWUI2UmdDWkpyOEhydlpUeXIrT0hMOS9PRnBJSEtYM0RDbm04aFB2WWpL?=
 =?utf-8?B?d29RemVlRnlmcXRLR1RNM2pyenhzU2NOTzlJcDBnNmtoZEdMUFBpNk92eEty?=
 =?utf-8?B?QUJqcWJMZGs3c0lUUEVnbGk2eWJpV01ELzBtZGErWnBtTUY0VSttd2xPSkxU?=
 =?utf-8?B?SmRUZzBKWnZ4UjJHRVpjaHMzcWRCVi80ajlYbnRiRERnblgzc3dPQkF4UlA2?=
 =?utf-8?B?enYwS2pzVERXZ2FIUHFWM1czTmhEK1V6T0Zrd2VVbjVaaGZzcWhHUHBPUTkz?=
 =?utf-8?B?NkJDL3FBT3czd20yWmN4Z3MvbmwrOGZTZFdTRHFzcXFlKzFXSE9qdmxYZXh4?=
 =?utf-8?B?R2FOWmVqQ3BhNmppb2Q4c2xhSXZQTXJ1Q1BLMmQ0Ynp2K2tIWktzSThjMFN0?=
 =?utf-8?B?V3plbmxUZlliYndkTjMyeEJSSUFYRTV2cnBsT1FNNGhOeWxDMW4yNlRZTkdw?=
 =?utf-8?B?UlMvZ1hkNE96L3VlUlJTMlNRMzFnWVRmZTBoZS8xMHZENnVvTXVENEN1Z3Vn?=
 =?utf-8?B?a3VITzBTTDNVT2NWMGovRUphVUJubGk5ZXhmZWxLQUx6bXE0MU4zUXpJYklS?=
 =?utf-8?B?YzBPY2dFL2V3MmZzMXc0K0o0WVRQa1FJVE8vZmdabkRVZUx4TU42c2VEUDdC?=
 =?utf-8?B?Um5CR3Z2ZkhjYjh6TVd6bFYxVXp2Z2ZtQVhuVWNOblR5eXRzYXkzcDdVQ1By?=
 =?utf-8?B?OEtDMG40VTBlVnVCWFpEREwvZ2RBWENKTFo3SVZaSXAyaU9uZTNwWUpNSjg2?=
 =?utf-8?B?RDVRQmVGdWZqNnVuMHVmRldkaVIwcE1FWkYrNVBtcjIzR1I5dzhidkNpeS9L?=
 =?utf-8?B?YXhYS2k2V2FHa0MrQVlBS29uV2pySnVaclFISWtiM0k2Y3Q2ZkZ4djZnRjIy?=
 =?utf-8?B?dE5DVC8zTHlLbko4OStDUCtXM0FDTHlnQVduVEF2VHVxN1BnSGVEU2d1T3hF?=
 =?utf-8?B?Y1k4SHdxSmV5S2JDZldTRFp3SEpRY0VRKy9Gbno2eVFGZDk5dTVORk1sTDE2?=
 =?utf-8?B?eS9ocEZxTXZCMWZHUHMrSTZBaXRHeVVNUXlWWi9tUnJLTjUveTA1QnMza3BW?=
 =?utf-8?B?K3Q3MXVsa1F6WXBIcmd4ZGxjcm1VL1dWd3diQlVGb1BrY011UkJweTBFR3ZR?=
 =?utf-8?B?OFNiYU1LemM3cmFmSWlIWXpPZ0c3cUcxbEEvMUMyTndRa0JxRmEzZ0hFT0Fq?=
 =?utf-8?B?OXBLSkRnSW1RSytjMVg0VVlJUmFnRFFCYTBENlpIaFBQdzBnZFlkRXZ2eWpm?=
 =?utf-8?B?eVVQQ00xZ0pNQWJkeERWN3VwNU9HdUZOTklmcEttUUplSXZ1NWVTdkdINzdi?=
 =?utf-8?B?QUt2ZFdtV0JpZWM5NTRuQXdDRmJoZTB0b2l0NnNkd0hhMXRNMEVHNEpSc1N1?=
 =?utf-8?B?RTRacDhoMGZzRS83U0pVMFk0OXJGaE5CaVZGTldKbVdVN2FkSlN0Y3RyMVBB?=
 =?utf-8?B?bEF0N2x1NitTM25nS3grL2tSUmNySDdVMzlvMUU4MGJWOU04UEM2MmM5L1Q5?=
 =?utf-8?Q?Hu+44ddH696aXuKAt86yNDZ4R?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <59C4141DCA281447A98D1DFDC0D560F0@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QW3KMOQb3Od695gogeFiAIESZCONfXQhkns8Hbnl8LeHdogoHePg98rNXzNY5K+4AYKMbcxd59Cem6dZgThWb4oohHkf2iUTRFkx7AK4leEvEmHOl77VADQqFZSQBeKZl5OwQHZf0g1qLUs8ZuAniCeUVPEQ979XJxvy/jufzK9XR8x19x9VqDJfaWySDog7uRjbsvSbAJ8DVG6tp6ah1KlbIfCeYcHKdWqUB9tEDGBI0g3UhfxcSCtUjE6IMDgyHLoqCxzmjTrioKmr684b2p7ugH1/fm7PJxFDIEkNOwOOXHmNUcMlN8iWH3uV/TciLanNAKTeRWgE6d3HEzqZjEWAMKT1hP+PsRMSJ5PZGchBzM032oBX4+vK/FHgw46SfEOd98jDr29hQCeaauvQ/lhxfOqLWqjyUVHimtXHGvzMEAa3VthN0QvH0neMPiG7gmlXfpuG1+fgJOUK4RVH3oM0pvFotf0npJn9s0JYYC79uDgw36CzgcrC0c57fpME0pUF0pgWiGIDFqyVEFb8XR9Kou8DlDy23j4kRICGDQQe5uX4KpPW4Y0vC64hqWf/6qsaU919CxLb5HsGTVLQ8ZDL/L5bUyaJw40k6QjIjZeofibvE3HmKUIlzJCEIPRP9jSx29arwxNlrgxTPplynzZlKDkJ2Gbu9wViNcxE9NR6bjhpo+UdADwFeUMesoJrAwHcZDepMfqS0kXNq0HLQm3vA6qwuBzitSIZS+1usAprZ3JR9gCJzt+ctItMy4WS+iG5dQ75GNPTfFv7OeXLnxaAfK43IsMIKPunJhmAQGZhRGJ/nvC5O74IuocWEjsE
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3838fecb-4920-44a5-b7d9-08da7c4c8d1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2022 10:22:25.2746
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JL8Z7SBaPMrffOGTdqgweopyrK47oy9TPKFEeji7GB1fz4V5bnbHt2z36MN+45CUMWs67Fx1/agOtVLhyvleGviiujM2dY/Yo5uq7h5Q4ZY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5118

T24gMTIvMDgvMjAyMiAwNzo0NSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDExLjA4LjIwMjIg
MTg6MzcsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBUaGlzIHJlb3JkZXJzIHRoZSBmaWVsZHMg
aW4gbXNpX2luZm8sIGJ1dCByZW1vdmVzIGFsbCB0aGUgdW5kZXItdGhlLWhvb2QNCj4+IHBhcmFt
ZXRlciBzaHVmZmxpbmcgcmVxdWlyZWQgdG8gY2FsbCBwY2lfZ2V0X3BkZXYoKS4NCj4+DQo+PiBO
byBmdW5jdGlvbmFsIGNoYW5nZS4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiBPaCwgeW91J3ZlIG1hZGUgdGhlIHJlcXVl
c3RlZCBjaGFuZ2UgeW91cnNlbGYgLSB0aGFua3MhDQoNCkkgbG9va2VkIGF0IHRoZSBjb2RlIGFu
ZCBkZWNpZGVkIGl0IHdhcyBzaW1wbGUgZW5vdWdoLg0KDQpXaGlsZSBkb2luZyBpdCwgaXQgYmVj
YW1lIGNsZWFyIHRoYXQgdWFydC0+cHNfYmRmWzAuLjJdIGlzIGluIGRlc3BlcmF0ZQ0KbmVlZCB0
b28sIGJ1dCB0aGF0IHdhcyBtb3JlIGNvbXBsaWNhdGVkIHRoYW4gSSBoYWQgdGltZSBmb3IuDQoN
Cj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KVGhhbmtz
Lg0K

