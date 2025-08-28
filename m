Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4676BB39F3E
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 15:43:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1098883.1452824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urcuC-0008Rc-Vf; Thu, 28 Aug 2025 13:43:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1098883.1452824; Thu, 28 Aug 2025 13:43:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urcuC-0008Ox-Ss; Thu, 28 Aug 2025 13:43:08 +0000
Received: by outflank-mailman (input) for mailman id 1098883;
 Thu, 28 Aug 2025 13:43:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q4L6=3I=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1urcuA-0008Ok-J7
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 13:43:06 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ecd009c7-8414-11f0-8adc-4578a1afcccb;
 Thu, 28 Aug 2025 15:43:05 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-afcb78ead12so152057766b.1
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 06:43:05 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe8a9f0c81sm796976866b.22.2025.08.28.06.43.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 06:43:04 -0700 (PDT)
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
X-Inumbo-ID: ecd009c7-8414-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756388585; x=1756993385; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p08cG2EJ9QuAUBqLPYqinbjdVcdwpL6KV8C8p+HyE8E=;
        b=iSM8XOQJ2JG1PTFs6xrhHmx3Wp+zJiLIGR0UTEJYXggARYbMFUhjKkG7pFYR93RqpW
         XPo1BexBjN0mTfJ4lCr8D2/m/3Y+PrROC2U8tRSKPx75/gjoiJsxD14d4EeQCXqjHC7F
         ix+nnnbB1ui0JsIYcVptLR61sGTgpfzDbsTvSjSg1n25dj0iWE1XS1GItLRtv3993pDB
         NI4RNAHf7c2sBFy7DFmSvXx2l7hf3MAWTjxrEcdLuam5RP7tn7z3jqiYss5l6NgDTkSC
         zhsw+LbqXQpIffNrQMsmmUPcvsJyAxI6IebelSJ9E7f9byBgVoNw8gznDd30pobzVE1w
         klrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756388585; x=1756993385;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=p08cG2EJ9QuAUBqLPYqinbjdVcdwpL6KV8C8p+HyE8E=;
        b=GfNdXHQjHBU8j52Dthbfgl6ILmBCziv1/qb5Lf5+sgs++ezyRzSnYHo+769nX/Xskw
         j4Me7ANPZ5cVvG9TXkhCJH6vx+A3eU60WLcAEDgl4tmL1oR15yq+lcOVPkUcYcCFJVvR
         F3cjyEfdZnGufewj+JdfGBAujD/3K77KIclh6SRe6oVfB9QWItvNFZKdaQW7/pqC9ssO
         WOgILd9f4fQ91kZwsGoG8OmxBLuP6Y/s9WnXKQ8b25Gt8FKYcbCYyiA3apgBcqdBT4xW
         4iAvudncQ0NtQC7/sXmBxQu+4a2Y85frSB9sqgr5ODaGCODXTtldX1g/VPVLgL8w2act
         7wRA==
X-Forwarded-Encrypted: i=1; AJvYcCUaB7WZYUC6XZaZqfi9r46ok3n5nNwuFYPbM6UzPeJpYYtD80blexlfBWm5MopsIpRLRWJRiGUSRSg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx9EEy35A2u8V2W8qLH/MEtM1u/vigdmzbQZOGNWtfDFyIDPeay
	GTIn3EDhiTYBdX+nqXy9ke17HD1NyQqFSPne3tOf1hN3dG0/jFjYVw54
X-Gm-Gg: ASbGncsY7O/XOF0nbM7jH1yL8ewytY+DlY6GgZrgxfTq8MFoH3lP7L7fdy6c206x/bp
	bbfivI3+QvVpFJEmZHTxy22DJzY+rQqNdD/KlL4EavDhnJhCOFzCu4hibb9tVLqXD1a7gndRBpT
	17l6kwUwUWSKeypR16T+P5CEXksZtqlx6tgc0nvCokkndkti1kmUOosLdL0BpC4PwOHhqpsB4T3
	Bwj19CgmDb4iYWvWmo2ezRGFd9FADHXrTvGqITAIrTMAPb+iX+aA7PzDWwZNlUEYjcumhJC7104
	SvW6Iqx+YghInS8MEaDXbJ+CdT+FmAOaa1IQ0POL8dJSvJzZkfuQ6akrXUrlyIhiDAFN3yWzgBb
	cqJ4Du4UC+F4Oqwf883cEDhkty/KY3ivJKHuz5fgk5yaNc8MNbv8ET1PAcLcqoMrXfSLaQxpbzl
	LKstdwtQ==
X-Google-Smtp-Source: AGHT+IHSScj9ulx10Lu/FIS90qteHxu4c2+3gEzyD8Axq8ts7HEgWw+75PKPfoK/kY9XQKi9WMwgpQ==
X-Received: by 2002:a17:907:6096:b0:afe:8037:bc7d with SMTP id a640c23a62f3a-afe8037c1a3mr1368827766b.2.1756388584742;
        Thu, 28 Aug 2025 06:43:04 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------mvC54Y60ARKGqTcDKCs3snMe"
Message-ID: <3c365d64-939e-489f-ba78-ac9ea5311a6b@gmail.com>
Date: Thu, 28 Aug 2025 15:43:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Reminder] Feature Freeze is Fri Aug 29, 2025
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Community Manager <community.manager@xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>
References: <07fc7122-d0ac-4dbe-800d-89086a07005b@gmail.com>
 <e31bcf2b-50f9-42ca-ad17-e746652c1dd2@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <e31bcf2b-50f9-42ca-ad17-e746652c1dd2@citrix.com>

This is a multi-part message in MIME format.
--------------mvC54Y60ARKGqTcDKCs3snMe
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 8/26/25 9:12 PM, Andrew Cooper wrote:
> On 25/08/2025 4:50 pm, Oleksii Kurochko wrote:
>> Hello community,
>>
>> I’d like to remind everyone that the Feature Freeze deadline is approaching,
>> and we still have some outstanding requests from the community for patch series
>> to be merged into 4.21:
>>
>> 1. Enable guest suspend/resume support on ARM via vPSCI [1]
>> 2. Introduce SCI SCMI SMC multi-agent support [2]
>> 3. Introduce eSPI support [3]
>> 4. FRED work: [4], [5], possibly others (?)
> For FRED, That's all that's out on the list.
>
> I've got an update to 4 almost ready to post, this time getting to dev
> complete.
>
> Unfortunately, I've still not managed to get any time on real hardware
> yet, so FRED will still be experimental in my series.  (The timelines
> were originally compatible with Xen 4.21, but access to hardware has not
> been as forthcoming as hoped.)
>
> When I can test on real hardware, there may be bugfixes, and I may be
> able to upgrade the status if we're not too far into the RCs.

Sounds good to me. Let’s wait until you’re able to test it on real hardware.
We’ll have some extra time during the Feature Freeze period, and the RCs
will be moved as well. I’ll announce this a little later today.

~ Oleksii

>
> ~Andrew
--------------mvC54Y60ARKGqTcDKCs3snMe
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/26/25 9:12 PM, Andrew Cooper
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:e31bcf2b-50f9-42ca-ad17-e746652c1dd2@citrix.com">
      <pre wrap="" class="moz-quote-pre">On 25/08/2025 4:50 pm, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Hello community,

I’d like to remind everyone that the Feature Freeze deadline is approaching,
and we still have some outstanding requests from the community for patch series
to be merged into 4.21:

1. Enable guest suspend/resume support on ARM via vPSCI [1]
2. Introduce SCI SCMI SMC multi-agent support [2]
3. Introduce eSPI support [3]
4. FRED work: [4], [5], possibly others (?)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
For FRED, That's all that's out on the list.

I've got an update to 4 almost ready to post, this time getting to dev
complete.

Unfortunately, I've still not managed to get any time on real hardware
yet, so FRED will still be experimental in my series.  (The timelines
were originally compatible with Xen 4.21, but access to hardware has not
been as forthcoming as hoped.)

When I can test on real hardware, there may be bugfixes, and I may be
able to upgrade the status if we're not too far into the RCs.</pre>
    </blockquote>
    <pre>Sounds good to me. Let’s wait until you’re able to test it on real hardware.
We’ll have some extra time during the Feature Freeze period, and the RCs
will be moved as well. I’ll announce this a little later today.

~ Oleksii

</pre>
    <blockquote type="cite"
      cite="mid:e31bcf2b-50f9-42ca-ad17-e746652c1dd2@citrix.com">
      <pre wrap="" class="moz-quote-pre">

~Andrew
</pre>
    </blockquote>
  </body>
</html>

--------------mvC54Y60ARKGqTcDKCs3snMe--

